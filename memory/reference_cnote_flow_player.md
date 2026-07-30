---
name: reference_cnote_flow_player
description: "CNOTE 모바일 Flow Player(flow.html) — 실제 스토리북 화면으로 전 흐름 검증 + 상태화면 보강 현황"
metadata:
  node_type: memory
  type: reference
  originSessionId: a1564576-d2f1-4b63-8e58-a95aa706891e
  modified: 2026-07-23T08:08:32.328Z
---

**Flow Player** = 모바일에서 실제 스토리북 화면으로 전 흐름을 도는 클릭 프로토타입. URL: `https://next.sgate.biz/v1/design/flow.html` (소스 `02_design/screen_design_v2/flow.html` + `_flow_nav.json`, 배포 타깃 `flow`=deploy-sftp.mjs).

**구조**: 전체화면 iframe(스토리북 스토리) + 상단바(☰점프메뉴·제목·🎨Figma·⛶몰입·🌗다크) + 하단 전이바(← + flows 전이) + 점프메뉴(전 화면/상태).
- **데이터 생성**: `scripts/build_flow_nav.mjs`(flows.json+_screen_links→_flow_nav.json, screens/전이/흐름그룹 + _screen_links의 SCR|state 스토리 병합) → `scripts/build_btn_nav.mjs`(버튼맵 btnNav, 라벨앵커+토큰매칭 ~83%). 변경 후 재생성+`deploy-sftp.mjs flow`.
- **★★함정3: 2단계 빌드 순서 필수(260723)**: `build_flow_nav.mjs`는 `_flow_nav.json`을 **btnNav 없이 새로 덮어씀**(키=`_comment/storybookBase/screens/flows`만). btnNav는 **2단계 `build_btn_nav.mjs`가 채워 다시 씀**(data/_nav_map.json 오버라이드 병합 포함). **1단계만 돌리고 2단계를 빼면 btnNav가 통째로 사라짐(0개)** → flow.html Tier2가 화면 안 모든 버튼을 무시(전 화면 화면내 버튼 사망, 탭바·FAB 전역NAV만 생존). 증상=직접 진입·하단 chrome전이는 되는데 화면 안 CTA만 무반응. **반드시 build_flow_nav → build_btn_nav 순서로 쌍 실행 후 deploy flow**. 검증=`_flow_nav.json`에 btnNav 키 존재+키수>0.
- **★명시맵 정본(260716)**: `data/_nav_map.json`(key=`SCR|BTN_MARKER`, value=`목적지 SCR(|state)`)이 btnNav에 오버라이드 병합(build_btn_nav) — 라벨추측 조인의 취약성 대체. dead click 색출은 **storybook emit마커 ↔ _nav_map/전역 diff**가 정본 신호(라벨기반 `_btn_nav_misses.txt`는 명시맵 도입후 전역내비·상태프리뷰·라벨조인잔재로 오탐多, dead 신호 부적합). 전역마커(알림·검색·FAB·하단탭·뒤로)는 flow.html 전역 NAV 처리→맵 불필요.
- **★함정: 스토리북-only 시트/화면 등록**: build_flow_nav 상태병합 루프는 `_screen_links` 키가 **파이프(SCR_X|state) 포함일 때만** 화면 등록. `BS_TASK_EDIT`처럼 파이프없는 별칭키는 스킵→화면 미등록→map값 미해석(안 열림). flows.json 추가는 미드파이 부재로 프로토타입 게이트 깨짐. **해법=_screen_links에 `SCR_X|state` 파이프키 별칭 추가**(flows·미드파이 불변, 게이트 안전). 예: task-edit 시트=`SCR_TASK_LIST|task-edit`.
- **★함정2: 세그먼트/탭 양방향 전환(260720)**: 세그먼트가 두 상태를 오갈 때(예 PERSON_LIST 추천순↔전체) `_nav_map` 배선(BTN_A→state1·BTN_B→state2)뿐 아니라 `_screen_links`에 **양쪽 상태 파이프키 둘 다** 등록해야 함(`SCR_X|state1`·`SCR_X|state2`). 한쪽만(예 directory) 등록하면 반대편(normal 복귀)이 편도 무반응. base키(`SCR_X`)만으론 `|normal` 미해결 → `SCR_X|normal`=base story 별칭도 명시 필요.
- **Tier2 실제버튼 이동**: `src/analytics/analyticsId.ts` emitCta가 부모창에 `postMessage({source:'cnote-flow',type:'cta',id,screen})` → flow.html이 btnNav[SCREEN|BTN]→render(key). 미매핑 버튼=무시(하단바/점프메뉴가 커버). ★스토리북 재빌드·배포 필요.
- **몰입 모드**: 상/하단 바 숨김. `#app{height:100vh;height:100dvh}`(dvh 우선 필수—vh가 이기면 하단 잘림)+safe-area.

**상태화면 보강(260714 완료)**: 붕괴 12건 스토리 추가(홈 패턴=페이지 variant + `page-scr-{scr}--{state}` 스토리 + _screen_links `SCR|state` 키). detect=`scripts/detect_missing_states.mjs`(미드파이 정본 vs 스토리북). 완료: signup-verify·error, task-list·empty, notifications·empty, calendar·empty, person·both-sides, search·result/empty, card-result·loading/both-sides, relation-scan·loading, person-add-form·dup-detected.
- **미결(정리 대상)**: ① PRIVATE_PEOPLE·ACTIVITY_LOG empty=베이스 페이지 없음(통제화면 MVP제외)→베이스 선제작 필요. ② PersonAddForm 신규 독립페이지가 구 PersonList `person_add_form` variant와 **중복**(정본=신규, 구변주 폐기/리다이렉트 필요). ③ RelationScan 스토리 default→loading 개명(id 변경).

★배포 함정 재확인: 스토리북 증분배포가 매번 청크 3개 조용히 누락(SSH-8)→ 재배포+**전 청크 200 전수 스윕** 필수. [[project_cnote_storybook_structure_reorg]] [[feedback_cnote_front_git_scope]] [[feedback_outline_button_surface_bg]]
