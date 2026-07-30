---
name: reference_journal_notify_hook
description: 협업 저널 신규항목 자동감지 UserPromptSubmit 훅(A훅) — 기획↔스토리북2
metadata: 
  node_type: memory
  type: reference
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-07-20T11:09:37.145Z
---

★협업 저널(`_storybook_journal.jsonl`) 신규 항목을 **다음 입력 시 자동 주입**하는 반자동 훅(260720 구축).

**구성**: 스크립트 `.claude/hooks/journal-notify.mjs` + `.claude/settings.json` UserPromptSubmit 훅(command: node 실행). 출력 형식 = `{"hookSpecificOutput":{"hookEventName":"UserPromptSubmit","additionalContext":"..."}}`.

**동작**: UserPromptSubmit stdin(session_id·cwd)으로 실행 → **세션별 커서**(.claude/hooks/.journal_cursors/{session_id}.txt = 마지막 처리 라인수)로 안 본 신규 라인만 감지·요약 주입. 중복·과거폭탄 없음. 첫 실행은 커서만 세팅(주입X).

**역할 판정(cwd·260720 개선)**: `storybook` 포함→스토리북(기획 글 planning_* 관심) / 다른 프로젝트 폴더(`03_projects/<CNOTE 아닌 것>`, THEMONY 등)→**no-op 배제** / 그 외(**워크스페이스 루트** 또는 `260610_C-Level_note` 트리)→기획(스토리북 글 screen_*/component_*/handoff 관심). ★루트 cwd 기획 세션도 동작(초기 제약 해소). 저널 없으면 no-op.

**★한계**: (1)반자동 — 세션에 **입력이 와야** 훅이 돔(유휴 세션 자동깨우기 아님·클로드는 턴 기반). (2)완전 무인 원하면 별도 데몬(watch-docs식 워처+`claude -p` 헤드리스)=B안 필요.

**대안 B(미구축)**: 파일 워처가 저널 변경 감지→`claude -p "저널 처리·결선"` 헤드리스 자동 실행(대화창과 별개·데몬). 완전 자동. [[project_session_alias_registry]]와 연계 가능.
