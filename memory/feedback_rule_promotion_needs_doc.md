---
name: feedback_rule_promotion_needs_doc
description: 규율은 문서에 등재돼야 승격이다 — 저널·changelog에만 있으면 다음 세션이 못 본다. 배포 검증은 층마다 수단이 다르고 md5는 전파까지만 증명한다
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 171ed1d5-5dcb-4f03-83ee-2be37c4679dd
  modified: 2026-08-14T22:29:22.012Z
---

★260815 CNOTE. 마스터가 *"이 규율을 전 세션 규칙으로 올린다"*고 선언했으나 **실제 문서에는 0건**이었다(UI_CONVENTIONS·완결성 체크리스트 grep). 지적하니 마스터 인정 — *"내가 말만 하고 안 올렸다"*.

**Why**: 260811에 같은 형태로 실패했다 — 규약이 changelog에만 있어 그 뒤 만든 화면 10곳이 위반 상태였다. **선언과 등재는 다르다.** 같은 날 `0b20c13`도 같은 계열이었다(인계를 저널에 적었는데 담당이 같은 파일을 열고도 안 고쳤다).

**How to apply**:
- 규칙·규율이 "승격됐다"는 말을 들으면 **정본 문서를 grep해 실재를 확인**한다. 없으면 알린다.
- 등재는 **신설보다 기존 항목 확장**을 먼저 검토 — 항목 수가 안 늘어 상계(다이어트 규율)가 불필요하다. 선례 = `B1-05` 확장, 이번 `F1-03` 확장.
- 규칙 문서는 오너가 있다 → **제안만 하고 승인 후 등재**(침묵 수정 금지).

## 배포 검증 — 층마다 수단이 다르다
- **mid-fi/flow**: `curl -s <라이브URL> -o /tmp/x && md5sum <로컬> /tmp/x` → 해시 일치 = 전파 완료. (mid-fi는 열어볼 스토리가 없어 이 층이 비어 있었다)
- **스토리북**: 라이브에서 실제 스토리·링크를 연다.
- ★**"N개 업로드" 성공 보고 ≠ 라이브 반영.** 260814 C4에서 소스는 고쳤는데 라이브가 구버전이라 "안 보인다"로 되물렸다.
- ★★**해시가 같아도 "파일이 같다"는 뜻이지 "화면이 맞다"는 뜻이 아니다** — 같은 날 D2에서 게이트·정량 전부 통과·해시 일치 상태에서 [[feedback_visual_verification|눈]]이 결함 2건을 잡았다(거짓 제목 · 3중 라벨 중복).

관련: [[feedback_no_unverified_as_fact]] · [[feedback_visual_verification]] · [[project_cnote_checklist_v11_downstream]]
