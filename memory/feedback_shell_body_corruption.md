---
name: shell-body-corruption
description: 본문이 셸을 한 번이라도 거치면 백틱이 실행돼 조용히 사라진다 — 도구에 파일 경로만 넘겨도 그 파일을 만드는 명령이 셸이면 같은 사고
metadata: 
  node_type: memory
  type: feedback
  originSessionId: fa05fec1-eacc-442b-b229-677ff1b66748
  modified: 2026-09-03T17:44:24.187Z
---

**본문에 백틱이 있으면 `python -c "..."`·인용 없는 heredoc으로 파일을 만들지 마라. Write 도구로 만든다.**

260904 실제 사고: CNOTE 협업 저널을 `journal-append.mjs <파일>`로 발행했다. "본문을 셸에 싣지 마라 — 파일 경로만 넘긴다"는 규율은 **지켰다**. 그런데 **그 JSON을 만드는 `python -c "..."` 가 셸을 거쳤고**, bash가 큰따옴표 안 백틱을 명령 치환으로 실행해 `` `flow.html` `` `` `prototype.html` `` `` `cursor:pointer` `` 세 개가 **빈 문자열**이 된 채 발행됐다(로그에 `command not found` 3줄이 남았다). 문장의 주어가 사라져 뜻을 잃었다.

**Why:** 규율 문구가 **도구 이름**(journal-append)을 가리키고 있어서 그 **앞 단계**를 보지 않았다. 진짜 판정 기준은 "어느 도구에 넘기는가"가 아니라 **"본문이 셸을 한 번이라도 거쳤는가"**다. 그리고 이 훼손은 **무음**이다 — 도구가 정상 종료(exit 0)하고 사후 검증까지 통과한다.

**How to apply:**
- 백틱·`$(`·`$VAR`가 든 본문은 **Write 도구로 파일 생성** → 그 경로만 명령에 넘긴다.
- 굳이 셸을 쓰면 **따옴표 있는 heredoc**(`<<'EOF'`)만. `<<EOF`는 치환된다.
- `journal-append`의 `_expect` 가드는 **내가 지목한 토큰만** 본다 — 백틱 있는 토큰을 하나도 안 넣으면 이 사고를 못 잡는다. 백틱이 든 본문이면 `_expect`에 **백틱 포함 토큰을 넣어** 가드를 작동시킨다(단 본문 실제 표기와 정확히 일치해야 반려되지 않는다).
- 발행 직후 **실행 로그에 `command not found`가 있는지 본다** — 그게 훼손의 유일한 눈에 띄는 흔적이다.

같은 뿌리: [[feedback_no_unverified_as_fact]](성공 보고를 검증 없이 믿지 않는다)
