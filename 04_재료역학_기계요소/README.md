# 04. 재료역학 · 구조해석 — 기계요소 · 단면 특성 · ANSYS

> 면적 관성모멘트, Plane Strain 응력 상태, 단면 2차 모멘트 등 재료역학 핵심 개념과,
> 이를 실제 부재에 적용한 **ANSYS Workbench 정적 구조해석(Static Structural)** 프로젝트를 함께 담았습니다.

---

## 대화 목록

| # | 제목 | 핵심 내용 |
|---|------|-----------|
| 1 | 면적 관성모멘트 계산 | 기본 단면 형상별 I 계산, 평행축 정리 |
| 2 | Plane Strain 응력 설명 | 평면 변형률 상태, Mohr's Circle |
| 3 | 단면모멘트 반지름 표현 | 회전반경(k), 단면계수(Z) 정의 |

---

## 핵심 개념 정리

### 1. 면적 관성모멘트 (Second Moment of Area)

```
정의:
  Ix = ∫ y² dA   (x축에 대한 관성모멘트)
  Iy = ∫ x² dA   (y축에 대한 관성모멘트)

단위: m⁴ 또는 mm⁴
```

#### 기본 단면 형상

| 단면 형상 | Ix (중립축 기준) | Iy |
|-----------|------------------|----|
| 직사각형 (b×h) | bh³/12 | hb³/12 |
| 원형 (반지름 r) | πr⁴/4 | πr⁴/4 |
| 속이 빈 원형 | π(R⁴-r⁴)/4 | π(R⁴-r⁴)/4 |
| 삼각형 (b×h) | bh³/36 | — |

#### 평행축 정리 (Parallel Axis Theorem)

```
I = Ic + A·d²

  Ic : 도심(centroid) 축에 대한 관성모멘트
  A  : 단면적
  d  : 도심 축과 새 축 사이 거리
```

---

### 2. 단면계수 · 회전반경

```
단면계수 (Section Modulus):
  Z = I / c

  c : 중립축에서 최외단까지 거리
  용도: 굽힘 응력 계산 → σ = M/Z

회전반경 (Radius of Gyration):
  k = √(I/A)

  A : 단면적
  용도: 좌굴 해석, 슬렌더니스비 = L/k
```

---

### 3. Plane Strain (평면 변형률)

#### 정의

```
평면 변형률 상태 (2D):
  εz = 0,  γxz = 0,  γyz = 0

  → z 방향 변형 없음 (두꺼운 구조물, 댐·터널 등)

응력 성분:
  σx, σy, τxy ≠ 0
  σz = ν(σx + σy)   ← 0이 아님! (구속 응력)
  εz = 0
```

#### Mohr's Circle (주응력 계산)

```
주응력:
  σ1,2 = (σx+σy)/2 ± √[((σx-σy)/2)² + τxy²]

최대 전단 응력:
  τmax = √[((σx-σy)/2)² + τxy²]

주응력 방향:
  tan(2θp) = 2τxy / (σx - σy)
```

#### Plane Stress vs Plane Strain 비교

| 항목 | Plane Stress | Plane Strain |
|------|--------------|--------------|
| 적용 대상 | 얇은 판, 박막 | 두꺼운 구조물 |
| εz | ≠ 0 (자유 변형) | = 0 (구속) |
| σz | = 0 | = ν(σx+σy) |
| 탄성계수 (등가) | E | E/(1-ν²) |

---

### 4. 굽힘 응력 공식

```
굽힘 응력:
  σ = M·y / I = M / Z

  M : 굽힘 모멘트 [N·m]
  y : 중립축에서 거리 [m]
  I : 단면 관성모멘트 [m⁴]
  Z : 단면계수 = I/c [m³]

최대 굽힘 응력 (y = c):
  σmax = M·c / I = M / Z
```

---

### 5. 예제 계산

#### 직사각형 보 (b=50mm, h=100mm)

```
Ix = (50 × 100³) / 12 = 4,166,667 mm⁴

단면계수:
  Z = Ix / c = 4,166,667 / 50 = 83,333 mm³

회전반경:
  A = 50 × 100 = 5,000 mm²
  k = √(4,166,667 / 5,000) = 28.87 mm
```

#### Plane Strain 예제 (σx=80MPa, σy=40MPa, τxy=20MPa)

```
주응력:
  σ1,2 = (80+40)/2 ± √[((80-40)/2)² + 20²]
        = 60 ± √[400 + 400]
        = 60 ± 28.3

  σ1 = 88.3 MPa
  σ2 = 31.7 MPa

z 방향 구속 응력 (ν=0.3):
  σz = 0.3 × (80+40) = 36 MPa
```

---

## 🔧 ANSYS Workbench 정적 구조해석 (원본 프로젝트)

재료역학 개념을 실제 부재에 적용해 ANSYS Workbench에서 **응력·변형(Static Structural)** 을 해석한 프로젝트입니다. 위에서 정리한 굽힘 응력·단면 특성 이론을 수치해석(FEM)으로 검증하는 과정에 해당합니다.

### 해석 케이스

| 프로젝트(`.wbpj`) | 대상 / 내용 |
|-------------------|-------------|
| `SPRING.wbpj` | 스프링 부재의 하중-변형 정적 해석 |
| `projectile.wbpj` | 발사체 형상 구조 해석 |
| `HW2.wbpj`, `ansys01.wbpj`, `ansys-2.wbpj`, `222.wbpj` | 과제용 부재 응력·변형 해석 |

### 해석 절차 (Workbench)

```
Engineering Data (재료 물성)
      ↓
Geometry (DesignModeler / SpaceClaim)
      ↓
Model → Mesh (요소 분할)
      ↓
Static Structural → 하중·구속 조건 부여
      ↓
Solution → Equivalent Stress(von-Mises), Total Deformation
```

- 결과 항목: 등가응력(von-Mises), 전 변형량(Total Deformation) 등을 컨투어로 확인.
- `SPRING_report.html` — ANSYS가 생성한 해석 리포트(자동 생성본).

### 파일 안내

```
ANSYS_구조해석/프로젝트 파일/
├─ SPRING.wbpj / projectile.wbpj / HW2.wbpj / ansys01.wbpj / ansys-2.wbpj / 222.wbpj
├─ *_files/                  각 프로젝트의 해석 데이터(메시·결과 .rst 등, Git LFS)
├─ SPRING_report.html        자동 생성 해석 리포트
├─ ANSYS_결과이미지_*.png      결과 컨투어 이미지
└─ ansys-1.mp4               해석 과정 영상
```

> ANSYS 프로젝트(`.wbpj`)와 해석 데이터(`.agdb`, `.mechdb`, `.rst`)는 용량이 커 **Git LFS**로 추적됩니다.

