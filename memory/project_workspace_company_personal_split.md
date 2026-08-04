---
name: project_workspace_company_personal_split
description: 워크스페이스 회사/개인 분리 마이그레이션 — 계획확정·실행대기
metadata: 
  node_type: memory
  type: project
  originSessionId: 65ee744c-c1c6-4520-901a-b07c503118b7
  modified: 2026-08-03T23:59:38.614Z
---

회사 Claude 계정 도입 대비, 워크스페이스를 회사/개인으로 물리 분리하는 마이그레이션. **계획 확정·실행 대기(260804)**. 정본 = `260610_ISPARK/_MIGRATION_PLAN_회사개인분리_260803.md`.

## 채택 구조 (하위폴더 안)
```
260610_ISPARK\           ← 개인이 루트 염(전체 봄)
  CLAUDE.md              ← ★범용 공통만(프로젝트목록·개인규칙 하위 이관 필요)
  .claude\              ← 개인/전체
  ISPARK\               ← 회사 계정이 여기 염(회사만 봄) — 자체 CLAUDE.md·.claude 필요
  IMGINE\               ← 개인
```

## ★검증된 Claude Code 상속 동작 (claude-code-guide 확인)
- **CLAUDE.md**: 🔴 cwd에서 상위로 거슬러 로드 → 회사 하위폴더가 부모 루트 CLAUDE.md를 봄 → **누수 차단 = 루트 CLAUDE.md 범용화가 필수**.
- **settings·MCP·hooks**: ✅ 부모 미상속(격리). 회사 하위에 자체 `.claude/` 필요.
- **메모리**: ✅ 경로 슬러그 기반(루트=git repo 아님 확인) → 하위폴더는 별도 네임스페이스.
- ⚠️ cwd는 하드 보안경계 아님 → 완벽격리는 별도 Windows 계정.
- ⚠️ `claudeMdExcludes` 설정은 미검증 → 의존 안 함.

## 분류 확정 (260803~04)
- 회사(ISPARK\): FIGMA_MCP·ISPARK_MCP·CNOTE(C-Level_note) + 02_office·04_design·07_archive
- 개인(IMGINE\): forest_reserv·MATO·Chrome_Ex·THEMONY·TSMIN·DEEPNAUT·antigravity_skills
- 공용(루트): 000000_INFO·06_downloads·08_temp·.claude
- **05_notes = A(루트 공용 유지)** 확정(vault 분할 시 wikilink 끊김).

## 실행 (대기)
- Phase1(핵심): 회사항목 ISPARK\ 이동 + 루트 CLAUDE.md 범용화 + ISPARK\.claude(figma MCP) + CNOTE-watch-docs 재등록 → 회사계정 도입 가능.
- Phase2: 개인 IMGINE\ 이동 + settings패치 + THEMONY-slot/agentmemory-sync 재등록 + venv/node 재생성.
- 감사결과: 물리파손 적음(venv 1개 미사용·git repo 이동OK·같은C:드라이브 즉시이동). 패치=루트 settings(THEMONY참조)·register_tasks_admin.ps1·스케줄러.
- ⚠️ **다른 세션 작업 중 → 완료 신호 후 실행.** 실행 전 매니페스트+.claude 백업.
[[feedback_no_unverified_as_fact]]
