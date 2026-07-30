---
name: reference_flow_btnnav_rebuild_trap
description: flow.html 화면 내 버튼 이동 죽음 = _flow_nav.json btnNav 유실. build_flow_nav가 btnNav를 덮어씀 → 반드시 build_btn_nav를 마지막에 실행
metadata: 
  node_type: memory
  type: reference
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-07-29T07:09:40.567Z
---

★flow.html의 화면 내 버튼(emitCta) 이동은 **`_flow_nav.json`의 `btnNav` 맵**에 의존한다(flow.html: `targetKey = FLOW.btnNav[screen+'|'+aux]` → render). btnNav가 없으면 **하드코딩 탭(BTN_NAV_*)·BTN_BACK 외 모든 화면 내 버튼이 먹통**("링크 안 됨").

**★★함정**: `btnNav`는 **build_btn_nav.mjs**가 생성한다. 그런데 **build_flow_nav.mjs가 _flow_nav.json을 btnNav 없이 통째로 덮어쓴다**. 따라서 nav_map/flows 수정 후 flow 재빌드는 **반드시 순서 = `build_flow_nav` → `build_btn_nav`(마지막)**. build_flow_nav만 돌리면 btnNav가 유실돼 flow 전역 버튼이 죽는다(260730 실제 발생: v0.8.5~0.8.9 동안 build_flow_nav만 돌려 btnNav 유실 → 사용자가 SCR_SIGNUP_VERIFY 인증완료·마이 메뉴 등 "링크 안 됨" 신고). 복구=build_btn_nav 재실행(btnNav 262개 복원).

**flow 배포 표준 절차**: nav_map/flows 수정 → `build_flow_nav` → `build_btn_nav` → (btnNav 채워졌는지 python으로 확인) → `deploy-sftp.mjs flow`.

**★aux 정합**: flow.html은 **스토리북이 emit하는 aux**(analyticsId)로 btnNav를 조회한다. 미드파이 data-aux와 스토리북 emit aux가 다르면(예: 미드파이 ATTENDEE_ADD_NEW ↔ 스토리북 BTN_ATTENDEE_ADD_NEW) 해당 버튼 먹통 → nav_map에 **양쪽 키 다 등록**(프로토타입=미드파이 aux, flow=스토리북 aux). 스토리북 신규 emit은 저널 "★★기획 nav_map 배선 요망"에 목록화됨 — 그 aux를 정확히 nav_map 키로. connect-* 등은 `SCR_HOME|connect-{type}|BTN_CONNECT_DATA`처럼 **상태 포함 키**(d.screen이 상태 포함). [[reference_cnote_flow_player]]
