---
name: feedback-compact-threshold-relaxed
description: 사장님은 컨텍스트 50% 안팎을 「여유 많음」으로 본다 — 큰 작업 앞이라도 50%대에서는 컴팩트를 권하지 말고 킥오프만 갱신한 채 이어간다
metadata: 
  node_type: memory
  type: feedback
  originSessionId: fa05fec1-eacc-442b-b229-677ff1b66748
  modified: 2026-09-14T12:09:50.756Z
---

260914 ag기획 세션: 컨텍스트 52% 에서 B17(30턴+ 큰 작업) 착수 전 compact-prep 매트릭스(대량 = 40%)대로 `/compact` 를 권했더니 사장님이 「50%면 여유많아 컴팩트없이 가고 다음 턴에 진행하자」고 답했다.

**Why:** 1M 컨텍스트에서 50% 는 아직 절반이 남아 있고, 컴팩트는 사장님 손을 한 번 거쳐야 해서 흐름이 끊긴다. 매트릭스의 40% 기준은 이 사용자에게 너무 이르다.

**How to apply:** 50~60% 대에서는 컴팩트를 권하지 않는다. 킥오프 §0 재개 지점만 조용히 갱신하고 작업을 계속한다. 70% 가까이(context-guard 경고) 가면 그때 권한다. 관련 [[feedback_compact_kickoff_doc]]
