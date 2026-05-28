# 05. 임베디드 제어 — Arduino Nano 33 IoT

> Arduino Nano 33 IoT + ArduinoBLE 라이브러리로 BLE 기반 모터 제어 시스템을 구현한 프로젝트 기록입니다.

---

## 대화 목록

| # | 제목 | 핵심 내용 |
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
