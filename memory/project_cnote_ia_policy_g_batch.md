---
name: project_cnote_ia_policy_g_batch
description: CNOTE IA 정책(대메뉴·헤더·nav)+개선배치 G0~G7(v0.17~0.20·260805)
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-08-05T03:53:37.171Z
---

★260805 [MVP2] **IA 정책 정본화 + 개선 배치 G0~G7 완결**(v0.17.0~v0.20.0 배포). 정본=`01_docs/설계_명세/대메뉴_헤더_IA정책_v0.1_260805.md`·`_WORK_PLAN_기획개선배치_260805.md`. ★경로=ISPARK\ 하위(마이그레이션 후).

**IA 정책(사용자 확정)**:
- **하단 5탭 전원 공통·불변**: 홈·인맥·(녹음FAB)·할일·마이. **nav=1depth 탭 루트에만**(하위=뒤로가기만). **게이트 check-nav-policy.mjs**(위반=빌드 FAIL·화이트리스트 8: 본인4+비서4).
- **두 비서 분리**: **AI비서(챗봇)=전 탭 헤더 우상단 🤖 상시**(→SCR_ASSISTANT·진입점 확정) / **비서(사람)=조건부**(마이 '👥 위임·비서 관리'·비서 보유자만·일반 임원 미노출).
- 헤더 규격: 공통 [🤖][🔔]+탭 유틸 1개(홈=📅 캘린더·인맥/할일=🔍·마이=⚙). **날짜▾=그날 브리핑용**(캘린더 아님·사용자 지적). 홈 전 상태 통일.
- **비서 모드 순환 완결**: 마이 스위처(SCR_ACCOUNT_SWITCH)→비서 4탭(홈·받은요청·활동·**신규 SCR_DELEGATE_MY**='내 모드로 돌아가기' 이탈점).

**개선 배치(v0.19~0.20)**:
- **G1 명함공유**: BS_CARD_SHARE 인라인 프리뷰+card-share-real(단면/양면)·**SCR_CARD_PREVIEW=받는 분 URL 랜딩 재정의**(브라우저 프레임·파일⬇·**반응형 480 중앙**·사용자 확정).
- **G2 녹음 백그라운드**: SCR_RECORDING [▽내리기]+**WGT_RECORDING_PILL**(전역 미니필 🔴+타이머만·미니멀 확정·탭=복귀·정지는 녹음화면만).
- **G3 관리인맥 재분리**(v0.13.0 재정의): ★=순수 즐겨찾기 / **🔔 관리인맥=인물상세 명시 스위치**(3단 순환 토글 기각—recall 부담). 켜면 즐겨찾기 포함(상위 티어). CARD_PINNED_UPDATES 구동=관리인맥.
- **G4 위치기회(C3 첫 구현)**: **km 반경(~1km)+체류+쿨다운+관리인맥 우선**(구/시 기각—반복피로). WGT_PUSH_LOCATION·SCR_NEARBY_OPPORTUNITY(근거 "약800m·명함 기준"·아웃링크 CTA)·설정 옵트인(기본OFF·경로 저장 안 함). 정본=`위치기반_기회포착_설계_v0.1_260805`(C3 카탈로그 포함).
- **G5 위임 권한 오버스펙 제거**: 인앱 메일 작성/발송 없음(실측·발송=아웃링크) → 이메일초안·자동발송 권한 삭제→'할일·메모 작성'. CONFIRM 답장 섹션 제거(일정 승인 중심).
- **G6**: delegate 정렬 완결(대표: MANAGE·INVITE·CONFIRM·맡기기 / 비서: 전환·홈·인박스·처리·활동·비서마이).

★스토리북2 device 백로그 대폭: MainTabHeader 규격(🤖🔔)·nav 스윕·신규 story(NEARBY·PUSH_LOCATION·RECORDING_PILL·DELEGATE_MY·CardPreview 랜딩·BSCardShare real). [[project_cnote_delegate_role_split]] [[project_cnote_pinned_briefing]] [[project_cnote_ai_assistant]]
