---
name: reference_context_selfmonitor_universal
description: 토큰 자가감시 3종(compact-prep 스킬·context-guard 후크·context-pct 스크립트)이 개인/회사 양 프로필 유저레벨에 범용 배치됨. 위치·활성조건·범용화 방식.
metadata: 
  node_type: memory
  type: reference
  originSessionId: 65ee744c-c1c6-4520-901a-b07c503118b7
  modified: 2026-08-10T08:06:15.644Z
---

토큰 자가감시 툴킷(=[[feedback_compact_kickoff_doc]]·[[feedback_token_efficient_execution]]의 실행체)이 **양 프로필 유저레벨에 범용 미러됨**(260810 검증).

**배치(각 프로필 자립 복사, 3종):**
- 개인 `~/.claude/` : hooks/context-guard.mjs · scripts/context-pct.mjs · skills/compact-prep/SKILL.md · settings UserPromptSubmit 후크("컨텍스트 자가감시")
- 회사 `~/.claude-company/` : 동일 3종 + 후크
- 루트워크스페이스 `260610_ISPARK/.claude` : context-guard 후크 **등록 제거**(개인 유저레벨과 이중발화 방지). 토큰효율·저널 후크는 유지.

**범용화 핵심:** context-guard는 stdin transcript_path 기반이라 원래 프로필무관. context-pct.mjs는 `CLAUDE_CONFIG_DIR||~/.claude` 자동감지 + projects/ 하위 전체에서 최신 .jsonl 선택 → 하드코딩 프로젝트경로 없음. 개인/회사 어디서든 자기 프로필 세션 측정.

**활성 조건:** 후크는 세션 시작 시 로드 → **재시작 후 적용**(회사 VS Code 세션은 재기동해야 뜸). 개인정보·IMGINE/블로그 참조 0(회사 프로필 안전).

**미검증(정직):** Claude Code 후크 병합 규칙을 공식문서로 인용확인하진 않음. 유저레벨=프로필 전세션 적용이라는 확정동작에 맞춰 설계. 확인법=새 세션에서 "컨텍스트 자가감시" statusMessage가 1회만 뜨는지. 2회면 워크스페이스 잔재, 0이면 등록 누락 — 한 줄 수정.
