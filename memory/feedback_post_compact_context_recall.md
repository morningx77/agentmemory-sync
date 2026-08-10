---
name: feedback_post_compact_context_recall
description: 컴팩트 재개 시 킥오프에 없는 맥락은 추측하지 말고 원본 트랜스크립트/문서를 실검색해 확인 후 진행. compact-prep §5 재개 프로토콜.
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 65ee744c-c1c6-4520-901a-b07c503118b7
  modified: 2026-08-10T08:17:59.953Z
---

컴팩트로 압축된 세션을 킥오프로 재개할 때, **킥오프/요약에 없는 맥락을 만나면 추측으로 메우지 말고 원본을 실검색**한다.

**Why:** 킥오프 요약은 압축본이라 세부(파일·결정·수치·이름·문구·경로)가 빠질 수 있다. 그걸 추측으로 진행하면 [[feedback_no_unverified_as_fact]] 위반이자 맥락 유실. 그런데 **원본 전체 트랜스크립트(.jsonl)는 디스크에 통째로 보존**돼 있어(컴팩션 요약 말미에 경로 명시) 찾을 소스가 실재한다 — 안 찾을 이유가 없다.

**How to apply:** 재개 세션이 킥오프 밖 맥락을 건드리면 착수(편집·단정) 전에 순서대로 회수 — ① 원본 .jsonl **Grep/Read**(키워드·화면명·함수명) → ② `01_docs/_INDEX.md`·정본 문서 → ③ 메모리(MEMORY.md) → ④ 그래도 없으면 사용자에게 질문. **검색 전 편집·단정 금지.**

명문화 위치(범용): compact-prep 스킬 **§5 재개 프로토콜** + **§4a 킥오프 §0 템플릿**(원본 트랜스크립트 경로+이 규칙을 매 킥오프에 삽입) — 개인 `~/.claude`·회사 `~/.claude-company` 두 프로필 반영(워크스페이스 복사본은 미반영·레거시 중복).

[[feedback_post_compact_verification]]의 짝: 그건 "직전 편집 재검증", 이건 "유실 맥락 회수". 둘 다 [[reference_context_selfmonitor_universal]] 자가감시 시스템의 일부.
