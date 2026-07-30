---
name: project-session-alias-registry
description: 클로드 멀티세션 별칭 — SessionStart 후크가 새 세션에 별칭을 물어 agentmemory에 저장
metadata: 
  node_type: memory
  type: project
  originSessionId: 53cd789d-4d81-4861-b517-877661fc44e9
---

ISPARK 워크스페이스는 여러 클로드 세션을 동시에 운영하며, 각 세션에 역할 별칭을 부여한다.

**구성 (2026-06-19, 별도 레지스트리 파일 없는 단순 방식)**
- SessionStart 후크: `.claude/settings.json` 의 `hooks.SessionStart` 에 인라인 `echo` 명령으로 등록. 새 세션이 시작되면 정적 안내(additionalContext)를 주입해, **사용자에게 "이 클로드의 역할/별칭은?(피그마/기획/오피스/기타)"을 묻고, 답을 받으면 `memory_save`로 agentmemory에 저장**하도록 지시한다.
- 저장소는 agentmemory 공용 풀 하나뿐. 별칭 관찰은 sessionId 태그와 함께 저장되므로, 어느 세션이든 `recall`로 sessionId↔별칭을 조회해 정확히 타겟팅할 수 있다. ([[project-agentmemory]])

**현재 별칭 (agentmemory에 저장됨, mem_mqkocwha)**
- `53cd789d` → 피그마 (Figma 디자인 작업)
- `7b4902cd` → 기획 (기획 문서)
- `c8b48ea8` → 오피스 (오피스 행정)
- 휴양림 → 숲나들e 자동 예약시스템 운영 (03_projects/251030_forest_reserv/)

**사람용 정의서 (단일 문서)**: `05_notes/04_claude/rules/claude_session_personas.md` — 페르소나 이름·역할 표 + 등록/확인 절차. 새 페르소나 생기면 이 문서 표에도 한 줄 추가.

**Why:** 동시에 뜬 여러 클로드를 사람이 구분하고 정확히 지목해 소통하기 위함. 별도 레지스트리 파일은 세션마다 누적돼 무거워지므로 쓰지 않고, 이미 sessionId 태그를 가진 agentmemory를 단일 출처로 삼는다.
**How to apply:** 새 세션에서 후크 안내가 뜨면 사용자에게 별칭을 묻고 `memory_save`로 저장. 다른 세션을 찾을 땐 `memory_recall "세션 별칭"`. jq 미설치 환경이라 후크는 node/echo 기반.
