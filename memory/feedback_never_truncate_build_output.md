---
name: feedback-never-truncate-build-output
description: 배포·빌드·게이트 출력을 tail/head로 자르면 경고가 사라지고 종료코드가 뒤바뀐다 — 버리지 말고 걸러라
metadata: 
  node_type: memory
  type: feedback
  originSessionId: a25efdac-3c6d-4f0b-84ff-ea5388ca2336
  modified: 2026-09-03T17:56:45.872Z
---

**배포·빌드·게이트 명령의 출력은 자르지 않는다.** 길면 파일로 받아 `grep -iE 'warn|error|fail|skip'` 로 훑는다 — **버리지 말고 거른다.** 그리고 exit code 는 **각 단계마다 따로** 찍는다(파이프 뒤의 `$?` 는 마지막 명령 것이다).

**Why:** 260904 실사고 — CNOTE `deploy-sftp.mjs` 는 **빌드를 하지 않는다**(게이트만 돌리고 기존 `storybook-static` 을 업로드). 편집 후 빌드 없이 배포해 **옛 산출물이 올라갔고 라이브에 변경이 없었다.** 그 도구는 「낡은 산출물 — src 가 빌드보다 N분 최신」 경고를 내게 되어 있었는데, 내가 출력을 `| tail -25` 로 잘라 **그 경고를 못 봤다.** 게이트·type-check·deploy 가 **전부 exit 0** 이었으므로 라이브를 안 봤으면 「완료」로 보고했을 것이다. 자르면 ⓐ경고가 사라지고 ⓑ파이프가 종료코드를 먹는다 — **두 개가 한꺼번에 온다.**

**How to apply:**
- 편집 후 배포 전 반드시 `rm -rf storybook-static && npm run build-storybook` (prebuild 가 게이트를 물고 있다). 배포 도구가 빌드해 줄 것으로 **가정하지 말고 산출물에서 바뀐 토큰을 grep 으로 확인**한다.
- 완료 보고에는 **「라이브에서 실제로 눌러 봤다」**를 적는다. 코드가 아니라 동작이다 — 이 요구가 위 사고를 잡았다.
- 자수할 때 **도구 탓으로 적지 마라.** 「도구가 경고를 안 냈다」로 적었으면 도구를 고치려 들었을 것이고 진짜 원인(내가 잘랐다)은 남는다. 이 자수가 팀 규율로 승격된 이유다(저널 3346).

관련: [[feedback_visual_verification]] · [[feedback_no_unverified_as_fact]] · [[reference_cnote_ops]]
