---
name: reference_figma_skills_install
description: "Figma 스킬 설치 방식 — figma-use·figma-create-new-file 로컬 설치 완료, 나머지는 MCP 리소스로 온디맨드"
metadata: 
  node_type: memory
  type: reference
  originSessionId: fd1f7717-700d-4890-a9c2-57f0f188989c
---

ISPARK 워크스페이스 Figma 스킬 설치 현황 (2026-06-21 정리).

**핵심:** 모든 Figma 스킬 본문은 Figma MCP 서버가 리소스로 제공한다 → `skill://figma/<스킬>/SKILL.md`. "미설치"란 로컬 Claude Code 스킬로 등록만 안 됐다는 뜻이지, 내용은 항상 MCP로 받을 수 있다.

**로컬 설치 완료** (`260610_ISPARK/.claude/skills/<스킬>/SKILL.md`, MCP 리소스 사본):
- `figma-use` — `use_figma` 호출 전 필수
- `figma-create-new-file` — `create_new_file` 호출 전 필수
- 설치 후 **Claude Code 재시작 시** Skill 도구 목록에 노출됨(같은 세션 내에서도 system-reminder로 인식되기도 함).

**미설치(MCP 리소스로만 사용):** figma-generate-design, figma-generate-library, figma-code-connect, figma-generate-diagram, figma-use-figjam, figma-use-slides, figma-swiftui → 필요 시 `ReadMcpResourceTool(server="figma", uri="skill://figma/<스킬>/SKILL.md")`.

**references/* (스킬 하위 참조 문서):** 용량 커서(전체 ~400KB) 로컬 미복사. `ReadMcpResourceTool(server="figma", uri="skill://figma/figma-use/references/<파일>")` 로 온디맨드. 주요: gotchas.md, component-patterns.md, variable-patterns.md, common-patterns.md, working-with-design-systems/wwds.md.

**호출 규칙:** `use_figma` 의 `skillNames` 파라미터에는 MCP 리소스 기반이므로 `resource:figma-use` 로 전달(로깅용, 실행엔 영향 없음).

**리소스 목록 확인:** `ListMcpResourcesTool(server="figma")` 로 전체 스킬·docs·references URI를 볼 수 있음. `skill-index` 리소스(`skill://index.json`)도 존재.

**관련 문서:** `03_projects/260609_FIGMA_MCP/01_docs/02_skills_guide.md` 에 설치 상태 섹션 반영함. [[project_cnote_figma_variables]]
