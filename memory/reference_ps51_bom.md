---
name: reference-ps51-bom
description: Windows PowerShell 5.1에서 BOM 없는 UTF-8 .ps1 파일은 파서 에러로 실행 실패 — 셋업 시 함정
metadata: 
  node_type: memory
  type: reference
  originSessionId: 624d9875-b1d7-419e-9f0d-d4dda1b001cf
---

Windows PowerShell 5.1(`powershell.exe`)은 BOM 없는 UTF-8 `.ps1` 파일을 시스템 코드페이지(한국어 Windows는 cp949)로 오독한다. 한글·이모지(`▶✓⚠`)가 깨지면서 따옴표/중괄호 짝이 틀어져 `Missing closing '}'` 같은 파서 에러로 스크립트 실행이 실패한다. PowerShell 7(`pwsh`)은 UTF-8을 기본으로 읽어 발생하지 않는다.

2026-06-19 새 PC 셋업 때 `.claude/setup.ps1`·`.claude/watch-docs.ps1`이 이 문제로 첫 실행 실패 → 두 파일에 UTF-8 BOM을 추가해 해결. SETUP.md Step 3에도 증상·복구 스니펫을 명시해 둠.

**How to apply:** 새 PC에서 `.ps1` 실행이 파서 에러로 죽으면 인코딩부터 의심한다. `[System.IO.File]::ReadAllBytes`로 첫 3바이트가 `EF BB BF`인지 확인하고, 없으면 BOM을 앞에 붙여 재저장(내용 불변)한다. 한글 주석/이모지가 든 모든 워크스페이스 `.ps1`이 대상. 관련: [[project-workspace-automation]]
