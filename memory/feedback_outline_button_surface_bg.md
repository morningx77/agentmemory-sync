---
name: feedback_outline_button_surface_bg
description: 투명 배경 요소(outline/ghost 버튼 등)는 회색 캔버스 위에서 안 보임 — 캔버스 배치 요소는 서피스 배경 필수
metadata: 
  node_type: memory
  type: feedback
  originSessionId: a1564576-d2f1-4b63-8e58-a95aa706891e
---

CNOTE(및 유사 디자인)에서 **투명 배경(bg-transparent) 요소는 배치되는 배경에 따라 가시성이 달라진다**. outline/ghost 버튼을 `bg-transparent`로 만들면 흰 카드(bg-surface) 위에선 우연히 맞지만, **회색 캔버스(bg-canvas) 위에 직배치하면 배경이 비쳐 사라진다**(테두리가 border-border처럼 저대비면 특히).

**Why:** 사용자(디자인 오너)가 260713 "+ 인물 추가" 버튼(neutral)이 회색 배경에서 구분 안 됨을 지적 — "다른 화면에서도 동일 문제". 근본원인=미드파이 정본 `_midfi_kit.css`의 `.btn.outline{background:#fff}`(항상 흰 배경)인데 RN이 `bg-transparent`로 구현했던 것.

**How to apply:**
- outline/ghost 버튼은 **항상 서피스 배경**(`bg-surface`)을 주고, 테두리 색으로만 구분한다(중립=border-border, 강조=border-primary). CNOTE Button은 neutral·ghost variant를 bg-surface로 수정 완료(45곳 파급).
- 신규로 캔버스에 요소를 놓을 때 "이 배경이 캔버스(회색)인가 카드(흰색)인가?"를 먼저 확인. 캔버스 위 요소는 투명 금지.
- 코드가 통과해도 **회색 캔버스 배경에서 렌더를 눈으로 대조**(코드=성공≠시각=구분됨). [[feedback_visual_verification]] [[next_session_cnote_contrast]] 연장선.
- 정본 대조로 발견: 시안/미드파이가 흰 배경을 쓰는데 코드가 투명이면 버그.
