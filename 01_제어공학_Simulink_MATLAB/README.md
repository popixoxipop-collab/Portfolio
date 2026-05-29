# 01. 제어공학 — Simulink · MATLAB

> Kalman Filter 구현, Simulink 모델링, 파이프라인 제어기 설계 등 제어공학 핵심 주제를 직접 학습하고 구현한 기록입니다.

---

## 주요 학습·구현 항목

| # | 주제 | 핵심 내용 |
|---|------|-----------|
| 1 | Simulink Kalman Filter | Simulink에서 Kalman Filter 기본 구조 구현 |
| 2 | Simulink Kalman Filter 설정 | 행렬 Q, R, P₀ 초기값 설정 방법 |
| 3 | Kalman Filter 수정사항 | 예측·업데이트 단계 분리 및 오류 수정 |
| 4 | Simulink 관측 업데이트 | 관측 행렬 H, 칼만 이득 K 계산 |
| 5 | Simulink vs Manual KF | 수동 MATLAB 코드와 Simulink 블록 결과 비교 |
| 6 | Simulink vs MATLAB 비교 | 두 구현 방식의 수치 결과 검증 |
| 7 | Simulink 시각화 방법 | Scope 블록 설정, 다채널 신호 시각화 |
| 8 | Simulink Scope 문제 해결 | Scope 출력 누락·축 범위 오류 디버깅 |
| 9 | Simulink 역행렬 구하기 | Math Operations → Matrix Inverse 블록 활용 |
| 10 | Simulink 변수 입력 방법 | Workspace → Constant 블록 변수 연결 |
| 11 | 시뮬링크 함수 가공 | MATLAB Function 블록으로 커스텀 함수 구현 |
| 12 | Simulink 1/x 구현 방법 | Divide / Reciprocal 블록으로 역수 계산 |
| 13 | MATLAB 파일 로드 방법 | `load()`, `uigetfile()` 데이터 로드 패턴 |
| 14 | MATLAB 코드 작성 | 행렬 연산 및 플로팅 스크립트 작성 |
| 15 | MATLAB density 함수 오류 | `ksdensity` 인수 오류 디버깅 |
| 16 | Pipeline depth controller 설계 | Simulink 기반 파이프라인 압력·깊이 제어 루프 |

---

## 핵심 개념 정리

### Kalman Filter 구조

```
[예측 단계]
x̂⁻ₖ = A · x̂ₖ₋₁ + B · uₖ
P⁻ₖ  = A · Pₖ₋₁ · Aᵀ + Q

[업데이트 단계]
Kₖ   = P⁻ₖ · Hᵀ · (H · P⁻ₖ · Hᵀ + R)⁻¹
x̂ₖ  = x̂⁻ₖ + Kₖ · (zₖ − H · x̂⁻ₖ)
Pₖ   = (I − Kₖ · H) · P⁻ₖ
```

| 기호 | 의미 |
|------|------|
| A | 상태 전이 행렬 |
| B | 입력 행렬 |
| H | 관측 행렬 |
| Q | 프로세스 노이즈 공분산 |
| R | 측정 노이즈 공분산 |
| P | 오차 공분산 행렬 |
| K | 칼만 이득 |

---

### Simulink 주요 블록

| 블록 | 용도 |
|------|------|
| `Matrix Multiply` | 행렬 곱 (A·x) |
| `Matrix Inverse` | 역행렬 (P⁻¹) |
| `Transpose` | 전치 행렬 (Aᵀ) |
| `MATLAB Function` | 커스텀 수식 직접 코딩 |
| `Unit Delay` | 이전 스텝 값 보존 (x̂ₖ₋₁) |
| `Scope` | 신호 시각화 |
| `Constant` | 행렬 상수 (Q, R 등) 입력 |
| `Divide` | 역수 / 나눗셈 |

---

### Simulink vs MATLAB 수동 구현 비교

| 항목 | Simulink | MATLAB Script |
|------|----------|---------------|
| 구현 방식 | 블록 다이어그램 | 행렬 수식 직접 작성 |
| 디버깅 | Scope로 중간 신호 실시간 확인 | `disp`, `plot` |
| 재사용성 | 서브시스템으로 모듈화 | 함수 파일 분리 |
| 수치 검증 | 블록 출력 vs 스크립트 값 비교 | — |

---

### Pipeline Depth Controller

```
목표: 파이프라인 내 유체 깊이(depth) 제어
구조: 센서 측정값 → Kalman Filter → PID 제어기 → 밸브/펌프 액추에이터

제어 루프 (Simulink):
  [Depth Reference] ──► [Sum] ──► [PID] ──► [Plant Model]
                          ▲                        │
                          └──── [KF Estimator] ◄──┘
```

---

## 관련 파일

- `KF.slx` — Kalman Filter Simulink 모델
- `KF_202017085.slx` — 학번 기반 개인 구현본
- `KF_Problem2to4.slx` — 문제 2~4 풀이
- `KF_Problem5.slx` — 문제 5 풀이

> 파일 위치: `~/KF*.slx` (홈 디렉토리)
