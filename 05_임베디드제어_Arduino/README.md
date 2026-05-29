# 05. 임베디드 제어 — Arduino Nano 33 IoT

> Arduino Nano 33 IoT + ArduinoBLE 라이브러리로 BLE 기반 모터 제어 시스템을 구현한 프로젝트 기록입니다.

---

## 주요 학습·구현 항목

| # | 주제 | 핵심 내용 |
|---|------|-----------|
| 1 | 나노33 IoT 모터 제어 | L9110 드라이버 + BLE 스마트폰 제어 |
| 2 | Arduino Nano 33 IoT BLE | BLE Peripheral 설정, 기본 통신 구조 |
| 3 | BLE 드론 모터 제어 | 드론 서비스 UUID, 모터 PWM 원격 제어 |

---

## 하드웨어 구성

| 부품 | 역할 |
|------|------|
| Arduino Nano 33 IoT | MCU + BLE 통신 |
| L9110 모터 드라이버 | DC 모터 H-bridge 제어 |
| DC 모터 A | 상하 운동 (0.3초 펄스) |
| DC 모터 B | 연속 회전 (스로틀) |
| 스마트폰 | BLE Central (제어 앱) |

---

## 핵심 코드

### 1. BLE 모터 제어 기본 구조

```cpp
#include <ArduinoBLE.h>

// UUID 정의
BLEService DroneService("19B10000-E8F2-537E-4F6C-D104768A1214");
BLEByteCharacteristic switchChar("19B10001-E8F2-537E-4F6C-D104768A1214",
                                  BLERead | BLEWrite);

// 모터 핀 (L9110)
const int MOTOR_A1 = 2;  // 상하 모터
const int MOTOR_A2 = 3;
const int MOTOR_B1 = 5;  // 연속 모터
const int MOTOR_B2 = 6;

void setup() {
  pinMode(MOTOR_A1, OUTPUT);
  pinMode(MOTOR_A2, OUTPUT);
  pinMode(MOTOR_B1, OUTPUT);
  pinMode(MOTOR_B2, OUTPUT);

  BLE.begin();
  BLE.setLocalName("DroneControl");
  BLE.setAdvertisedService(DroneService);
  DroneService.addCharacteristic(switchChar);
  BLE.addService(DroneService);
  BLE.advertise();
}
```

### 2. 모터 제어 로직

```cpp
void loop() {
  BLEDevice central = BLE.central();

  if (central) {
    while (central.connected()) {
      if (switchChar.written()) {
        byte cmd = switchChar.value();

        switch (cmd) {
          case 0x01:  // 상하 모터 0.3초 동작
            digitalWrite(MOTOR_A1, HIGH);
            digitalWrite(MOTOR_A2, LOW);
            delay(300);
            digitalWrite(MOTOR_A1, LOW);
            break;

          case 0x02:  // 연속 모터 ON
            digitalWrite(MOTOR_B1, HIGH);
            digitalWrite(MOTOR_B2, LOW);
            break;

          case 0x00:  // 정지
            digitalWrite(MOTOR_B1, LOW);
            digitalWrite(MOTOR_B2, LOW);
            break;
        }
      }
    }
  }
}
```

### 3. L9110 모터 드라이버 핀 매핑

```
L9110 핀  → Arduino 핀  → 동작
IA        → D2          → 모터A 정방향
IB        → D3          → 모터A 역방향
IC        → D5          → 모터B 정방향
ID        → D6          → 모터B 역방향

PWM 속도 제어:
  analogWrite(MOTOR_B1, 128);  // 50% 속도
  analogWrite(MOTOR_B1, 255);  // 100% 속도
```

---

## BLE 통신 구조

```
[스마트폰 App]          [Arduino Nano 33 IoT]
     │                           │
     │  BLE Advertising 감지      │
     │ ◄────────────────────────  │
     │                           │
     │  Connect (Central→Peripheral)
     │ ────────────────────────► │
     │                           │
     │  Write Characteristic     │
     │  (cmd byte: 0x01/02/00)   │
     │ ────────────────────────► │
     │                           │
     │                     모터 제어
     │                     PWM 출력
```

| 명령 byte | 동작 |
|-----------|------|
| `0x01` | 상하 모터 0.3초 펄스 |
| `0x02` | 연속 모터 ON |
| `0x00` | 전체 모터 정지 |

---

## 핵심 라이브러리

| 라이브러리 | 버전 | 용도 |
|-----------|------|------|
| ArduinoBLE | ≥ 1.3.0 | BLE Peripheral/Central |
| Wire | 내장 | I²C 통신 |
| Arduino | 내장 | GPIO, PWM |

---

## 드론 제어 확장 (BLE 드론)

```cpp
// 드론 서비스 UUID (128-bit)
"19B10000-E8F2-537E-4F6C-D104768A1214"

// 제어 특성
BLEByteCharacteristic throttle("...0001...", BLERead | BLEWrite);  // 스로틀
BLEByteCharacteristic pitch   ("...0002...", BLERead | BLEWrite);  // 피치
BLEByteCharacteristic roll    ("...0003...", BLERead | BLEWrite);  // 롤
BLEByteCharacteristic yaw     ("...0004...", BLERead | BLEWrite);  // 요
```

---

## 📦 원본 자료 — Arduino · 드론 · BLE

실제 작성한 스케치, 조이스틱 드론 송수신 소스 분석, Fritzing 회로 부품, 드론 부품 BOM을 포함합니다.

### 대표 스케치 (`ArduinoBLE` 모터 제어)

`switchCharacteristic` 1바이트의 비트 플래그로 두 모터를 제어 — 메인 모터(bit0)와 방향타 모터(bit1)를 분리 구동.

```cpp
uint8_t value = switchCharacteristic.value();
if (value & 0x01) { analogWrite(M11, speed); analogWrite(M12, 0); }   // 메인 모터
else              { analogWrite(M11, 0);     analogWrite(M12, 0); }
if (value & 0x02) { analogWrite(M21, speed); analogWrite(M22, 0); }   // 방향타 모터
else              { analogWrite(M21, 0);     analogWrite(M22, 0); }
```

### 조이스틱 드론 소스 분석

상용 조이스틱-드론 펌웨어를 기능 단위(15단계+)로 쪼개 분석한 학습 자료 — Debug → Define → Variable → ADC → Checksum → BT-Connect → DataPacket → Drone Shield 까지 통신 패킷 구조를 단계별로 추적.
- `Arduino_드론_BLE_원본/Joystick_Drone_소스분석/` 참고

### 회로 · 부품

| 자료 | 내용 |
|------|------|
| `Arduino_드론_BLE_원본/cir.fzz` | Fritzing 회로 |
| `Arduino_드론_BLE_원본/Fritzing 사용자부품/*.fzp` | DJI 30A ESC, Adafruit 모듈 등 사용자 부품 |
| `Arduino_드론_BLE_원본/대표작/드론 부품.xlsx` | 드론 부품 BOM(브러시리스 모터·ESC·MPU6050·Pixy2 등) |

> Pixy2 SDK(`pixy2-master.zip`, 약 82MB)는 용량 문제로 저장소에서 제외했습니다(Pixy2 공식 배포본).

### 파일 안내

```
Arduino_드론_BLE_원본/
├─ 대표작/                       대표 스케치(.ino), 드론 부품 BOM, ESC 부품
├─ Arduino_스케치_2024-11-10/    BLE 모터 제어 스케치
├─ Joystick_Drone_소스분석/       조이스틱 드론 펌웨어 단계별 분석
├─ Fritzing 사용자부품/           사용자 정의 .fzp 부품
└─ *.fzpz / *.fzz                Fritzing 회로·부품
```

