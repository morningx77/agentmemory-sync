---
name: reference-playground-tailwind-scan-gap
description: CNOTE 스토리북 작업대(playground)에서만 쓴 Tailwind 클래스는 CSS가 조용히 안 생긴다 — content 가 src·.storybook 뿐
metadata: 
  node_type: memory
  type: reference
  originSessionId: a25efdac-3c6d-4f0b-84ff-ea5388ca2336
  modified: 2026-09-13T06:21:51.904Z
---

CNOTE storybook `tailwind.config.cjs` 의 `content` 는 `./src/**` · `./.storybook/**` 뿐이다(260913 실측). `playground/`(작업대 W1~W10)는 스캔되지 않는다.

그래서 작업대 파일에서만 쓴 클래스는 **에러 없이 CSS 가 안 생긴다**. src 에서 이미 쓰는 클래스(`h-96`·`shadow-3` 등)는 우연히 살아서 「어떤 건 되고 어떤 건 안 된다」로 보이고 원인을 못 찾는다. W4 첫 판에서 `bg-brand-deep-1`(바이올렛 면이 흰색으로) · `bottom-md`(토스트가 위로) · `pt-24` 가 빠졌다. 토큰이 config 에 **색 키로 실재해도** 마찬가지다 — 문제는 키가 아니라 스캔 범위다.

게이트 `check-*` 스크립트도 playground 를 보지 않는다 → 게이트 PASS 가 작업대 파일을 보증하지 않는다.

**How to apply:** 작업대에서 시안을 그릴 때 ①className 토큰이 src·.storybook 에 실재하는지 먼저 검산한다(W4 때 scratchpad `audit-w4-classes.mjs` 방식) ②수치 검증만 믿지 말고 행별로 잘라 눈으로 본다 — 이 결함은 크기 실측·콘솔 오류 0 을 전부 통과했다. 근본 처방(content 에 playground 추가)은 공유 파일이라 관제 판단(저널 4925 FU 등록 요청). 관련 [[feedback-visual-verification]] · [[feedback-partial-response-is-not-absence]].
