---
name: project-cnote-ag-session-onboarding
description: ag스토리북/ag기획 세션의 작업 규약 — 배분 수신·claim 3스텝(해제 결함 포함)·저널 쓰기·보고 형식·게이트. 정본 = _ONBOARDING_안티그래비티_세션_260903.md
metadata: 
  node_type: memory
  type: project
  originSessionId: a1564576-d2f1-4b63-8e58-a95aa706891e
  modified: 2026-09-03T09:11:57.863Z
---

CNOTE 안티그래비티 세션(`ag스토리북`=device / `ag기획`=정본) 운영 규약. 정본 문서 =
`01_docs/계획_핸드오프/_ONBOARDING_안티그래비티_세션_260903.md` (vs마스터 발행 260903 · 239행).

**Why:** 같은 폴더에서 6세션이 동시에 돈다(`vs마스터` 관제 · `vs기획`/`vs스토리북` · `ag기획`/`ag스토리북` · `vs마스터2` 감사).
같은 층이 둘씩이라 claim·이름·순서가 어긋나면 즉시 충돌한다. 260903 하루에 이름 갈림 1건(`new-few`↔`new-inline`)과
거짓 claim 해제 보고 4건이 실제로 났다.

**How to apply:**

- **배분은 `vs마스터`만 한다.** 저널 `handoff_to` 에 내 별칭이 **없으면 착수하지 않는다.**
  유휴면 "자원한다"고 알리고 지정을 기다린다. 첫 배분을 받으면 **접수 한 줄을 저널에 남긴다**(도달 확인 수단이 그것뿐이다).
- **claim 3스텝**: 전체 읽기 → `claim-append.mjs <파일.json>` → **다시 읽어 더 이른 것에 양보**.
  조회는 `check-claims.mjs` 로만 — 손으로 JSON 세면 없는 키를 읽어 거짓 0이 난다.
- ★**claim 해제 결함(도구 미교정 · 실측 확인함)**: `done` 을 append 해도 **점유가 안 꺼진다.**
  리더는 항목별 `status` 로 세는데(`check-claims.mjs` `NOT_HOLDING` 필터) 라이터는 `json.claims.push` 로 **새 항목만 추가**한다.
  → 해제는 **그 항목의 `status` 를 직접 `released` 로** 바꾸고, 리더 재실행으로 0을 확인한 뒤 통지한다.
  `note`·`claimedAt`·이력은 한 글자도 지우지 않는다. **닫는 것과 여는 것이 한 쌍이다.**
- **저널 쓰기는 반드시 `journal-append.mjs <파일.json>`.** 본문을 셸에 실으면 백틱 안이 실행돼 사라진다(heredoc·`node -e` 금지).
  `ts` 를 직접 넣으면 거부된다. `_expect` 는 **verify 본문에서 그대로 잘라 붙인다** — 어미를 바꿔 쓰면 반려된다(260903 반려 10회 이상이 전부 이 이유).
- **보고 형식 = 요구 / 전 / 후 / 확인.** 마커·커밋은 괄호로만. 이유 = *"일은 했는데 보이지 않았다"*.
  실측 규율: 라이브는 직접 받아 대조 · 수치에 층을 붙인다 · **못 쟀으면 못 쟀다고 한다** · **자기신고를 verify 에 적는다**.
- **게이트 = 완료의 정의.** ★**device 게이트는 12종이다**(온보딩 §5 의 "10/10" 은 낡았다 — 실측 260903).
  **정본은 항상 `storybook/package.json` 의 `scripts.gate`**. 정본 층은 `run_gates.mjs` 14종.
- **배포**: `--structured` 절대 금지. 무한로딩 = `rm -rf storybook-static` 후 클린 재빌드.
  ★**빌드는 워킹트리 전체를 읽는다** — 남의 미완성이 실리므로 배포 전 `check-deploy-scope.mjs --me=<별칭>`.
- **함정(260903 실제로 밟은 것)**: 행번호 편집 금지(CRLF 혼재로 어긋난다 → 문자열 앵커) · 변종 신설 시 **거르는 코드도** 고친다(안 그러면 라이브 0건인데 게이트는 PASS) ·
  UI 제거와 배선 절단은 다른 층 · "없다"로 지울 땐 **모든 축**을 센다 · **일괄 치환 금지**(같은 낱말이 두 뜻) · 눈검증 교정 뒤 게이트 재실행.
- **신설을 줄인다**: 선례를 먼저 센다(260903 "만들 것이 없었다"가 13회) · 값은 형제에서 복사 · **이름은 정본이 정한다**.

관련: [[project-cnote-design-foundation]] · [[feedback-visual-verification]] · [[feedback-no-unverified-as-fact]]
