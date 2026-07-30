---
name: project-cnote-screen-changes
description: CNOTE 프로토타입 화면별 반영 근거 자동집계 시스템 + 버전 라벨 v0.N + SCR_CARD_RESULT
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
---

CNOTE screen_design_v2 프로토타입에 화면별 "반영 근거"(개선 출처) 자동집계 도입.

- `scripts/export-screen-changes.mjs`: **미드파이(2midfi_*.html) 각 화면 issue-panel의 "✅반영/🟡확인" 항목**(=워커가 정제한 반영 결과)을 화면별 집계 → `data/_screen_changes.json` (40화면 99건). 항목 `{kind:enh|clar|issue|note|heur|usa, label, src, text}`. **B소스 병합**: `_usability_report_*after`의 휴리스틱/사용성도 화면당 ≤2건 정제 요약(1인칭 서사 `>`·표 `|`·내부표기 P3/[축]/이모지/화살표 제거)으로 병합 → issue-panel 없는 화면(SIGNUP_VERIFY 등)도 근거 복구. 검토자 원본 요청은 Firestore 메모(다른 검토자 메모)에 유지. 근거 카드 = `.sc-item{display:flex;flex-direction:column}`(배지 윗줄+텍스트 전체폭). **반영/후속과제 분리**: kind enh·new·heur·usa·note=🔧반영 근거 섹션, clar·issue=📌후속 과제(`<details>` 접이식, 하이파이/구현 추적용). 일치성 전수검사(Explore 6대×파일)로 거짓반영 1건(CALENDAR_DETAIL AI브리핑시각) 화면 보강. CARD_RESULT loading state(촬영→OCR처리→결과) + flows loading step 추가.

**댓글 3계층 시스템(2026-06-26)**: 검토자 메모=이슈 → 💬댓글 논의(Firestore memos에 `parentId`/`kind:comment`, 플랫 스레드+@멘션, build_prototype의 renderOthers/commentsOf/saveComment) → ✅확정(기획/PM만 — `localStorage.cnote_role==='pm'`, status·decision 필드) → export-screen-changes가 status='확정'&&decision인 이슈를 화면별 근거(kind:enh, label:'✅ 확정')로 자동 추출. **데모 검증 완료**(SCR_SIGNUP 임시확정→근거 표시→원복). 우측 패널 3섹션 구분(반영근거 읽기/내메모 입력/다른검토자 댓글, border-top 구분선). 확정 반영 = `node export-screen-changes.mjs && build`("근거 갱신"). (구버전은 _review_issues 요청 원문을 긁어 raw·90자 잘림 → "반영 결과" 소스로 전환)
- `build_prototype.mjs`: `/*SCREEN_CHANGES*/` 자리에 JSON 주입 + 파일상단 `const screenChanges` 로드. 메모 패널 `#screenChanges`에 "🔧 이 화면 반영 근거" 렌더(refreshMemoPanel 내 memoScr 다음, 출처 배지 👤/🔍/🧪). CSS `.screen-changes/.sc-item/.sc-badge` + 한글 클래스 `.sc-검토자/.sc-휴리스틱/.sc-사용성`.
- 버전 셀렉터 라벨 **v0.N**: `verLabel`(폴더명 `v1_개선전_20260624`→`v0.1-20260624`), `verLatest='v0.'+(VERSIONS.length+1)`. "최신/이슈반영전" 모호표현 폐기. ALL_VERS·addBtn 2분기 모두 적용.
- 신규 **SCR_CARD_RESULT**(명함 OCR 인식결과 확인·수정, 3상태 normal/loading/error) 추가 — CARD_SCAN 다음. CARD_SCAN 버튼 "인식 정보로 등록"→"직접 입력". flows·IA(_required_ids·xlsx)·1lofi_01·2midfi_01 반영. 현재 **1차 53화면 + 보조 11**.

재실행: `node scripts/export-screen-changes.mjs && node scripts/build_prototype.mjs`

[[project-cnote-wireframe-html]] [[project-cnote-ia-source-of-truth]]
