---
name: project_cnote_multicard
description: CNOTE 멀티 명함(내 명함 N개) v0.23.0 구현 완료(260806)
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-08-06T05:23:49.058Z
---

★260806 [MVP2] **멀티 명함(내 명함 N개) v0.23.0→v0.23.1 구현·배포**. 정본=`01_docs/기획/멀티명함_설계_v0.1_260806.md`(✅구현완료로 현행화). 배경=대표·임원 복수 정체성(회사 대표+협회 회장+사외이사).

★**v0.23.1 = SCR_MY_CARDS(관리 화면) 신설 직후 폐기**(사용자 지적: 칩 전환+카드 ✎ 편집과 중복 — 별도 관리 메뉴 불필요). 흡수: 기본 지정=|multi 상단 행·삭제=|multi 맨 아래 적색 텍스트(저장과 분리)→BS_CARD_DELETE_CONFIRM(유지)·1개 사용자 발견 경로=마이 메뉴 "＋ 명함 추가 N/5"(|new 직행). 교훈=관리 목록 화면은 인라인 스위처(칩)가 있으면 대부분 중복 — 저빈도 행동(기본지정·삭제)은 편집 폼에 묻는 게 60대에도 이득.

**결정(사용자 확정 260806)**: ① 상한 **5개** ② 삭제=**공유 링크 즉시 만료**(30일 유예 기각·BS에 명시 경고, 만료 410 랜딩 문구=개발 후행) ③ 연락처=**1차 공통**(명함별 노출 구성=2차).

**산출(전부 2midfi_08_settings.html)**:
- **SCR_MY_CARDS**(신규 화면·인벤토리 등록): 명함 카드 리스트(편집·기본으로 지정·삭제)+[＋새 명함]+상한 카운터. **기본 명함 삭제 불가**(다른 명함 기본 지정 후 가능).
- **BS_CARD_DELETE_CONFIRM**(신규 시트·EXTRA 등록): 즉시 만료 경고+적색 삭제.
- **SCR_SETTINGS_ACCOUNT|cards**: 칩 스위처(✓현재·타명함·＋)+선택 명함 카드+dots. ★숨은 스와이프만 금지(60대)—칩이 정본 컨트롤. 1개면 normal 그대로(점진 노출). 마이 메뉴에 "🪪 내 명함 관리" 행=1개여도 상시(두 번째 명함 생성 경로).
- **SCR_PROFILE_EDIT|multi**: 편집 대상 칩+**이 명함 정보**(라벨·직책·부서·회사·실물사진) vs **모든 명함 공통**(이름·연락처→[공통 정보 편집]=normal 폼) 분리—수정 파급 오해 방지. **|new**: 촬영으로 채우기+빈 폼, 연락처 재입력 없음.
- **BS_CARD_SHARE 보낼 명함 칩**(디지털·실물 2상태·2개 이상일 때만)+SCR_CARD_PREVIEW 선택 명함 바인딩 note.

**함정/교훈**: 이름+배지 flex 행=긴 이름 중간 줄바꿈→TEXT_MY_NAME `white-space:nowrap` 필수. 화면형 CTA는 `.btn.fill`(다크·시트용) 말고 인라인 보라 #4127D1(프로필편집 계열 관례). 게이트 잔여 2 FAIL(_component_types 낡음·validate-components 미분류)=기존 부채(cataloger 워커 재실행·마스터 트랙)—이번 신규분도 거기 합류. [[project_cnote_ia_policy_g_batch]] [[project_cnote_card_import_theme]]
