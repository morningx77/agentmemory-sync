---
name: reference_cnote_menu_order_ssot
description: "CNOTE 메뉴 순서 정본(SSOT)=flows.json flows[]. 프로토타입·flow.html·스토리북 3곳 정합 규칙"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-07-30T01:12:33.694Z
---

★260730 CNOTE(Tieming) 화면설계 **메뉴 순서 정본(SSOT) = `data/flows.json` 의 `flows[]`**. 사용자 지시로 프로토타입·flow.html·스토리북 세 곳 메뉴 순서를 이 하나에서 파생하도록 정본화.

**구조 진단(왜 어긋났나)**: 프로토타입 좌측 흐름메뉴 = `flows.flows`(build_prototype이 embed) / flow.html 하위메뉴 = 같은 flows[]를 build_flow_nav가 `_flow_nav.json`으로 변환 / 스토리북 = 별도 repo·storySort 미설정 → 카테고리 내부 알파벳순(SPLASH가 중간에 묻힘). 즉 **프로토타입·flow는 이미 같은 소스**였고 시각차는 build_flow_nav가 _screen_links 상태를 **그룹 꼬리에 push**(52~64행)해서 생긴 것. 스토리북만 진짜 별도.

**정본 카테고리 순서(유틸리티 뒤로·사용자 승인)**: ⓪공통 ①온보딩·시작 ②미팅 기록·정리 ③홈·브리핑 ④인맥·관계 ⑤소통·일정 ⑥할 일 ⑦캘린더 ⑧알림·위젯 ⑨검색·인맥등록 ⑩설정·연동 ⑪IBMS2 연동. (비서·통제=flows.json에 없어 애초에 nav 미노출→백로그 불필요.)

**적용(재사용 도구)**:
- 순서 변경 = **flows.json flows[] 순서 / 각 flow.steps 순서만 편집**(세 곳 자동 정합). 라벨도 flows.json flow.label.
- `scripts/export_menu_order.mjs` → `data/_menu_order.json` 생성. `categories`(중복 허용·흐름관점) + `storybookOrder`(1화면 1카테고리·primary=normal 상태 첫 등장 카테고리). 스토리북 계약.
- `scripts/build_flow_nav.mjs` 수정: 상태(SCR|variant)를 base 화면 바로 뒤로 재정렬(baseOrder 인덱스 정렬)→꼬리덤프 해소. **build_flow_nav→build_btn_nav 순서 준수**([[reference_flow_btnnav_rebuild_trap]]).
- `scripts/check-menu-order.mjs` 게이트: flows.json↔_menu_order.json 동기(하드) + 스토리북 title 카테고리 드리프트(경고, ../../03_dev/cnote-front/storybook/src/pages 스캔). 프로젝트 CLAUDE.md 게이트 목록에 등재.

**스토리북 반영(스토리북2 소관·저널 전달)**: storySort를 storybookOrder로 구성. 현 불일치 23건(④'사람·관계'→'인맥·관계'·⑪'IBMS2·연동'→'IBMS2 연동'·설정계열 ⑦→⑩·캘린더 ⑨→⑦·검색계열 →⑨ 등) + 고아 2건(SCR_NAME_QUICK 삭제·SCR_CALL_MEMO 확인). ⓪=U+24EA라 순수 알파벳 정렬 시 맨뒤→explicit order 필수. BS_/WGT_는 Component 스토리(Page storySort 대상 아님).

배포=prototype+flow(flows.json/_menu_order.json은 소스라 미배포). [[project_cnote_brand_tieming]]
