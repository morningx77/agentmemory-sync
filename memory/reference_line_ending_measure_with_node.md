---
name: reference-line-ending-measure-with-node
description: "이 환경 Git Bash 의 grep -c $'\\r$' 줄끝 카운트는 틀린 값을 낸다 — CRLF/LF 판정은 node 로 잰다. mid-fi 파일마다 줄끝이 다르고 한 파일 안에서 섞이기도 한다"
metadata: 
  node_type: memory
  type: reference
  originSessionId: fa05fec1-eacc-442b-b229-677ff1b66748
  modified: 2026-09-14T10:01:43.914Z
---

260914 ag기획 B11 실측: `grep -c $'\r$' 2midfi_04_people.html` 이 3261 을 냈지만 node 로 재니 CRLF 0 · LF 3082 였다. 그 수를 믿고 스크립트를 CRLF 로 짰다가 쓰기 전 가드(`includes('\r\n')`)에 걸려 멈췄다(훼손 0).

- 판정식 = `node -e` 로 `(s.match(/\r\n/g)||[]).length` 와 `(s.match(/(^|[^\r])\n/g)||[]).length` 를 함께 찍는다.
- 260914 기준 CNOTE mid-fi: 02 · UI_CONVENTIONS = CRLF / 04 · 08 = LF(04 는 외톨이 CR 11) / 01_onboarding = CRLF + LF 26 줄 섞임 → 줄 단위 split/join 대신 원문 문자열 치환으로 줄끝을 보존한다.
- 편집 스크립트는 첫 줄에 줄끝 가드를 두고, 끝에 「LF 전용 줄 수 전 → 후」 를 출력한다.

관련: [[feedback_shell_body_corruption]] · [[feedback_post_compact_verification]]
