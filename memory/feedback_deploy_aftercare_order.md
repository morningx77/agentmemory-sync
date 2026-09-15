---
name: feedback_deploy_aftercare_order
description: CNOTE 배포 뒤 관제 뒷정리 3단계 — make-handoff 를 빼면 CNOTE/변경 이력이 조용히 멈춘다
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 8ebd723d-2fd4-44d5-9457-c5e6c69ea49b
  modified: 2026-09-15T01:39:49.480Z
---

CNOTE 배포(screen-ops)가 끝나면 관제가 순서대로 한다: ①`check-sheet-target --update-baseline` ②`make-handoff.mjs --since <지난 개발전달 HEAD> --until <배포 커밋>` ③`make-bench --stage 배포` → `--done`.

**Why:** 260914 배포 두 번 뒤 ②를 건너뛰어 스토리북 `CNOTE/변경 이력`(cnote-history)이 9월 10일에 멈췄고, 사장님이 *"여기에는 왜 업데이트가 없지?"* 라고 물으셨다. 프로세스 정본 ⑨에 적혀 있었지만 --done 만 기억했다. 또 make-handoff 는 since..HEAD 만 받아 배포 뒤 쌓인 미배포 커밋이 섞일 뻔했다 → 260915 `--until` 인자를 더했다.

**How to apply:** 배포 알림을 받으면 ②를 ③보다 먼저 친다. 지난 전달 HEAD = 최신 `01_docs/계획_핸드오프/_개발전달_{YYMMDD}.md` 3행 「HEAD」. 결과로 바뀌는 `storybook/src/handoff/_ledger.json` 을 파일 이름으로 커밋한다. [[feedback_master_no_stall_after_answer]]
