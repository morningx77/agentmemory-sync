---
name: feedback-design-output-location
description: 디자인 작업 완료 시 반드시 Figma 확인 위치(링크·노드ID·페이지/섹션)를 안내
metadata: 
  node_type: memory
  type: feedback
  originSessionId: bccc86de-297c-4b84-91df-91629bde597f
---

디자인 작업(화면 조립·수정·감사 등)이 **완료될 때마다 반드시** 사용자가 결과 이미지를 볼 수 있는 **Figma 위치를 명시**한다. 형식 = 클릭 가능한 URL(`https://www.figma.com/design/OEqJJI0oCGgGZ28exd866d/CDS?node-id=<노드>`) + 노드ID(다크/라이트) + 어느 페이지·섹션인지.

**Why:** 사용자는 매 산출물을 자기 눈으로 시각 검증한다(코드 성공≠시각 정상, [[feedback_visual_verification]]). 링크가 없으면 확인 자체를 못 한다. 실제로 "화면 어디서 보지?"를 반복 질문했다.

**How to apply:** 디자인 완료 보고 메시지 **끝에 항상** Figma 위치를 붙인다. **★페이지 이름을 반드시 명시**(예: "**`CNOTE · Templets`** 페이지 > `🧩 모듈 조립판 · SCR_xxx` 섹션") — 사용자가 링크뿐 아니라 페이지 이름으로 직접 찾을 수 있게. CNOTE 화면 템플릿 정본 위치 = `CNOTE · Templets` 페이지(549:301) 조립존 x=4840. node-id는 대시 형식(`1670-2745`). 섹션 링크(다크+라이트 나란히) + 개별 프레임 링크 둘 다 주면 좋다. 관련 [[reference_cds_harness]] [[reference_cnote_screen_links]].
