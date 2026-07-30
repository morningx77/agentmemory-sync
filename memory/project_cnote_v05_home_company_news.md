---
name: project_cnote_v05_home_company_news
description: CNOTE v0.5 착수 — 조용한 날 홈 3선반·우리 회사 소식 모듈·설정 IA. v0.4 동결 후 신규 작업트리
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-07-25T07:57:52.303Z
---

★260724 CNOTE **v0.5 착수**(v0.4 동결 후 신규). 개발이 v0.4 참조 중 → `make-snapshot.mjs v4_개발기준본 20260724`로 v0.4 동결(`_versions/`·라이브 스위처 병존), 작업트리=v0.5. **신규 설계는 전부 v0.5**.

**완료·배포(미드파이/nav/flows/프로토타입/changelog v0.5 섹션):**
- **조용한 날 홈 3선반**: SCR_HOME|quiet 재구성(CARD_QUIET_HERO + SHELF_RECONTACT·FOLLOWUP·MEMORY). 선반 킷 `_midfi_kit.css .shelf/.shelf-*`(가로 캐러셀·peek 20%·scroll-snap). ★규칙=항목 3+캐러셀/<3 세로폴백·"왜 지금" 근거 1줄·[전체보기].
- **우리 회사 소식**(사용자 최우선·재사용 모듈 SHELF_COMPANY_NEWS): 뉴스카드(썸네일·제목·요약·발행일·탭→기사). 데이터=네이버 뉴스 API(회사명). 배치 3곳=명함 인식 결과(SCR_CARD_RESULT normal 리빌)·내 회사 정보(SCR_COMPANY_INFO)·설정. **신규 화면 SCR_COMPANY_NEWS**(전체목록 `.news-row` 세로). 상태 잠잠(6개월+ "한동안 회사 소식이 없었네요" 담백)·없음=스토리북2. 확산=인물 상세(상대 회사 뉴스)→미팅준비팩.
- **설정 IA**(결정: 히어로+진입행 둘 다): 설정홈 상단 CARD_SETTINGS_PROFILE_HERO(프로필·회사 히어로→내계정) + 내계정 소식 진입행(→SCR_COMPANY_NEWS). ★내 계정 미니캐러셀 없음(진입행 유지).
- **프로토타입 URL 딥링크**: 화면·변경이력(report)·메모 goto/해시 반영·새로고침 복원(build_prototype.mjs). ★`history`가 앱 내부 변수라 `window.history` 명시.

**★v0.5 완결(260725):** 스토리북2 device 전량 완료(48e252c~84c60c7)→기획 배선 완료. recontact(SCR_REPLY_NEEDED|recontact)·성장상태(quiet-new 씨앗+GROWTH_STEPS)·BS_CARD_CONTROL·설정 히어로/퀵액션·회고 전용필터(SCR_PERSON_LIST|memory) 미드파이 device 신설+nav/flows/_screen_links 정합. ★홈 재설계 역반영(사용자 적대검증): quiet 히어로 '오늘 이거 하나' 승격·primary fill 5→1·선반 강등(outline). 게이트 149키·미커버0. **대기 task 0**. 다음 사이클=사람탭 Phase2(그룹축 실측)·추천제어 L2/L3·C레벨 T1(미팅준비팩vs위임추적 미결) — 별도 킥오프.

**함정:** check-coverage=로파이 대조라 신규 v0.5 화면 `_required_ids` 제외(flows 핫스팟으로 커버). nav_map=`{_README,map:{…}}`. make-snapshot이 `.deploy.local.json` 사본 남기던 것 EXCLUDE 보강+기존 사본 삭제(보안). 정본=[[project_cnote_design_reconciliation]] 계열. 핸드오프 _HANDOFF_기획세션_260724.md·계획 _WORK_PLAN_홈풍성화_추천제어_260724.md.
