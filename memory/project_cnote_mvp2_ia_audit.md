---
name: project_cnote_mvp2_ia_audit
description: CNOTE(TieMing) MVP2 착수 전 IA 점검·기획 대비 갭(260803)
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-08-03T01:08:41.471Z
---

★260803 CNOTE(TieMing) 1차 MVP(flow.html 연결 화면) 개발완료 → MVP2 착수 전 IA 점검. 정본 리포트=`01_docs/검토_분석/_MVP2_착수_IA점검_260803.md`.

**1차 실측**: SCR 화면 66(base)·상태 135·BS 21·WGT 10·12 카테고리·flows 12그룹/134스텝/318전이. 정합 100%(미커버0·목적지story0·메뉴순서 3곳 단일화, SSOT=flows.json). 기획 필수기능(음성기록·요약·후속·관계구조화·홈브리핑·캘린더·검색·알림·설정·IBMS2) 화면 커버.

**★핵심 갭 4**:
- **G1 비서위임(delegate 5)+통제(control 2)=7화면이 mid-fi에 존재하나 flows.json 0참조=프로토타입 고립**(도달불가). 설계됐는데 아무도 못 봄.
- **G2 기획 v2.1 문서 내부 모순**: MVP표 2버전 공존 — 구판(line 3730 비서위임 2차제외)↔신판(line 8721 비서위임 1차포함). "설계는 신판·배선은 구판".
- **G3 IA엑셀 CNOTE_IA_v2_draft_260616(36화면) 미현행화**(실제 66+). 엑셀→크로스워크→mid-fi 계획적 파생이라 어긋난갭 아니나 엑셀 갱신 안 됨(정본 오인 위험).
- **G4 IBMS2=기획문서 밖 스코프**(v2.1엔 'Next Sgate 연동'만·260715 개발단 요청 편입).

**MVP2 후보(기획 §10.3)**: 1.5/2차=관심신호·기회알림·AI연락제안·대화형AI비서(3계층)·태블릿브리핑보드·관계도시각화·잠자는인맥·예약자동대행. 별도개발트랙=알림 dynamic19종 AI생성(정적→데이터구동)·relationTier 산출로직(3개월2회룰·배지UI만 반영).

**★결정(260803 사용자)**: **비서위임(delegate)·통제(control)=2차 확정**. 화면 7종 이미 설계완료·1차 flow 미배선=의도된 것(2차에서 함께 정돈). G1은 갭 아니라 2차 백로그 이관항목으로 재분류. 기획 신판(8721 1차포함) 표기 무효. 미결=②IBMS2 공식편입 명문화 ③MVP2 우선순위=기획§10.3 표 채택 권장.

**착수전 정비**: 1)delegate/control flows 연결(1차 확정시) 2)기획 구판 MVP표 아카이브·신판 단일화 3)IA엑셀 현행화 or 정본 재선언(flows.json+mid-fi) 4)control 진입경로 5)dynamic알림/relationTier=개발트랙 분리. 주간보고 차주=TieMing BI고도화·명함공유 신설·브리핑대상 선택UX·가독성·앱테스트 검증. [[project_cnote_brand_tieming]] [[reference_cnote_menu_order_ssot]]
