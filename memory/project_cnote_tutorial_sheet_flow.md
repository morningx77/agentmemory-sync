---
name: project_cnote_tutorial_sheet_flow
description: CNOTE 씨앗홈 튜토리얼 시트 흐름 최종 아키텍처(embedded·닫기→허브·payoff 바텀시트)
metadata: 
  node_type: memory
  type: project
  originSessionId: 1763df05-ea22-4314-8d21-41768b3621ee
  modified: 2026-07-30T10:07:51.278Z
---

★260730 CNOTE(TieMing) 온보딩 씨앗홈 튜토리얼(명함/일정/할일)의 flow.html 시트 흐름 최종형. 많은 이터레이션 끝의 정본이니 다음 세션은 이 구조를 유지하고 임의로 되돌리지 말 것. 관련 [[project_cnote_v06_onboarding_jit]] [[reference_cnote_flow_player]].

**흐름**: 씨앗홈/허브(BS_TUTORIAL_HUB) 카드 탭 → 폼 시트 → 저장 → 결과(payoff) 시트 → 홈으로/닫기.
- 허브(BS_TUTORIAL_HUB)=메인프레임 풀페이지 스토리(page-scr-home--tutorial-hub, 홈+허브시트가 한 스토리). 카드 탭=메인프레임 CTA → `SHEET_OPEN` → 튜토리얼이 **시트 프레임**(#sheetFrame)으로 열림.
- `SHEET_OPEN`: recontact→SCR_CARD_SCAN, calendar→SCR_CALENDAR_ADD, task→BS_TASK_EDIT.
- `SHEET_ROUTE`(시트 프레임 CTA 전용): 저장류→결과 화면을 **문자열**(시트 안 렌더) 로. 예 `SCR_TASK_LIST|BTN_TASK_SAVE`→`SCR_TASK_LIST|tutorial`, `SCR_CARD_RESULT|BTN_REGISTER_AS_PERSON`→`SCR_PERSON|tutorial`, `SCR_CALENDAR_ADD|BTN_SAVE_EVENT`→`SCR_CALENDAR_DETAIL|tutorial`.

**★핵심 결정(사용자 지시)**:
1. **payoff는 시트 안에서 마무리**(페이지 탈출 아님). 결과 화면을 시트에 렌더 후 닫으면 씨앗홈 복귀.
2. **passthrough 미사용** — 모두 일반 바텀시트(핸들·딤·씨앗홈 뒤로 비침)로 보여야 함. flow.html openSheet/sheetRender에서 `passthrough` 항상 제거. (isPass 함수는 미사용 잔재.)
3. **시트=내용만(embedded)** — 전체 앱 화면(상단 헤더+하단 탭바+FAB)을 시트에 넣으면 ①폼 시 목록 딸려옴 ②시트 안 탭바/헤더 링크로 흐름 꼬임. → flow.html이 시트 렌더 시 `&args=embedded:!true` 주입(storyUrl 2번째 인자). **탭바·FAB 가진 화면은 TaskList 하나뿐**이라 TaskList에만 `embedded` prop 구현: initialSheet(폼)=`할 일 추가 폼만`(목록 없이 taskForm 조기 return), tutorial(결과)=목록 내용만(HubHeader·BottomNavigation·FAB 숨김). Calendar/Person/Card*는 탭바 없어 추가 작업 불필요.
4. **결과 하단 CTA = [홈으로 고스트 | 닫기 primary]** (Person·Calendar상세·TaskList). 홈으로=`BTN_TUTORIAL_HOME`→`{page:'SCR_HOME|seed-partial-{card|calendar|task}}'`(성장한 씨앗홈=완료 가이드 카드). 닫기=`BTN_TUTORIAL_BACK`→`{page:'BS_TUTORIAL_HUB'}`(직전 튜토리얼 허브 복귀·다음 이어가기). NoteResult(녹음)는 페이지 기반이라 [홈으로|저장하기] 유지.

**완료 가이드 카드**: seed-partial 홈 진행바 위, `justCompleted` prop→DONE_GUIDE 카피(방금 완료 리마인드+이득). 즉시 실데이터 없어도 payoff 보장. Home stories: page-scr-home--seed-partial-done-{recording|card|calendar|task}, _screen_links·_nav_map 등록됨.

**SeedCard 완료 카드**: done=`bg-surface-raised`+inset 스크림(bg-surface-overlay opacity-60≈30%블랙)으로 dim, 완료 버튼 size=large(활성과 동일 높이)·disabled.

파일: flow.html(SHEET_OPEN/SHEET_ROUTE/isPass/storyUrl/openSheet/sheetRender), TaskList(embedded), Person/Calendar/TaskList(하단 홈으로|닫기), TutorialCallout(버튼 제거·메시지만), Home(justCompleted), SeedCard(done dim).
