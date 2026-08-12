---
name: reference-cnote-figma-icon-library
description: CNOTE Figma 파일에 Phosphor 아이콘 라이브러리(컴포넌트셋 1512종)가 있다 — 화면 조립 시 SVG 직접 그리지 말고 인스턴스로 쓸 것
metadata: 
  node_type: memory
  type: reference
  originSessionId: da39437f-0edf-404d-802c-2d96033dbe51
  modified: 2026-08-12T08:33:44.841Z
---

CNOTE Figma 파일(`OEqJJI0oCGgGZ28exd866d`)의 **`🎨 Icon` 페이지**에 Phosphor 아이콘이 **컴포넌트셋 1512종**으로 있다. 각 아이콘 = 하나의 COMPONENT_SET, variant 축 = **Format=Outline/Stroke × Weight=Regular/Thin/Light/Bold/Fill/Duotone**(12 variant). 예: Sparkle 셋=`44:2248`, Bell=`44:33758`, CalendarBlank=`44:16677`, House=`44:8620`, UsersThree=`44:67221`, ListChecks=`44:47480`, UserCircle=`44:66321`, Microphone=`44:13364`, Crown=`44:18670`, RocketLaunch=`44:9783`, TrendUp=`44:43420`, CaretRight=`44:63698`, CaretDown=`44:63480`, DotsThree=`44:36243`, Envelope=`44:4239`, ListDashes=`44:47538`.

**How to apply**: 화면(SCR_*)을 Figma로 조립할 때 아이콘은 **반드시 이 라이브러리 컴포넌트를 `createInstance()`로 인스턴스**한다. `createNodeFromSvg`로 직접 그리지 말 것 — 260812 SCR_HOME 재구성에서 SVG로 그렸다가 사용자가 "왜 라이브러리 컴포넌트를 안 쓰냐"고 잡음(AI 필·nav·crown 등 전부 교체). variant는 storybook의 phosphor weight에 맞춘다(nav/sparkle/rocket/crown=Fill, 헤더 calendar/bell·caret·trend·dots=Bold, envelope=Regular). Format은 Stroke로 통일해도 됨.
- 인스턴스 탐색: `page.findAllWithCriteria({types:['COMPONENT_SET']})` 후 name 필터 → 원하는 variant COMPONENT(자식) id로 `getNodeByIdAsync().createInstance()`.
- **재색**: 인스턴스 하위 VECTOR의 fills·strokes를 [[reference-cnote-maintabheader]] 방식으로 토큰 바인딩(setBoundVariableForPaint). Format 무관하게 fills+strokes 둘 다 세팅하면 안전.
- 예외: NetworkMotif 등 표준 아이콘 아닌 커스텀 조형만 직접 그린다.

관련: SCR_HOME 재구성 정본 = 섹션 `2545:7208`(라이트 `2549:126` / 다크 `2563:126`), 토큰 컬렉션 `CNOTE Tokens 2:2`(Light 2:0/Dark 2:1). [[feedback_visual_verification]](코드재현≠실렌더) 실사례.
