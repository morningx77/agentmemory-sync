---
name: reference-folder-governance
description: ISPARK 통합 형상관리 가이드 - 폴더 구조와 파일 위치 규칙
metadata: 
  node_type: memory
  type: reference
  originSessionId: 7a6a83e5-afa4-449b-b7a5-c990c5fa1690
---

공식 가이드 위치: `C:\Users\yscho\260610_ISPARK\05_notes\04_claude\rules\ispark_folder_governance_guide.md`

## 최상위 구조
```
260610_ISPARK/
  .claude/         ← Claude Code 제어 (CLAUDE.md, commands, rules, skills, memory)
  01_private/
  02_office/
  03_projects/     ← 모든 업무 프로젝트
  04_design/       ← 공용 디자인 자산
  05_notes/        ← Obsidian 지식 관리
  06_downloads/    ← 임시 파일
  07_archive/      ← 종료/이전 자료
```

## 프로젝트 폴더 표준 (03_projects 하위)
```
날짜+프로젝트명/
  01_docs/     ← 기획, 요구사항, README, API 문서
  02_design/   ← 화면설계, Figma export, 시안
  03_dev/      ← Git repo들을 담는 상위 폴더 (repo가 아님)
  04_ops/      ← 배포, 운영, 장애대응 문서
  05_assets/   ← 이미지, 캡처, 첨부파일
```

## Claude 관련 파일 위치
- 공통 스킬/프롬프트/룰: `05_notes/04_claude/skills|prompts|rules/`
- 프로젝트 전용 스킬: `03_projects/프로젝트명/04_ops/skills/`
- workspace 공통 Claude 설정: `.claude/`

## 네이밍 규칙
- 최상위 폴더: 숫자 prefix (`01_`, `02_`)
- 프로젝트 폴더: 날짜+이름 (`260609_FIGMA_MCP`)
- Git repo: 기존 규칙 유지 (`260301_fore`)
- 띄어쓰기 대신 `_` 또는 `-` 사용

**How to apply:** 새 파일이나 폴더를 만들 때 이 구조에 맞는 위치에 저장. 특히 문서는 `01_docs/`, 개발 결과물은 `03_dev/` 하위 repo 안에.
