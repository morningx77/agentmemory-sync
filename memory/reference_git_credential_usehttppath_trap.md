---
name: reference-git-credential-usehttppath-trap
description: credential.useHttpPath를 전역에 켜면 회사 repo push가 통째로 막힌다 — includeIf 하위에만 둘 것
metadata: 
  node_type: memory
  type: reference
  originSessionId: cde9ec63-a46d-4b06-a884-43e7289c8a1c
  modified: 2026-08-10T11:40:24.497Z
---

**`credential.useHttpPath = true`를 전역 `~/.gitconfig`에 두면 안 된다.** 회사/개인 GitHub 계정 분리 시 반드시 `includeIf`로 포함되는 개인 전용 파일(`~/.gitconfig-personal`)에만 둔다.

**왜**: Windows 자격증명 관리자는 기본적으로 `git:https://github.com` **host 레벨 항목 1개**만 갖는다. `useHttpPath`를 전역에 켜면 **모든** repo가 `git:https://github.com/<org>/<repo>.git` 경로별 키를 찾는데, 회사 쪽은 그 키가 없어 **매칭 실패 → push 불가**가 된다. ★260810 실사고: 개인 repo 분리 작업이 회사 CNOTE(스토리북) 세션의 push를 통째로 막았다.

**함정**: 재인증 창이 뜨지 않고 **그냥 실패**한다. "1회 재인증하면 된다"는 추정은 틀렸다.

**올바른 구성** (260810 검증 완료 — 양쪽 `git ls-remote` 성공):
```
~/.gitconfig            [credential] helper=manager   (useHttpPath 없음)
                        [includeIf "gitdir/i:.../IMGINE/"] path = ~/.gitconfig-personal
                        [includeIf "gitdir/i:.../ISPARK/"] path = ~/.gitconfig-company
~/.gitconfig-personal   [user] morningx77 + [credential] useHttpPath = true
~/.gitconfig-company    [user] ispark-ai-rnd (useHttpPath 없음 → host 레벨 자격증명 그대로)
```
결과: 개인=경로별 키, 회사=기존 host 키. 개인 push가 회사 계정으로 나가지 않으면서 회사는 재인증 불필요.

**검증법**: `git config credential.useHttpPath`를 양쪽 repo에서 확인(회사=빈 값), 그리고 `git ls-remote --heads origin`(읽기 전용)으로 실제 인증 성공을 실측한다. `git credential fill`은 PowerShell 파이프에서 protocol 필드 오류가 나므로 신뢰하지 말 것.

**Why:** 전역 git 설정 변경은 다른 동시 세션의 작업을 조용히 망가뜨린다 — 내 repo만 보고 판단하면 안 된다.
**How to apply:** 워크스페이스 전역 설정(git·환경변수·후크)을 바꿀 땐 ① 영향 범위를 먼저 열거하고 ② 다른 계정/트리에서 실제 동작을 실측한 뒤 ③ 가능하면 경로 스코프(`includeIf`)로 격리한다. 관련=[[reference-claude-profile-split-company-personal]], [[project-fp-finance-automation]], [[feedback-no-unverified-as-fact]]
