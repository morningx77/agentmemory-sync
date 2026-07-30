---
name: project_tieming_bi
description: Tieming — CNOTE 앱 BI/앱아이콘 방향 확정(파동-m). 크리에이티브 세션 260729
metadata: 
  node_type: memory
  type: project
  originSessionId: 9c0b9b86-936a-4d31-9f94-e1910d50c034
  modified: 2026-07-29T08:11:57.444Z
---

★260729 크리에이티브 세션. CNOTE 앱의 **BI 네이밍 "Tieming" 확정**(사용자 승인).

- **네임/컨셉**: **Tieming** = **Tie(관계를 잇다) + Ti(ming)** → 읽으면 "타이밍", 뜯어보면 "관계". 태그라인 **"관계는 타이밍이다 / Relationships are all about timing"**. CNOTE 포지셔닝(저장 아닌 타이밍)과 정확히 일치.
- **심볼**: 워드마크 "Tieming"의 **가운데 m을 파동/펄스로 형상화**(2마루=∩∩=m이자 신호). **오른쪽 정점 1점만 골드**(="그 순간", ≤5%). 이 파동을 떼어 **다크 스퀘어클 앱 아이콘**으로. 48px 가독 OK.
- **버린 방향(사용자 반려 이력)**: ① 기존 인터섹션(두 원 교차) 그대로 앱아이콘化=**재탕**(인앱 스플래시 그래픽 복사) ② 파셋/명도스텝 로우폴리=**올드** ③ CDS 관습 답습 경향. → "힘있는 그래픽 형태 마음껏"으로 재발산. 힘있는 3안(결속 인터록/순간 궤도/이음) 거쳐 최종 **파동-m**으로 수렴.
- **팔레트 계승**(=[[project_cnote_palette_violet_gold]]): 베이스 #0C0A16/#100E18, 바이올렛 #6549FF/#8B7BFF, 골드 #F2DB10(정점만). 무드=Precise·Calm·Executive·Intelligent "조용한 확신". **음성 녹음/회의록 클리셰 금지**(제품이 부정).
- **산출물**(전부 `03_projects/260610_C-Level_note/02_design/`):
  - `_APP_ICON_BI_기반브리프_260729.md` (제품·타깃·팔레트 근거)
  - `_Tieming_BI_아티팩트_생성_프롬프트_260729.md` (재생성용 프롬프트)
  - `tieming_bi_board.html` (BI 보드: 워드마크·심볼·아이콘·사다리·파동4변주·시스템)
  - Figma CDS 페이지 "BI"(node 2486:872)엔 발산 습작들(원/파셋/힘있는3안)이 남아있음.
- **아티팩트 URL**: https://claude.ai/code/artifact/ac0dbe4a-2794-4be1-924d-607f4e5f6037 (재게시=같은 file_path).
- **함정/노하우**: (1)use_figma 벡터는 vectorPaths 세팅 시 bbox를 (0,0) 정규화→노드 x/y를 **점들의 min으로** 세팅해야 제자리. 기존 벡터 path 교체 시도 금지(위치 틀어짐)→**새로 생성**. (2)아티팩트 눈검증=로컬 chrome-headless-shell(`$LOCALAPPDATA/ms-playwright/chromium_headless_shell-*/`)로 `--screenshot --force-prefers-reduced-motion --virtual-time-budget` 캡처 가능(npm playwright 없이).
- **미결**: "Tieming"이 CNOTE **전체 정식 리네이밍**인지 사용자 확인 대기(현재 BI/아이콘에만 반영, 문서·CLAUDE.md 전면 개명 보류).
