---
name: project_cds_nav_meta_policy
description: CDS Figma 재구축 정책(기획 260707) — 상세화면 탭바숨김(탭바=1depth 대메뉴만)·mid-fi 메타5종 이관금지. ★설정 서브화면 탭바 제거 확정(260707 사용자A, 260710 재확인)
metadata: 
  node_type: memory
  type: project
  originSessionId: bccc86de-297c-4b84-91df-91629bde597f
---

기획 세션이 mid-fi 설계검토 후 CDS Figma 재구축에 직접 영향주는 2건 확정(2026-07-07). 관련 [[reference_cds_harness]] · [[project_cds_ia_reorg]].

**① mid-fi 메타 5종 = 설계메타, Figma 이관 금지**: P1/P2/P3 배지(.pri) · ◆디자인기획/델타주석(data-delta) · →목적지 안내 화살표 · hidden UX 주의문 · issue-panel(우측 논의패널). 우선순위는 배지 아닌 **순서·강조·라벨**로 표현. 하네스 DoD의 "설계주석 제거"를 이 5종으로 확장.

**② 탐색 구조 원칙**:
- **상세·입력 화면 = 하단 탭바 숨김 + 뒤로가기/닫기만.** 탭바는 1차 대메뉴(홈·사람·할일·**설정메인**)에만.
- 과정성 화면(녹음중·정리로딩·정리결과 확인) = 모달/독점(탭바 완전숨김, 취소/나중에만).
- 화면목록은 실제 정본 `data-screen` ID 기준(검토보고서 ID는 가공됨·존재않는 화면 포함 → 신뢰금지). 실제=`SCR_SETTINGS_ACCOUNT` 등.
- 비서(`SCR_DELEGATE_*`)는 1차 MVP 제외. 정본=`02_design/screen_design_v2/2midfi_*.html`+`flows.json`.

**★스토리북 v2 재확인(260710)**: 오너 재확정 "하단 탭바=1depth 대메뉴(홈/사람/할일/설정 허브)에서만". 설정 상세형제(SettingsCalendar/SmsCall/Data/Noti/Meeting/CallMemo/Account/Permission)=2depth→탭바 없음. PersonList=사람탭 1depth라 탭바 유지. Gemini가 v2 설정형제에 탭바를 잘못 부착→제거 지시(journal review_findings). 캐노니컬 SettingsEmail(탭바없음)=정답. [[project_cnote_storybook_v2_rn]].

**✅해결(사용자 A 채택 260707)**: 설정 서브화면도 **탭바 제거**(백버튼만) 확정 — 이전 "BottomNav 유지" 확정은 폐기. 기완성 5화면 16프레임(ACCOUNT 1783:5078/1790:126·NOTI 1801:3493/1803:3544·PERMISSION 1827:3645/1829:126·EMAIL 6·CALENDAR 4) **BottomNav 일괄 제거 완료** + 단일컬럼 3화면(ACCOUNT/NOTI/PERMISSION)은 전체콘텐츠 높이로 grow·라이트 아래로 재배치·섹션 리사이즈, tall(EMAIL/CALENDAR)은 하단 shrink. 양모드 눈검증 PASS. **assembler.md 기본규칙("상세/서브=BottomNav 없음")이 이미 정답** — 앞으로 설정 조립 시 "BottomNav 유지" 오버라이드 금지(기본값 그대로). ⑥SMS_CALL~⑪는 탭바 없이 조립. 상세=`_cds_journal.jsonl` 13:50 PAUSE·14:05 nav_removal 엔트리.
