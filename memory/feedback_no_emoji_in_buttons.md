---
name: feedback_no_emoji_in_buttons
description: CNOTE 버튼에 이모지 금지 — 필요하면 phosphor 아이콘. 편집 어포던스는 기존 스타일(PencilSimple 아이콘)
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 1763df05-ea22-4314-8d21-41768b3621ee
  modified: 2026-08-10T11:45:37.921Z
---

★260810 사용자 지적. **버튼(및 인터랙티브 컨트롤)에 이모지(✎·🔍 등) 사용 절대 금지.** 심볼이 필요하면 **phosphor 아이콘 컴포넌트**를 쓴다.

**Why:** 이모지는 플랫폼별 렌더 불일치·비일관·저품질로 읽힘. CDS는 아이콘 시스템(㉑ 아이콘 규율)을 정본으로 둔다.

**How to apply:**
- 편집 버튼 = `IconButton variant="plain"` + `PencilSimple` (NoteResult·Person의 기존 편집 어포던스와 **동일 스타일** — 아이콘만). `<Button>✎ 수정</Button>` 금지.
- 배지/상태의 ✨·⚠는 텍스트 이모지가 아니라 `Sparkle`·`Warning` 아이콘 컴포넌트로.
- Select 옵션 라벨 등 데이터 문자열의 🔍도 제거.
- 예외(이번 범위 밖·판단 필요): 표시 전용 칩(TaskChip 📅/👤)·AI 마커 체크박스 라벨(✨)은 버튼이 아니라 별도 판단 — 하지만 방향은 아이콘화.
- 실사례: OUTBOX [✎ 수정]→IconButton·검색옵션 🔍 제거(커밋 4acd4a0) / 선반 제목 이모지→SVG(병렬 세션 e054466).

관련: [[feedback_design_holistic_not_piecemeal]] · [[reference_cnote_deploy_sftp_kex_fix]]
