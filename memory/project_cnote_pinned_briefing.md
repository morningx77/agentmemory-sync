---
name: project_cnote_pinned_briefing
description: CNOTE(TieMing) 브리핑 고정 대상=즐겨찾기 재정의 + 홈 전용 카드(v0.13.0)
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-08-03T07:29:30.090Z
---

★260803 v0.13.0 [MVP2] **브리핑 고정 대상(챙기는 분)** — 관심신호(1.5차 승격)의 구체화. 정본 설계=`01_docs/기획/브리핑_고정대상_설계_v0.1_260803.md`.

**개념 재정의**: 즐겨찾기 ★ = "챙기는 분"(브리핑 고정 대상)으로 **통합·재정의**(별도 토글 없음·1:1). 기존 "순수 핀·AI 분리" 정의 폐기. → 인맥 노출 **이중구조**: 고정 대상(내가 통제=즐겨찾기) ↔ 오늘 연락하면 좋은 인맥(AI 발굴=quiet_day_care). 역할 분리.

**반영(mid-fi)**:
- **SCR_HOME 신규 전용 카드 CARD_PINNED_UPDATES** — 고정 대상 상태변화만 노출. 4유형(📰뉴스·🔄직책소속·⏳오래연락없음·🎂생일). 관계 깊은 순(important_person rank) 상한3+더보기. **fill 없음**(연락=아이콘 고스트, 화면 fill 1개=미팅 브리핑 유지). 변화 없으면 카드 숨김. 위치=오늘액션 다음·부가 접기 위. 홈 접기서 중복 소식 제거.
- **의미 전달 UX**(사용자 지적 핵심 갭): 인물상세 ★토글 data-link=BS_PINNED_INTRO + 라벨 LABEL_PINNED_STATE(바이올렛 pill "★ 챙기는 분 · 홈 브리핑에 소식 표시") + 지정 토스트. 사람탭 스트립 서브텍스트 "홈에서 소식을 챙겨드리는 분들". **신규 BS_PINNED_INTRO**(첫 지정 1회 안내: ⭐+4유형+알겠어요).
- **중복 정리**: 고정 대상 뉴스/케어=전용 카드 승격, 기존 회사뉴스·연락제안=비고정만.

**배선**: nav_map 2엔트리·flows people BS_PINNED_INTRO 스텝·build_prototype EXTRA. 게이트 170키·미커버0·눈검증(홈카드·★라벨·BS시트) PASS.

**개발 메모**: 8시 브리핑 집계 시 4종 스캔. 뉴스=새벽4시 크롤 고정대상 우선큐(일자별 수집테이블 재활용)·케어=last_contact 임계(quiet 재활용)·생일=person 필드. ⚠️**직책 자동감지 난도**→명함 diff+수동표시부터, 자동감지 후행.

★device 반영=스토리북2(catch-up 백로그 4번째, v0.11.1·v0.11.2·v0.12.0 다음). BS_PINNED_INTRO story 신규 필요. [[project_cnote_mvp2_ia_audit]] [[project_cnote_v08_design_batch]]
