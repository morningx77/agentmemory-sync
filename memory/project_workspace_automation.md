---
name: project-workspace-automation
description: ISPARK 워크스페이스 자동화 — 회의록/주간보고/환경체크 커맨드 현황
metadata: 
  node_type: memory
  type: project
  originSessionId: 5cadd301-d55d-4dc5-99ab-d36075b53590
---

워크스페이스 레벨 자동화 파이프라인 및 Claude 커맨드 현황.

**슬래시 커맨드** (`.claude/commands/`)
- `/meeting` — 회의록 작성. 타입별 저장 경로 자동 분기
  - 프로젝트회의: `03_projects/{프로젝트}/01_docs/meetings/`
  - 주간회의: `02_office/meetings/weekly/`
  - 팀회의: `02_office/meetings/team/`
  - 세미나: `05_notes/03_learning/seminars/`
  - `_ori.md` 원본 파일 있으면 자동으로 읽어서 더 상세한 구조화
- `/weekly` — 주간업무 보고서 작성. 저장: `02_office/meetings/weekly/YYYYMMDD_주간업무보고.md`
  - 입력: 간단 메모 / 원본 파일 / _ori.md 자동 탐색 / 내용 없이 요청
- `/new-project` — 표준 폴더 구조 + CLAUDE.md 템플릿 자동 생성

**주간 보고서 포맷** (`05_notes/04_claude/templates/weekly_report_template.md`)
- U+3000 전각 스페이스로 들여쓰기 (U+00A0 아님)
- 계층: `◾ 그룹` → `　• 항목` → `　　◦ 속성` → `　　　- 세부`
- 섹션: [금주 실적] / [신규 발생 업무] / [차주 계획] / [이슈 / 리스크]
- 본부장 요구사항: 선후관계 명확히, 근거 자료 연결 필수

**환경 자동 체크** (CLAUDE.md에 지시 포함)
- 새 대화 시작 시 pandoc + CNOTE-watch-docs Task Scheduler 확인
- 하나라도 없으면 `.claude/setup.ps1` 자동 실행
- docx→md 파이프라인: watch-docs.ps1 + Task Scheduler 폴링

**Why:** 매주 주간회의, 프로젝트 회의가 있고 본부장 보고 포맷 요구사항 존재
**How to apply:** 회의록/주간보고 요청 시 타입 확인 후 경로 자동 분기, U+3000 포맷 적용
