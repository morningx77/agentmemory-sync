---
name: project_cnote_ibms2_integration
description: CNOTE×IBMS2(영업CRM) 연동 신규 3화면 IA통합·배포 완료. ★내비 4탭 유지(개발 5탭 반려)·midfi 배포 고정파일목록 함정
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
---

CNOTE에 **IBMS2(영업 CRM) 연동** 3화면이 개발단(`next.sgate.biz/v1/ibms2-design/`)에서 추가됨 → 기획 클로드가 IA 검토 후 정본 통합·배포 완료(260715).

**3화면**: SCR_SETTINGS_IBMS2(설정 OAuth 연결/해제)·SCR_MY_TIMELINE(본인 활동 통합 피드=IBMS2 전송 입구)·SCR_ACTIVITY_TO_IBMS2(활동→영업건 Opportunity 전송, 영업건 2+/1/0/전송성공 상태).

**★핵심 IA 결정(사용자 확정)**:
- IBMS2 = **핵심 MVP 상시 노출**(숨김 모듈 아님, 미연동은 연결 유도).
- MY_TIMELINE = **5번째 하단 탭 아님 → 홈 하위 보조 진입**. **하단 내비 4탭+FAB 유지**(홈·사람·녹음FAB·할일·설정). 개발이 "5번째 탭"으로 만든 것을 시니어 UX 근거로 반려 → 개발 회신 필요(전달문에 명시).

**정본 반영**: 인벤토리+3 · flows ⑪ IBMS2 흐름(설정→IBMS2·홈→타임라인·인물 3점→전송) · 신규 `2midfi_10_ibms2.html`(6device)+설정/홈/인물 편집 · `1lofi_13_ibms2.html` · IA엑셀 `CNOTE_IA_v2_draft_260616.xlsx` No86~88 + `export-ia-ids.py` 재export(sync-check IBMS2 해소). 프로토타입 74화면·미커버0.

**★재발방지 함정**: `deploy-sftp.mjs midfi` 타겟은 `.deploy.local.json`의 `sftp.targets.midfi.files` **고정 파일목록**을 씀 → 신규 미드파이 파일(2midfi_10 등)은 이 목록에 추가해야 배포됨(최초 누락됨, 비민감 필드만 수정).

문서: 계획서 `_WORK_PLAN_ibms2_ia_integration_260715.md` · 전달문 `_전달_IBMS2_IA통합_260715.md`(모두 screen_design_v2/).

**후속**: 스토리북 3화면 조립(이후) · CRM용어(영업건/Opportunity) UX라이팅 검수 · 미연동 유도 카피(baseline 미구현).

관련: [[project_cnote_midfi_meta_nav]] [[project_cnote_ia_source_of_truth]] [[reference_cnote_ops]] [[project_cnote_storybook_structure_reorg]].

**SCR_RELATION_NETWORK 백로그 해소(260715)**: 홈 CARD_RELATION_COUNT("관리 중인 관계 127")가 부재 화면 SCR_RELATION_NETWORK로 죽은 링크 → **옵션A: 링크를 SCR_PERSON_LIST로 재연결**(관계수→사람목록 드릴다운). SCR_RELATION_NETWORK는 1차 인벤토리서 제외(관계망 시각화 뷰는 프리미엄 후속). CARD_RELATION_COUNT는 1lofi_03_home 백필. → **check-coverage 누락0 완전통과**(화면59/59·컴포넌트5/5).
