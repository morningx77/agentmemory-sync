---
name: storybook-tsc-p-dot-empty
description: "cnote-front/storybook 에서 `npx tsc --noEmit -p .` 는 src 0 파일을 검사한다(tsconfig.json = files [] + references) — 정본 명령은 `npm run type-check`(tsc -b)"
metadata: 
  node_type: memory
  type: reference
  originSessionId: a25efdac-3c6d-4f0b-84ff-ea5388ca2336
  modified: 2026-09-14T01:58:01.518Z
---

`03_dev/cnote-front/storybook/tsconfig.json` 은 `"files": []` + `references`(tsconfig.app.json · tsconfig.node.json) 구조다. 그래서 **`npx tsc --noEmit -p .` 는 아무 파일도 검사하지 않고 exit 0** 을 낸다. 260914 실측: `--listFilesOnly` 로 `-p .` = src 0 파일, `-p tsconfig.app.json` = src 634 파일이었다.

**Why:** 260914 ag스토리북2 가 이 명령으로 "tsc 0" 을 세 번 보고했고, 그사이 넣은 JSX 구문 오류(Person:718)를 못 잡았다. 다른 창의 `npm run type-check` 가 먼저 적색으로 잡았다. 보고서의 「tsc 0」 이 검사 0건이었다.

**How to apply:** 타입 검사는 **`npm run type-check`**(package.json 정본 = `tsc -b --noEmit`)만 쓴다. 검사 명령이 낯설거나 너무 빨리 끝나면 `--listFilesOnly | grep -c src/` 로 **검사한 파일 수부터 찍는다**([[feedback_partial_response_is_not_absence]] 「부재 증명 = 존재 목록을 먼저」). [[jsx-comment-brace]]와 한 묶음.
