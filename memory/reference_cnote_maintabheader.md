---
name: reference_cnote_maintabheader
description: CNOTE 메인탭 상단 헤더 정본 = MainTabHeader 모듈. 헤더 변경은 마스터 1곳
metadata: 
  node_type: memory
  type: reference
  originSessionId: b98c49ce-2eac-4bb5-932b-775097a96258
---

CNOTE 메인탭(홈·사람·할일·설정) 상단 진입(검색·알림) = **`MainTabHeader` 모듈**(CDS `OEqJJI0oCGgGZ28exd866d`, 셋 `2174:129`)로 통일 완료(260708, 오피스 세션).

- **단일 마스터 + `Type` enum 3변형**(시맨틱 토큰 자동 양모드 플립 — Dark/Light 변종 불필요):
  - `home`(2174:126): 아바타+2줄(날짜+타이틀)+검색+벨+배지. **아바타=홈 전용**
  - `tab-search`(2174:127): 타이틀1줄+검색+벨. 할일
  - `tab`(2174:128): 타이틀1줄+벨만. 사람·설정(검색 제외)
- **NotificationBadge**(셋 `2134:519`, none/dot/count·9+·danger·글로우0) = 벨 우상단 nested. 화면이 State 오버라이드(홈=count "3", 타탭=none).
- 적용: 홈 12상태 + 할일 + 사람(기존 "알림" 텍스트 제거·인라인 SearchBar 유지) + 설정 = **15화면 전부 모듈 인스턴스**. 타이틀=텍스트 오버라이드.
- **★향후 헤더 변경은 MainTabHeader 마스터 1곳만 수정 → 15화면 일괄 반영.** 화면에 인라인으로 헤더 그리지 말 것.
- AppBar(`340:35`)는 상세화면(`Type=detail`)용으로 별도 존재. 다크 배경 교정됨(bg 105:11→2:13, 로직체계 v2.2).

CDS 하네스([[reference_cds_harness]])로 제작. 정본 이력=CDS_로직체계_정본_260706 §⑥ v2.1~v2.3. 계획서=`02_design/_WORK_PLAN_topbar_notify_search_260708.md`. 눈검증 필수([[feedback_visual_verification]]).
