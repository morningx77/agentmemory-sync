---
name: reference-ag-session-onboarding
description: ag기획/ag스토리북(안티그래비티 계열) 세션의 절차 정본 문서와, 문서 없이는 모르는 함정 3개
metadata:
  type: reference
---

CNOTE 6세션 체제(260903~)에서 `ag기획`·`ag스토리북`으로 일할 때의 **절차 정본**:
`ISPARK/03_projects/260610_C-Level_note/01_docs/계획_핸드오프/_ONBOARDING_안티그래비티_세션_260903.md`
(발행 vs마스터 · §0 첫행동 → §2 claim → §3 저널 → §4 보고형식 → §5 게이트/배포 → §6 함정)

착수 전 이 문서를 읽는다. 아래 셋은 **문서를 안 보면 반드시 밟는** 것이라 여기 옮겨 둔다.

1. ★**claim 해제가 안 된다** — `done`을 append해도 점유가 안 꺼진다. 리더(`check-claims.mjs`)는 항목별 `status`로 세는데 라이터(`claim-append.mjs`)는 새 항목만 추가한다(갱신 기능 없음). → 해제는 `_storybook_claims.json`에서 **그 항목의 `status`를 직접 `released`로** 바꾸고 리더 재실행으로 확인. 이걸 모르면 "닫았다"는 보고가 거짓이 된다(실제 4건 발생).
2. ★**`_expect` 반려의 원인은 거의 항상 어미 변형** — 기억으로 요약하지 말고 `verify` 본문에서 **그대로 잘라 붙인다**. 또한 `agent`처럼 본문 아닌 필드의 문자열은 검사 대상이 아니다(내가 첫 claim에서 반려당한 이유).
3. ★**보고 형식 = 요구 / 전 / 후 / 확인** (사용자가 정한 형식). 마커·커밋 해시는 괄호로만. 이유 = *"일은 했는데 보이지 않았다"*.

역할 경계: `ag기획`=정본 mid-fi, `ag스토리북`=device. `vs기획`·`vs스토리북`과 **같은 층이 둘**이라 claim이 유일한 안전장치다. 배분은 **vs마스터만** 하고, `handoff_to`에 내 별칭이 없으면 착수하지 않는다.
관련: [[project_cnote_master_role]] · [[reference_journal_notify_hook]] · [[feedback_visual_verification]]
