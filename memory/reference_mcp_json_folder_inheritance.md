---
name: reference_mcp_json_folder_inheritance
description: ★프로필 분리(CLAUDE_CONFIG_DIR)는 .mcp.json을 안 가른다 — .mcp.json은 폴더 계층으로 상속돼 부모의 MCP가 자식 트리 세션에 그대로 실린다
metadata: 
  node_type: memory
  type: reference
  originSessionId: 5ae1536b-02db-4405-94ea-c07226b39b56
  modified: 2026-08-27T14:09:24.270Z
---

★260827 실사고. **프로필을 갈라도 `.mcp.json`은 안 갈린다.**

## 무엇이 일어났나

`CLAUDE_CONFIG_DIR`로 프로필을 분리해 두었고(`~/.claude` ↔ `~/.claude-company`),
회사 프로필의 **user 스코프 MCP는 실제로 비어 있었다.** 그런데도 회사 세션에
개인용 MCP 서버 2종이 로드됐다.

원인 = **`.mcp.json`은 프로필이 아니라 폴더 계층을 따른다.**

```
260610_ISPARK/.mcp.json      ← 개인용 서버가 여기 있었다
  └ ISPARK/.mcp.json         ← 회사 작업 루트(cwd). 부모가 상속된다
```

## 증거 (추측 아님)

회사 세션 트랜스크립트에 `mcp_instructions_delta` 어태치먼트가 실재했다 —
`cwd`가 회사 루트인데 `addedNames`에 개인 서버명이 있고, 그 **안내문이 컨텍스트로 주입**됐다.
즉 회사 클로드가 개인 도구의 존재와 용도를 아는 상태였다.

## 두 가지를 갈라 볼 것

- **경로 문자열은 컨텍스트에 안 들어간다** — `.mcp.json`은 프로그램이 서버를 띄울 때만 읽는다.
  "경로가 노출됐다"는 과장이다. 실제로 새는 것은 **서버명 + 안내문 + 도구명**이다.
- 반대로 **`.claude/settings.json`의 `permissions.allow`는 위험하다** — 승인했던 명령이 원문 그대로 쌓여
  **평문 자격증명이 파일에 남는다.** 실제로 앱 비밀번호가 평문으로 있었고, 그 파일을 읽은
  세션 트랜스크립트에도 복사됐다.

## 처방

1. 개인용 MCP는 **개인 트리 안쪽 `.mcp.json`** 에 둔다(부모·공용 루트에 두지 않는다).
2. 분리 검증은 "프로필이 갈렸나"가 아니라 **"회사 cwd에서 실제로 뭐가 로드되나"** 로 한다 —
   `mcp_instructions_delta` / `deferred_tools_delta` 어태치먼트가 실측 지점이다.
3. `permissions.allow`에 **자격증명이 든 명령을 승인하지 않는다.** 이미 있으면 지우고 **키를 재발급**한다
   (파일에서 지워도 이미 노출된 값은 되돌릴 수 없다).
4. 트랜스크립트 정리는 **행 단위 편집 → JSON 재파싱 → 실패 시 그 행만 원복**. 깨진 채 저장하지 않는다.

관련: [[project_workspace_company_personal_split]] · [[reference_claude_profile_split_company_personal]] · [[feedback_no_unverified_as_fact]]
