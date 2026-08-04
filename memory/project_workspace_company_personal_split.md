---
name: project_workspace_company_personal_split
description: 워크스페이스 회사/개인 분리 마이그레이션 — Phase1(회사=ISPARK/) 실행완료·Phase2(개인) 대기
metadata: 
  node_type: memory
  type: project
  originSessionId: 65ee744c-c1c6-4520-901a-b07c503118b7
  modified: 2026-08-04T01:14:01.613Z
---

회사 Claude 계정 도입 대비, 워크스페이스를 회사/개인으로 물리 분리하는 마이그레이션. **계획 확정·실행 대기(260804)**. 정본 = `260610_ISPARK/_MIGRATION_PLAN_회사개인분리_260803.md`.

## 채택 구조 (하위폴더 안)
```
260610_ISPARK\           ← 개인이 루트 염(전체 봄)
  CLAUDE.md              ← ★범용 공통만(프로젝트목록·개인규칙 하위 이관 필요)
  .claude\              ← 개인/전체
  ISPARK\               ← 회사 계정이 여기 염(회사만 봄) — 자체 CLAUDE.md·.claude 필요
  IMGINE\               ← 개인
```

## ★검증된 Claude Code 상속 동작 (claude-code-guide 확인)
- **CLAUDE.md**: 🔴 cwd에서 상위로 거슬러 로드 → 회사 하위폴더가 부모 루트 CLAUDE.md를 봄 → **누수 차단 = 루트 CLAUDE.md 범용화가 필수**.
- **settings·MCP·hooks**: ✅ 부모 미상속(격리). 회사 하위에 자체 `.claude/` 필요.
- **메모리**: ✅ 경로 슬러그 기반(루트=git repo 아님 확인) → 하위폴더는 별도 네임스페이스.
- ⚠️ cwd는 하드 보안경계 아님 → 완벽격리는 별도 Windows 계정.
- ⚠️ `claudeMdExcludes` 설정은 미검증 → 의존 안 함.

## 분류 확정 (260803~04)
- 회사(ISPARK\): FIGMA_MCP·ISPARK_MCP·CNOTE(C-Level_note) + 02_office·04_design·07_archive
- 개인(IMGINE\): forest_reserv·MATO·Chrome_Ex·THEMONY·TSMIN·DEEPNAUT·antigravity_skills
- 공용(루트): 000000_INFO·06_downloads·08_temp·.claude
- **05_notes = A(루트 공용 유지)** 확정(vault 분할 시 wikilink 끊김).

## 실행 상태
- **✅ Phase1 완료(260804)**: 회사 6항목(CNOTE·FIGMA_MCP·ISPARK_MCP·02_office·04_design·07_archive)→`ISPARK/` 이동. git OK. 런타임패치(journal-notify.mjs·watch-docs.ps1→ISPARK경로·CNOTE-watch-docs 재시작). `ISPARK/.mcp.json`(figma)·`ISPARK/CLAUDE.md` 생성. 루트CLAUDE.md 개인목록 제거·격리검증 통과. 저널 완료신호. **→ 회사계정 도입 가능.** 백업=`_migration_backup_260804/`.
- **✅ Phase2 완료(260804)**: 개인 8항목(forest_reserv·MATO·Chrome_Ex·THEMONY·TSMIN·DEEPNAUT·antigravity_skills+01_private)→`IMGINE/` 이동. git OK(BLOG_AUTO main·forest_reserv는 이동전부터 dubious ownership). `IMGINE/CLAUDE.md` 생성. THEMONY vbs 58개 내부경로 일괄치환+THEMONY-slot0/1/2 태스크 3개 새경로 갱신(Disabled유지). DEEPNAUT backend(run.py) 정지 후 이동. **최종: 루트03_projects=000000_INFO(공용)만·IMGINE=개인7·ISPARK=회사3.** agentmemory-sync=루트참조라 무변경.
- **✅ 추가 재배치(260804-2/3, 사용자 지시)**: `05_notes`(Obsidian vault)→**회사 ISPARK/**(단 개인 BLOG_AUTO 노트 `02_projects/BLOG_AUTO_V2`만 IMGINE/05_notes로 분리) · `000000_INFO`→**개인 IMGINE/03_projects/**(★기존 공용 결정 번복·GSC creds MATO도 IMGINE) · `06_downloads`·`08_temp`→**회사 ISPARK/**(IMGINE엔 빈폴더 신설) · **빈 루트 03_projects 삭제**. → 루트엔 ISPARK/·IMGINE/·잡폴더(policy_news·undefined)만. 루트 커맨드의 `05_notes/04_claude` 방법론 참조는 이제 `ISPARK/05_notes/04_claude`. CLAUDE.md 3종·[[reference_themony_gsc_measurement]](MATO경로) 갱신.
- **✅ 회사 세션 프리셋 완료(260804-3, §3-3)**: `ISPARK/.claude/` 채움 — agents 17(cds-*6+screen-*11)·commands 10(디자인+오피스, keyword-research=개인제외)·skills 4(figma-*)·`hooks/journal-notify.mjs`(★회사변형: WS_ROOT=ISPARK/라 'ISPARK' 세그먼트 제거·저널 정상해석)·`settings.json`(hooks 3종 SessionStart별칭/UserPromptSubmit토큰+저널/SessionEnd agentmemory + 권한 29유지·개인5제외). `ISPARK/.mcp.json`=figma(http). **★남은 사용자 액션 1: figma MCP OAuth 재인증**(mcp.figma.com 원격OAuth·회사세션 대화형·workspace 대행불가). ★함정: 회사 .claude 훅은 __dirname 기준 WS_ROOT=ISPARK/라 루트훅의 'ISPARK/03_projects' 대신 '03_projects' 직결(이중경로 방지). CNOTE 세션은 cnote-front/.claude로 자립(ISPARK/.claude는 ISPARK/루트 여는 회사 제너럴세션용).
- **⏳ 잔여(비파손·재활성시)**: 개인 venv 재생성(THEMONY BLOG_AUTO/.venv·DEEPNAUT backend-installer/.venv — 절대경로박힘) / 루트settings.json THEMONY·CNOTE 권한allowlist경로(참조성·재승인만) / 다른세션 핸드오프문서(루트 `_MIGRATION_*` 여러개) 검토.
- **CNOTE 이동 후 검증(storybook 세션 실측 260804)**: 게이트4종·tsc0·git(3987929·origin동기·미커밋0) 정상. `.deploy.local.json` storybook.localBase는 **절대→상대 `../../03_dev/cnote-front/storybook`** 로 바뀌어 이후 이동에도 무패치 생존. watch-docs 패치·Running·sync.log 신규기록 확인. **★이동 후 `node_modules/.cache`(31MB) 반드시 삭제** — Vite dep 캐시가 구경로 절대경로를 물고 있어 dev 504·stale 유발([[reference_cnote_storybook_cache_longpath]]). 잔존 무해: `_shot*.cjs` 7개·`screenshot_html.js`·기획 md 이미지 절대경로.
- ★이동 함정: CNOTE storybook dev(6009)가 폴더 락→정지 후 이동. cnote-front dir cwd점유로 통째 mv 불가→자식단위 mv+빈껍데기 rmdir(git 무결). 감사 venv 언더카운트(SKIP_DIRS가 .venv 선-프룬)→실제 개인 venv 여럿.
[[feedback_no_unverified_as_fact]]
