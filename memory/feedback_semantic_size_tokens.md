---
name: feedback_semantic_size_tokens
description: "모든 크기 값을 시맨틱 토큰으로 일관 관리 — 코드(Storybook)=SSOT, Figma는 이후 역반영"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: a1564576-d2f1-4b63-8e58-a95aa706891e
---

CNOTE 디자인 시스템: **모든 크기 값을 시맨틱 토큰으로 일관 설계**한다(오너 지시 260709). 대상 = 패딩·마진·거터·gap, 폰트 크기·**행간(line-height)**, 라운드, **컴포넌트 치수(버튼 높이·아바타·FAB·터치타깃)**, 보더 두께, 아이콘 크기.

**Why**: 크기까지 시맨틱하게 설계해야 디자인 일관성이 강제된다. 임의 px는 일관성을 깬다.

**How to apply**:
- 컴포넌트는 **raw px 금지** — `h-[52px]`·`px-[18px]`·`text-[20px]`·`gap 28` 같은 arbitrary/inline 수치를 시맨틱 토큰(예: `h-control-lg`·`px-gutter`·`text-title-l`)으로 대체.
- **Figma에 누락된 크기 토큰이 많음** → **코드(`tailwind.config.cjs`/`global.css`)가 토큰 정본(SSOT)**이 되어 빠진 것을 설계해 채운다. 오너가 이후 Figma에 역반영(backport)한다.
- 스토리북 v2 RN 전환([[project_cnote_storybook_v2_rn]]) 흐름에서 **R-Tokens 단계**로 시맨틱 사이즈 토큰 체계를 설계→구현→컴포넌트 정규화(arbitrary px 제거). 리뷰 게이트 후 적용. **✅260709 구현완료**: `tailwind.config.cjs`에 borderWidth(DEFAULT=1.5)·control 높이·2차패딩·lineHeight·letterSpacing·radius 사이값·micro/overline 신설, arbitrary px 82건 치환, `check-size-tokens.mjs` 게이트(npm run check-tokens)로 재발방지, `_FIGMA_TOKEN_BACKPORT_260709.md`로 Figma 역반영 목록 산출. 회귀0 눈검증 통과.
- 기존 시맨틱 토큰 유지: fontSize(display~caption)·radius(xs~full)는 이미 시맨틱. 아이콘 크기는 phosphor size prop(숫자)이라 토큰 미적용(후속). 
- **★fontSize=[크기,행간] 튜플(260709 R4)**: fontSize 토큰을 `key:['크기','행간']`로 전환(display~overline 13종, 행간=시안 램프) → `text-title-m` 하나로 크기+행간 동시 일괄변경(타이포 완전 중앙화). 컴포넌트서 `leading-*` 제거(예외 override만). NativeWind 튜플 행간 적용·Home 회귀0 검증. 오너 지시(폰트 나중 일괄수정 가능해야). [[project_cnote_storybook_v2_rn]]
- **★카드 드롭쉐도우 일관(260709, 엘리베이션 2단)**: 기본 카드=`shadow-1`(Level1) / 강조·떠오르는 카드만 `shadow-2`(Level2 Raised, 소수). shadow-3+는 카드 금지(오버레이 Modal/Toast/Tooltip·FAB 전용). 공용카드 Card·WidgetCard·NotificationCard·LiveActivityCard·SectionCard=shadow-1 통일. 오너 지시(쉐도우 제각각→일관). 킥오프 §0.5b.
- ★게이트 원칙: 음수 tracking 등도 잡도록 정규식 주의(AppBar tracking-[-0.12px] 초기누락→게이트가 포착). allowlist=컴포넌트 내부 일회성 지오메트리만(스켈레톤 텍스트줄·Switch 트랙·Modal max-w 캡).

관련: [[reference_folder_governance]] 아님. 디자인 정본 DESIGN_PRINCIPLES.md와 정합.
