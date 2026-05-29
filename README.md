# 포트폴리오 — 노경천

> 학부 기계공학 과정에서 수행한 설계·해석·실험·임베디드 제어 프로젝트를 **분야별**로 정리한 포트폴리오입니다.
> 각 분야 README에는 개념 정리와 함께, 실제 수행한 **원본 산출물**(소스코드·CAD·보고서·발표자료·영상)을 함께 담았습니다.

**GitHub:** https://github.com/popixoxipop-collab/Portfolio
**발표자료:**
- [`발표자료/포트폴리오_노경천.pptx`](./발표자료/포트폴리오_노경천.pptx) — 개인 포트폴리오 덱
- [`발표자료/포트폴리오_노경천_고도화_Gamma.pptx`](./발표자료/포트폴리오_노경천_고도화_Gamma.pptx) — 원본 기준 상향 통합본 ([Gamma에서 보기](https://gamma.app/docs/tviofk0tgnbd7ve)) 


---

## 목차

| # | 분야 | 주요 내용 | 대표 산출물 |
|---|------|-----------|-------------|
| 01 | [제어공학 / Simulink · MATLAB](./01_제어공학_Simulink_MATLAB/README.md) | Kalman Filter, Simulink 모델링, 파이프라인 제어기 설계 | `KF*.slx` |
| 02 | [열유체공학 / 냉난방부하 · 열전달실험](./02_열유체공학_냉난방부하/README.md) | CLTD 냉방부하 계산 + 열전도도·파이프 에너지손실 실험 | 실험 보고서 PDF |
| 03 | [동역학 / DC 모터](./03_동역학_DC모터/README.md) | PM Servomotor 수식, 기어 토크·주파수 | — |
| 04 | [재료역학 · 구조해석 (ANSYS)](./04_재료역학_기계요소/README.md) | 단면 2차 모멘트 + ANSYS 정적 구조해석(응력·변형) | ANSYS Workbench 프로젝트 |
| 05 | [임베디드 제어 / Arduino · 드론 · BLE](./05_임베디드제어_Arduino/README.md) | ArduinoBLE 드론 모터 무선제어, 회로·부품 설계 | `.ino`, Fritzing |
| 06 | [제조공학 / CNC 설계](./06_제조공학_CNC/README.md) | CNC 3040 메탈 프레임 SolidWorks 어셈블리·부품선정·정적해석 | `.SLDASM`, BOM |
| 07 | [도면 · 축척 · 계측](./07_도면_축척_계측/README.md) | 건축 도면 축척 계산, 면적 분석 | — |
| 08 | [수치해석 / MATLAB](./08_수치해석_MATLAB/README.md) | ODE 解法(오일러·중점·RK4), 수치적분, 보간·회귀, 근 찾기 | `.m` 다수 |
| 09 | [기계진동학](./09_기계진동학/README.md) | 1자유도계 강제·지지 진동 변위응답·힘 전달률 분석 | `.m`, `.fig` |
| 10 | [메카트로닉스 / ATmega128](./10_메카트로닉스_ATmega128/README.md) | 컵 비율 측정기, 엘리베이터 FND 제어 (AVR-C, 인터럽트) | 제어코드, 발표자료, 영상 |
| 11 | [기계설계 / Ornithopter](./11_기계설계_Ornithopter/README.md) | 새 날갯짓 모사 팀 설계 프로젝트(모델링+서보 구동) | `.SLDPRT/.SLDASM` |
| 12 | [전공진로설계](./12_전공진로설계/README.md) | 전공·진로 설계 활동 정리 | 활동 문서 |

> 각 분야 문서는 **개념 정리**와 **실제 산출물**(소스코드·CAD·보고서·발표·영상)을 함께 연결해, 이론 이해와 구현 경험을 한 번에 확인할 수 있도록 구성했습니다.

### 부록 — AI · 데이터 (KT 에이블스쿨 미니프로젝트)

기계공학 전공과 별개로, KT 에이블스쿨(AIVLE)에서 수행한 **AI·데이터·웹개발** 프로젝트입니다.

| # | 분야 | 한 줄 소개 | 대표 산출물 |
|---|------|-----------|-------------|
| 13 | [데이터 분석 — 고객 만족도 예측](./13_데이터분석_고객만족도예측/README.md) | 고객 만족도 예측·서비스 개선 데이터 분석 (미션 1~8) | 발표·회의록 |
| 14 | [AI 에이전트 — AI 강사](./14_AI에이전트_AI강사/README.md) | 슬라이드→강의 스크립트·음성·영상 생성 LLM Agent | `.ipynb` |
| 15 | [AI 에이전트 — 상품 리뷰 분석](./15_AI에이전트_상품리뷰분석/README.md) | LangSmith 모니터링·고도화·streamlit 대시보드 | `.ipynb`, 설계문서 |
| 16 | [웹 개발 — 도서 표지 AI 서비스 (Pic:Story)](./16_웹개발_도서표지AI서비스/README.md) | React 풀스택 + OpenAI GPT Image 표지 자동 생성 | React 앱 |

---

## 기술 스택

- **설계 (CAD)**: SolidWorks (CNC 프레임, Ornithopter 날개), CATIA, AutoCAD
- **해석 (CAE/FEM)**: ANSYS Workbench(정적 구조해석), SolidWorks Simulation, MATLAB(진동·수치해석)
- **시뮬레이션**: MATLAB / Simulink (Kalman Filter, 제어 루프)
- **임베디드**: ATmega128(AVR-C), Arduino(Nano 33 IoT), ArduinoBLE, L9110
- **센서·계측**: 초음파(HC-SR04), 조도(CdS), MPU6050, Pixy2
- **실험·데이터 분석**: 열전달·유체 실험, Excel / MATLAB 회귀분석
- **회로 설계**: Fritzing, 부품 선정(BOM)
- **AI · 데이터 (KT 에이블스쿨)**: Python, LLM Agent(LangGraph·LangSmith), gradio·streamlit, OpenAI API, 데이터 분석/시각화
- **웹 개발**: React 19 · Vite · axios · MUI, json-server(REST), Vercel
- **언어**: C/C++ (AVR, Arduino), MATLAB Script, Python, JavaScript(JSX)

---

## 주요 프로젝트 하이라이트

### 🔵 컵 비율 측정기 — ATmega128 메카트로닉스
> HC-SR04 초음파 거리센서와 CdS 조도센서로 컵에 담긴 액체의 비율(%)을 측정하고 CLCD에 표시. 인터럽트 기반 상태 제어. 발표·시연영상·완성 제어코드 포함. → [10번](./10_메카트로닉스_ATmega128/README.md)

### 🟢 BLE 드론 모터 제어 — Arduino
> ArduinoBLE로 스마트폰↔드론 무선 제어 구현. 모터 PWM 제어, 조이스틱 드론 소스 분석, Fritzing 회로 및 부품 BOM. → [05번](./05_임베디드제어_Arduino/README.md)

### 🟣 CNC 3040 메탈 프레임 — SolidWorks 설계·해석
> 리니어 가이드·볼스크류·스핀들로 구성한 CNC 전체 어셈블리 모델링, 부품 선정/구매 자료, 정적 구조 해석. → [06번](./06_제조공학_CNC/README.md)

### 🟠 ANSYS 정적 구조해석
> 스프링·발사체 등 부재의 응력·변형 해석(Static Structural). Workbench 프로젝트 일체. → [04번](./04_재료역학_기계요소/README.md)

### 🟡 기계진동학 — 강제·지지 진동 응답
> 1자유도계의 변위 진폭 |X(ω)|와 힘 전달률 F_T를 감쇠비·강성·질량 파라미터별로 MATLAB 분석. → [09번](./09_기계진동학/README.md)

### ⚪ 수치해석 — ODE·적분·보간
> 오일러/중점/RK4 解法 비교, 사다리꼴·심슨 적분, 스플라인 보간·회귀를 MATLAB로 구현. → [08번](./08_수치해석_MATLAB/README.md)

### 🔴 Kalman Filter — Simulink 구현
> Simulink에서 예측·관측 업데이트 단계 분리 구현, 수동 MATLAB 코드와 비교 검증. → [01번](./01_제어공학_Simulink_MATLAB/README.md)

---

## 타깃 직무 · 재사용 가능한 역량

> 강의 기준(기업 문제 중심)에 맞춰, 지원 직무와 그 직무의 문제를 풀 수 있는 *재사용 가능한 역량*을 저장소 근거와 함께 정리했습니다.

| 타깃 직무 | 직무가 푸는 문제 | 보유 역량(재사용 가능) | 근거 프로젝트 |
|-----------|------------------|------------------------|----------------|
| 기구 설계 · CAE | 부품이 하중·진동을 견디는가, 어떻게 설계할까 | CAD 모델링, FEM 정적 구조해석, 진동(FRF) 해석 | [04](./04_재료역학_기계요소/README.md) · [06](./06_제조공학_CNC/README.md) · [09](./09_기계진동학/README.md) · [11](./11_기계설계_Ornithopter/README.md) |
| 임베디드 · 제어 | 센서로 물리량을 측정·제어할 수 있는가 | MCU 레지스터 제어, 센서 융합, 인터럽트 상태제어, BLE 통신 | [10](./10_메카트로닉스_ATmega128/README.md) · [05](./05_임베디드제어_Arduino/README.md) · [01](./01_제어공학_Simulink_MATLAB/README.md) |
| AI · 데이터 | 데이터로 문제를 정의·검증하고 자동화할 수 있는가 | 데이터 분석·모델링, LLM Agent 설계·운영(LangGraph·LangSmith), 대시보드 | [13](./13_데이터분석_고객만족도예측/README.md) · [14](./14_AI에이전트_AI강사/README.md) · [15](./15_AI에이전트_상품리뷰분석/README.md) |
| 웹 · 풀스택 | 사용자 기능을 안정적으로 구현·연동할 수 있는가 | React SPA, REST 연동, 외부 AI API 연동 | [16](./16_웹개발_도서표지AI서비스/README.md) |

---

## 🔗 증빙 · 외부 링크 (AI 시스템 연구 트랙)

발표자료의 고급 연구 프로젝트(AEQ·알고리즘 트레이딩·온디바이스 AI)에 대한 검증 자료입니다.

| 항목 | 증빙 | 링크 |
|------|------|------|
| WorldQuant IQC 2026 — Stage 1 | 인증서(이미지) | [인증서 보기](발표자료/assets/WorldQuant_IQC2026_Stage1_Certificate.png) |
| Kaggle (Nemotron Reasoning·AIMO 2025) | 대회 참가 | _프로필 링크 추가 예정_ |
| AEQ — LLM 추론 양자화 | **배치 규모에서 vLLM 대비 수 배 처리량 향상**(자체 측정 · 구체 수치는 면접 시 공유) | _arXiv 준비 중 / 비공개 repo (요청 시 공유)_ |
| WorldQuant BRAIN 알파 60+ | 활성화 경험 | _BRAIN 프로필 (요청 시 공유)_ |

> 일부 연구는 **미공개(arXiv 준비 중)·비공개 저장소** 단계로, 공개 가능한 링크·수치는 순차적으로 보강합니다.

---

## 자료 구성 안내

- 각 분야 폴더의 `README.md`에 개념·방법·결과를 정리했고, 원본 파일은 같은 폴더(또는 `원본/`, `*_원본/`) 하위에 두었습니다.
- **대용량 바이너리**(CAD `.SLDASM/.SLDPRT/.STEP`, 영상 `.mp4`, 발표 `.pptx`, 보고서 `.pdf`, 해석결과 등)는 **Git LFS**로 추적합니다. 클론 시 `git lfs install` 후 받으면 됩니다.


---

**작성자: 노경천 (기계공학)**
