---
name: project_agentmemory_sync_cross_pc
description: 회사↔집 agentmemory 동기화(방식1·GitHub 경유) 구축 완료 260729. 집에서 회사 세션 검토용.
metadata: 
  node_type: memory
  type: project
  originSessionId: 5ae1536b-02db-4405-94ea-c07226b39b56
  modified: 2026-07-30T00:43:24.931Z
---

회사 PC의 agentmemory 작업기록을 **집 PC에서 검토**하기 위한 동기화 구축 완료(260729·오피스 세션).

**방식1 = GitHub 비공개 repo 경유 (import 아님·JSON 직접 읽기)**
- 이유: `memory_import`(MCP) 없음·스냅샷 기본 off → export JSON을 집에서 직접 읽는 게 정답. mesh_sync는 P2P 라이브 전제라 "회사 PC 꺼져도 검토" 시나리오에 부적합(검토 완료).
- repo: `morningx77/agentmemory-sync` (개인 계정·Fine-grained PAT·Contents RW). 로컬=`260610_ISPARK/.agentmemory-sync`(독립 git repo). 워크스페이스 루트는 non-git이라 무충돌.

**구성 (회사 PC·구축 완료)**
- `sync-push.ps1`: `GET localhost:3111/agentmemory/export`(인증 없음) → `exports/am_export_<ts>.json` 누적 + Claude 네이티브 memory(`~/.claude/projects/c--Users-yscho-260610-ISPARK/memory/*`) → `memory/` 미러 → commit·push.
- 트리거 2종: **SessionEnd 훅**(`.claude/settings.json`·세션종료 시 Start-Process 분리실행) + **Task Scheduler `agentmemory-sync` 30분**.
- `install-automation.ps1`+`_install_hook.py`로 설치. settings.json 백업=`.bak_260729`.

**집 PC (미셋업·문서화)**: clone(개인 PAT) → 세션시작 `git pull` → Claude가 `exports/*.json`(세션별 obs·narrative·별칭태그)·`memory/*.md`를 읽어 별칭(기획/오피스)·날짜 필터 요약.

**함정·주의**
- git commit/push·settings.json 편집·스케줄러 등록은 **Claude Code auto 필터가 차단**(외부발행·시스템설정) → 사용자가 로컬에서 직접 실행하는 패턴으로 우회(스크립트 Write는 허용).
- export는 **실행시점 최근 워킹셋**(전체 이력 아님) → dated 누적 + memory md 미러로 보완.
- PAT를 채팅에 노출 → **재발급 권장**(GitHub Regenerate 후 `git remote set-url`로 로컬 교체).
- 설계문서=`05_notes/04_claude/_WORK_PLAN_agentmemory_sync_260729.md`. agentmemory는 로컬·계정무관(데몬 15MB)=[[project_agentmemory]].
