---
name: feedback-publish-zero-install
description: 블로그 발행은 어느 PC에서든 「zip 하나 받아 설치기 실행 + 확장 등록」만으로 되어야 한다 — 트랙·컨셉이 바뀌어도 불변인 전제조건
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 16f5b3a6-0f22-4d44-9fd8-10a80439ef67
  modified: 2026-08-30T06:21:41.935Z
---

**블로그 자동 발행은 어느 PC에 가서도 아래 3단계만으로 쓸 수 있어야 한다.**

```
1. claude.ai 프로젝트에서 생성          (계정 종속 = PC 무관)
2. 확장 + 인스톨러 zip 하나를 받는다
3. 압축 해제 → ①설치기 실행 ②크롬 확장 로컬 등록
```

★**이 조건은 트랙·컨셉이 바뀌어도 변하지 않는다.** A(연애)·B(학력)·C(방송리뷰)·경제 등
어떤 레퍼런스 블로그를 벤치마킹해 성공법칙을 새로 뽑아 오더라도, 그 법칙을 실행하는
**발행 경로는 항상 이 3단계 안에서 설계한다.** (260830 사용자 명시)

⚠️**「확장만·무설치」가 아니다.** 로컬 설치 실행파일은 **허용**된다 — 단 **zip 하나에 다 들어 있고
설치기가 스스로 다 깔아야** 한다. 사용자가 Python·ffmpeg를 따로 구하게 만들면 실패다.
(`backend-installer/install-backend.ps1` 이 이미 그렇게 돼 있다 — Python winget 자동설치·venv
재생성·ffmpeg 자동 다운로드·로그인 자동실행 등록.)

**Why:** 성공법칙은 자주 바뀌지만 실행 환경은 사람을 따라다닌다. 배포 패키지가 낡거나
조각나 있으면 PC를 옮기는 순간 발행이 멈춘다. 실제로 260830에 배포 7z이 **22일 낡아**
그 사이 고친 `sources.py`·`background.js`가 빠져 있었고, 백엔드가 꺼져 있어
`DEEPNAUT_youtubeFrames`가 이미지 0장을 조용히 반환할 구조였다.

**How to apply:**
- **코드를 고쳤으면 배포 zip을 다시 만든다.** 이게 가장 자주 빠뜨리는 단계다.
- 설치기는 **자립형**을 유지한다 — 다른 프로젝트 트리(THEMONY 등)를 참조하지 않는다.
- `yt-dlp`는 **자동 갱신**한다. 유튜브 변경으로 자주 깨진다(260830 실측: 2026.07.04판이
  403·"포맷 없음"으로 전부 실패 → 2026.08.19로 갱신하고서야 복구).
- 백엔드가 못 여는 소스(KBS 등 서명 스트림)는 **확장의 CDP 캡처**로 받는다.
  둘 다 실패하면 ⛔조용히 넘어가지 말고 실패를 남긴다.
- 설정은 `chrome.storage.sync`로 PC 간 동기화하되,
  ⛔**네이버 아이디·비밀번호는 `storage.local` 고정** — 구글 서버로 올리지 않는다.

계획 정본: `260722_DEEPNAUT/01_docs/계획_핸드오프/_WORK_PLAN_확장_무설치_발행_260830.md`
관련: [[project_deepnaut_youtube_frames]] · [[project_deepnaut_editor_injector]] ·
[[project_deepnaut_naver_login_ext]] · [[project_chrome_ex]]
