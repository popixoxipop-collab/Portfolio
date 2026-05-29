# 16. 웹 개발 — 도서 표지 AI 생성 서비스 (Pic:Story)

> **KT 에이블스쿨(AIVLE) 미니프로젝트 4차.** 도서 정보를 관리(CRUD)하고, 도서 내용을 바탕으로 **OpenAI GPT Image**를 호출해 맞춤형 표지를 자동 생성하는 React 풀스택 웹 서비스입니다.

---

## 프로젝트 개요

| 항목 | 내용 |
|------|------|
| 주제 | 도서 관리 시스템 + AI 도서 표지 자동 생성 |
| 목적 | 표지 제작에 부담을 느끼는 작가를 위한 AI 표지 생성 지원 |
| 형태 | React SPA + Mock REST API(json-server) + OpenAI 연동 |
| 진행 기간 | 3일 (팀 프로젝트, 9명) |
| 플랫폼 | KT AIVLE School |
| **담당 역할(노경천)** | **OpenAI 연동**, 요구사항 정의·기능 명세 작성 |

## 기술 스택

| 레이어 | 기술 |
|--------|------|
| Frontend | React 19, Vite, axios, MUI |
| Mock Backend | json-server (로컬 REST API, `db.json`) |
| AI | OpenAI API (GPT Image 2) |
| 협업 / 배포 | GitHub, Vercel |

## 주요 기능

- **도서 CRUD**: 목록/상세 조회, 등록(POST), 수정(PATCH), 삭제(DELETE) + 폼 유효성 검사
- **AI 표지 생성**: 제목·저자·내용을 조합한 구조화 프롬프트로 OpenAI 호출 → `b64_json` 응답을 Data URL로 변환·렌더링 → `PATCH`로 DB 저장
- **API Key UI 입력**: 키를 하드코딩하지 않고 UI에서 입력(보안), 로딩·에러·비용 안내 처리
- **TTS**: Web Speech API로 도서 제목·저자·본문 음성 안내
- **부가**: 알림 시스템, 좋아요/댓글, 검색·필터(GNB), 로딩 UX, 생성 이미지 크기 조절

## 서비스 흐름

```
Client(React SPA) ─ CRUD(GET/POST/PATCH/DELETE) ─ Mock DB(json-server, db.json)
       │
       └─ POST(prompt) ─→ OpenAI API(GPT Image 2) ─→ b64_json ─→ Data URL 렌더링 → PATCH 저장
```

## 실행 방법

```bash
cd 원본/KT-AIVLE-mini-proj04-main
npm install
npx json-server --watch db.json --port 3001   # 새 터미널에서 Mock API
npm run dev                                    # 개발 서버
# 표지 생성 기능은 UI에서 OpenAI API Key 입력 필요
```

## 파일 안내

```
원본/
├─ KT-AIVLE-mini-proj04-main/     React 풀스택 앱 소스 (src/screen·hooks·common, db.json 등)
│   └─ README.md                  앱 자체 상세 문서(Pic:Story)
├─ AI-15조 1.pptx                 프로젝트 발표자료
└─ 회의록_06반_15조.url            팀 회의록 링크
```

> 앱 소스는 일반 파일로 두어 브라우저에서 코드 열람이 쉽도록 했고, 발표자료(`.pptx`)는 Git LFS로 관리합니다. (`node_modules`는 포함하지 않으므로 `npm install` 필요)
