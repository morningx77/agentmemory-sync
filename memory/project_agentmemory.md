---
name: project-agentmemory
description: agentmemory 설치 현황 — Claude Code 작업 자동 기록(로컬 SQLite/iii 엔진) 인프라
metadata: 
  node_type: memory
  type: project
  originSessionId: 0979483c-0fe2-4450-9354-df9925c6f50a
---

워크스페이스에 **agentmemory**(rohitg00/agentmemory v0.9.27)를 설치해 Claude Code 작업을 로컬 DB에 자동 기록한다. 2026-06-17 설치·검증 완료.

**구성**
- CLI: `@agentmemory/agentmemory` (npm 전역)
- 엔진: `iii.exe` v0.11.2 → `C:\Users\yscho\.local\bin\iii.exe` (사용자 PATH 영구 등록). Windows는 엔진 자동설치 불가라 수동 배치함
- 데몬: REST `:3111` · Viewer `:3113` · 엔진 ws `:49134`
- Claude Code 플러그인 `agentmemory@agentmemory` (user scope, 12 hook + 8 skill + MCP 53도구). marketplace: `rohitg00/agentmemory`
- 자동시작: Windows 작업 스케줄러 **`AgentMemory-Daemon`** (로그인 시) → 런처 `C:\Users\yscho\.agentmemory\start-daemon.ps1` (포트 사용 중이면 중복기동 skip). 콜드스타트 검증됨

**정책 결정**
- LLM 압축 **OFF** (API 키 없음, noop provider, BM25-only). 원본 관찰은 그대로 DB 저장됨 → "작업 DB화" 목표 충족. 검색품질용 압축은 선택. 켜려면 `~/.agentmemory/.env`에 ANTHROPIC/OPENAI 키. **단 agent-sdk fallback(AGENTMEMORY_ALLOW_AGENT_SDK)은 Claude Code 내부 무한 재귀 위험으로 사용 금지**

**주의**
- hook은 세션 시작 시 로드 → 플러그인 설치 후 **Claude Code 재시작해야 캡처 시작**
- 데몬이 떠 있어야만 캡처됨. 상태확인 `agentmemory status` / health `curl localhost:3111/agentmemory/health`
- 기존 [[project-workspace-automation]]의 수동 memory 시스템과 별개(보완): 이건 전체 자동 로그, memory/는 핵심 큐레이션
