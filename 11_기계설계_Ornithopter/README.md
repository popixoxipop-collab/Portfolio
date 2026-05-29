# 11. 기계설계 — Ornithopter (날갯짓 비행체)

> 기계설계 과목 팀 프로젝트. 새의 날갯짓(flapping) 메커니즘을 모사한 **오니솝터**를 주제로, 생체 모방 분석 → SolidWorks 날개/기구 모델링 → 서보모터 구동 코드까지 수행했습니다.

---

## 프로젝트 개요

| 단계 | 내용 |
|------|------|
| 생체 모방 분석 | 새의 날개·근육 구조 분석(깃털·근육 모식도) → 날갯짓 운동 모델링 |
| 기구 설계 | 날개 파트(`wingpart.SLDPRT`) 및 어셈블리 모델링 (SolidWorks) |
| 구동 | 다중 서보모터로 날개 섹션을 순차 구동(flapping 시퀀스) |
| 문서화 | 팀 프로젝트 기획서·결과 보고서(PDF) |

---

## 구동 코드 — 5개 서보 순차 제어 (Arduino)

각 날개 섹션을 담당하는 5개 서보를 0°↔90°로 왕복시켜 날갯짓 동작을 생성. 동작 시에만 `attach`하고 끝나면 `detach`하여 떨림(jitter)과 전력 소모를 줄이는 방식.

```cpp
#include <Servo.h>
#define servoPin1 3
... // servoPin2~5 = 5,6,9,10
Servo servo1; ... Servo servo5;

void servo1_OFF() {                 // 0° → 90°
  servo1.attach(servoPin1);
  for (int angle = 0; angle <= 90; angle++) { servo1.write(angle); delay(10); }
  servo1.detach();
}
void servo1_ON()  {                 // 90° → 0°
  servo1.attach(servoPin1);
  for (int angle = 90; angle >= 0; angle--) { servo1.write(angle); delay(10); }
  servo1.detach();
}
// loop(): servo1~5를 1초 간격으로 OFF→ON 순차 구동
```

---

## 산출물

| 파일 | 내용 |
|------|------|
| `원본/대표작/Ornithopter_대표어셈블리.SLDASM` | 대표 어셈블리 모델 |
| `원본/대표작/chpt0-Team_project-birds_2024.pdf` | 팀 프로젝트 기획/발표 자료 |
| `원본/대표작/기소설계2_프로젝트(1).pdf` | 기계설계 프로젝트 보고서 |
| `원본/Ornithopter 설계모델/wingpart.SLDPRT`, `wingpart1.SLDPRT` | 날개 파트 모델 |
| `원본/Ornithopter 설계모델/#include Servo.h.txt` | 5축 서보 구동 코드 |
| `원본/Ornithopter 설계모델/깃털과 근육.png`, `새 날개 근육.jpg` | 생체 모방 분석 자료 |

---

## 배운 점

- 생체 구조를 기계 기구로 **추상화·단순화**하는 설계적 사고.
- SolidWorks로 곡면 날개 파트를 모델링하고 어셈블리 구속을 부여하는 경험.
- 서보 `attach/detach` 제어로 다축 동기 동작을 안정적으로 구현.
