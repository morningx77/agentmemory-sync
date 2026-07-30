# agentmemory-sync

회사 PC의 agentmemory 작업 기록을 **집 PC에서 검토**하기 위한 동기화 저장소 (비공개).

- **방식**: 회사 PC가 주기·세션종료 시 `agentmemory export`(JSON) + Claude 네이티브 memory(md)를 push → 집 PC가 `git pull` 후 조회.
- **설계 문서**: `05_notes/04_claude/_WORK_PLAN_agentmemory_sync_260729.md`
- ⚠️ 업무 내용 포함 → **반드시 비공개(private)** 유지.

## 구조
```
exports/   agentmemory export JSON (am_export_<날짜시각>.json, 누적)
memory/    Claude 네이티브 장기기억 미러 (MEMORY.md + *.md)
sync-push.ps1   export+미러+commit+push 스크립트 (회사 PC)
```

## 회사 PC (송신)
- 자동: Claude Code `Stop` 훅(세션 종료마다) + Task Scheduler(30분 간격)이 `sync-push.ps1` 실행.
- 수동: `powershell -ExecutionPolicy Bypass -File sync-push.ps1`

## 집 PC (수신·검토) — 1회 셋업
1. 클론: `git clone https://github.com/morningx77/agentmemory-sync.git`
   (인증: 개인 Fine-grained PAT)
2. 세션 시작 시 `git pull`로 최신화 (SessionStart 훅 권장).
3. 조회: Claude가 `exports/*.json`(세션·별칭 태그·시각)·`memory/*.md`를 읽어
   별칭(기획/오피스)·날짜로 필터·요약. (import·restore 불필요)

## 인증 (양쪽 공통)
- remote는 개인 계정 Fine-grained PAT(이 repo·Contents RW)로 인증.
- 토큰은 로컬 `.git/config`에만 존재(커밋 금지). 유출 시 GitHub에서 폐기·재발급.
