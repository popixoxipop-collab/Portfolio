# 기계공학과 포트폴리오

> GPT 대화내역 기반으로 정리한 기계공학 과목별 학습 및 프로젝트 포트폴리오입니다.

**GitHub:** https://github.com/popixoxipop-collab/Portfolio

---

## 목차

| # | 분야 | 주요 내용 | 대화 건수 |
|---|------|-----------|----------|
| 01 | [제어공학 / Simulink · MATLAB](./01_제어공학_Simulink_MATLAB/README.md) | Kalman Filter, Simulink 모델링, 파이프라인 제어기 설계 | 16건 |
| 02 | [열유체공학 / 냉난방 부하](./02_열유체공학_냉난방부하/README.md) | CLTD 법, ASHRAE 기준 냉방부하 계산, AHU·FCU 설계 | 6건 |
| 03 | [동역학 / DC 모터](./03_동역학_DC모터/README.md) | PM Servomotor 수식, 기어 토크·주파수, Torsion | 4건 |
| 04 | [재료역학 / 기계요소](./04_재료역학_기계요소/README.md) | 면적 관성모멘트, Plane Strain 응력, 단면 2차 모멘트 | 3건 |
| 05 | [임베디드 제어 / Arduino](./05_임베디드제어_Arduino/README.md) | Arduino Nano 33 IoT BLE, L9110 모터 드라이버, 드론 제어 | 3건 |
| 06 | [제조공학 / CNC](./06_제조공학_CNC/README.md) | DIY CNC 부품 설계, CATIA 모델링, 기계공작실 도면 | 2건 |
| 07 | [도면 · 축척 · 계측](./07_도면_축척_계측/README.md) | 건축 도면 축척 계산, 외벽 면적 분석 | 2건 |

---

## 기술 스택

- **시뮬레이션**: MATLAB / Simulink
- **임베디드**: Arduino (Nano 33 IoT), ArduinoBLE, L9110
- **설계**: CATIA, AutoCAD
- **계산**: ASHRAE CLTD 법, 열부하 계산, 재료역학 공식
- **언어**: C/C++ (Arduino), MATLAB Script

---

## 주요 프로젝트 하이라이트

### 🔵 Kalman Filter — Simulink 구현
> Simulink에서 관측 업데이트·예측 단계를 분리 구현. 수동(MATLAB 스크립트) 방식과 비교 검증.

### 🟠 냉난방 부하 계산 — CLTD 법
> ASHRAE Fundamentals 기반 외부 지붕·벽체·창문·외기·내부 발열 항목별 냉방부하 계산표 작성. 전주 기준 외기 설계 조건 적용.

### 🟢 BLE 드론 모터 제어 — Arduino
> Arduino Nano 33 IoT + ArduinoBLE로 스마트폰 원격 제어 드론 구현. L9110 모터 드라이버 PWM 제어.

### 🔴 Pipeline Depth Controller 설계
> Simulink 기반 파이프라인 압력·깊이 제어 루프 설계.
