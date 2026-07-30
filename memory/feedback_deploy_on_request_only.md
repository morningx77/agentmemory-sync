---
name: deploy-on-request-only
description: CNOTE 스토리북 작업 시 배포는 사용자가 명시 요청할 때만 — 편집마다 자동 배포 금지
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 1763df05-ea22-4314-8d21-41768b3621ee
  modified: 2026-07-28T01:54:30.350Z
---

★260728 사용자 지시: CNOTE 스토리북 폴리시 작업에서 **매 편집마다 리빌드·배포하지 말 것.** 사용자가 "배포해줘"라고 명시할 때만 배포한다.

**Why**: 짧은 피드백 연쇄(카드 여백·라운드·색 등 미세 조정)가 이어질 때 매번 배포하면 낭비·대기. 사용자는 로컬 6007(핫리로드)로 즉시 확인하고, 흐름 검증(flow.html 라이브)이 필요한 시점에 몰아서 배포하길 원함.

**How to apply**:
- 편집 → tsc·게이트 검증 → (필요시) 로컬 6007 iframe 눈검증 → **커밋까지만**. 배포는 보류.
- 배포가 필요한 검증(flow.html은 라이브 스토리북 iframe을 봄 — 로컬 file:// fetch 차단으로 flow는 로컬 불가)은 "배포하면 확인 가능"이라 안내하고 대기.
- 사용자가 "배포해줘/배포" 하면 그때 `deploy-sftp.mjs storybook --force`(+필요시 flow 재생성).
- 관련: [[reference_cnote_deploy_sftp_kex_fix]] [[feedback_cnote_front_git_scope]]
