---
name: reference_claude_profile_split_company_personal
description: Claude Code 회사/개인 계정 동시 사용 — CLAUDE_CONFIG_DIR 프로필 분리(260806 검증 성공)
metadata: 
  node_type: memory
  type: reference
  originSessionId: 5ae1536b-02db-4405-94ea-c07226b39b56
  modified: 2026-08-06T05:01:00.173Z
---

**문제**: Claude Code 로그인은 **Windows 사용자당 1개**(`C:\Users\yscho\.claude\.credentials.json`)라 VS Code·터미널·**Antigravity가 전부 공유**한다. VS Code에서 회사 계정으로 바꾸니 Antigravity까지 회사 계정으로 바뀜(설계상 SSO, 버그 아님).

**해결(검증 성공 260806)**: **`CLAUDE_CONFIG_DIR` 환경변수로 프로필 분리** — 공식 지원이며 **`.credentials.json`이 그 폴더 아래로 들어간다**(IDE 락파일도 `$CLAUDE_CONFIG_DIR/ide/`). 공식 다중프로필 전환 기능은 **없음** — 이 방법이 유일.

```
~/.claude\           = 개인 (Antigravity·기본 실행 전부)
~/.claude-company\   = 회사 (VS Code 전용)
```
런처 = `ISPARK\_회사_VSCode_실행.cmd` (CLAUDE_CONFIG_DIR 설정 후 `code ISPARK` 실행).

**★함정 3종**
1. **VS Code를 완전히 종료한 뒤** 런처 실행. 실행 중이면 `code`가 기존 프로세스에 붙어 **환경변수가 무시**된다. → VS Code는 **항상 런처로만** 열 것(시작메뉴로 열면 개인 프로필).
2. **`.cmd`/`.bat`는 CP949로 읽힌다** → 한글 주석을 UTF-8로 넣으면 깨져서 명령으로 해석돼 에러 폭주. **ASCII 전용으로 작성**([[reference_ps51_bom]]과 같은 계열).
3. VS Code `terminal.integrated.env.windows`로는 **안 됨**(통합 터미널만 영향, 확장 호스트 무관).

**주의**: 기존 `~/.claude` **통째 복사 금지**(`.claude.json` 세션상태 꼬임). 빈 프로필로 시작하고 필요한 것만 채운다. 새 프로필은 로그인·플러그인(agentmemory 등)·설정이 **빈 상태** — settings/enabledPlugins가 CLAUDE_CONFIG_DIR을 따르는지는 공식 미명시라 실측 필요.

관련: 회사/개인 폴더 분리=[[project_workspace_company_personal_split]](cwd는 보안경계 아님·진짜 경계는 별도 계정/프로필).
