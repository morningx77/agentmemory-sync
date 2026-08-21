---
name: feedback-partial-response-is-not-absence
description: "응답·데이터의 일부만 보고 \"없다/이렇다\"고 단정하지 말 것 — 260814~21 FP세션 7건 반복"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: cde9ec63-a46d-4b06-a884-43e7289c8a1c
  modified: 2026-08-21T14:50:26.780Z
---

**응답의 일부만 보고 "없다"고 말하지 않는다.** 새 엔드포인트는 전 필드를 덤프한 뒤 판단한다.

**Why**: 260814~260821 FP 세션에서 **같은 유형 7건**이 났고 **대부분 사용자가 먼저 발견**했다.
전부 **조용히 틀렸다** — 조회는 성공하고 숫자도 그럴듯해서 아무도 실패라고 말해 주지 않는다.
실패보다 나쁘다.

- KIS 일봉 `output2`만 보고 "시총 없다" → **`output1`에 `hts_avls`·`lstn_stcn`이 같은 콜에 있었다**
- 유무상증자(`pifricDecsn`)는 필드명이 `piic_`/`fric_` 접두사 → 값 18개 중 **0개를 읽어 설명이 통째로 빔**
- 분기 손익 `thstrm_amount`(3개월)를 반기로 라벨 → `thstrm_add_amount`(누적)가 정답
- 영업정지에서 `sl_vs`(매출비중) 안 봄 · 감사의견에서 `emphs_matter`(강조사항) 안 봄
- 제3자배정 배정대상자 안 봄(솔루엠 계열이라는 사실을 놓침)

**How to apply**: FP 프로젝트는 `python api_probe.py {dart|kis} <엔드포인트> [--audit]`로
전 필드를 덤프한다(값 있는 필드를 하나도 숨기지 않는다). 확인분은
`01_docs/설계_명세/데이터소스_정본_260821.md`에 추가하고 **미확인은 §9에 분리**한다.
다른 프로젝트에서도 원칙은 같다 — **"안 보였다"와 "없다"를 구분한다.**

함께 나온 자매 규율 5가지(프로젝트 CLAUDE.md §3-1에 등재):
모르는 값 0으로 채우지 않기 · **달력·표를 코드에 박지 않기**(공휴일·결산월·서머타임은
데이터로 판정) · **"결과가 있으면 맞다" 금지**(yfinance는 틀린 접미사에도 하루 늦은
다른 시세를 준다) · 신호어 반대말 확인 · 테스트에 절대날짜 금지.

[[feedback_no_unverified_as_fact]] · [[feedback_visual_verification]] · [[project_fp_finance_automation]]
