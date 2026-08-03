---
name: feedback_design_holistic_not_piecemeal
description: 디자인은 전체 품질·시스템·비례를 먼저 세우고 하라 — 단편 수정 누적 금지
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 1763df05-ea22-4314-8d21-41768b3621ee
  modified: 2026-08-03T00:49:02.253Z
---

디자인 작업은 지적된 부분만 국소 반영(코드 패치하듯)하면 매 수정이 새 결함을 낳고 전체 품질이 무너진다. 전반적 품질·시스템·비례·일관성을 먼저 세우고 **원점에서 설계**해야 본질적 디자인이 된다.

**Why:** CNOTE empty 히어로 작업에서 opacity→두께→비율→겹침을 하나씩 단편 수정하다 클립보드 마크가 "배터리처럼" 됨. 사용자: "단편만 개발 코드 반영하듯 하면 더 이상 본질적 디자인을 할 수 없어. 전반적 디자인 품질을 생각하며 해야 한다."

**How to apply:** 시각 재설계는 ① 정본 원칙(`02_design/screen_design_v2/DESIGN_PRINCIPLES.md`) 로드 → ② 전체를 한 시스템으로 설계(개별 마크가 아닌 패밀리 규율 먼저) → ③ 시안(Artifact 갤러리 등)으로 승인받고 일괄 구현. 열린 시각 설계는 `superpowers:brainstorming` 스킬로 방향부터. 배포 전 로컬 SVG 렌더로 사전검증하면 왕복 절감. [[project_cnote_empty_circle_language]] [[feedback_visual_verification]]
