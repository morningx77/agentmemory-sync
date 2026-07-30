---
name: reference-cds-parallel-harness
description: CNOTE CDS 다중세션 병렬 하네스 — 거버넌스 3기제+모델정책+공지채널. 미팅흐름 진행 중
metadata: 
  node_type: memory
  type: reference
  originSessionId: bccc86de-297c-4b84-91df-91629bde597f
---

CNOTE CDS Figma 하네스에 **다중 세션 병렬 작업** 인프라 구축(260707). 정본=`03_projects/260610_C-Level_note/02_design/CDS_병렬작업_거버넌스_260707.md`.

**3기제**: ①클레임 레지스트리+카테고리 yBand(`_cds_claims.json` — 화면 착수 전 예약 yRange claim·maxBottom 계산 금지→섹션겹침 차단) ②파운데이션 단일작성자 락+큐(`_cds_foundation_queue.jsonl` — 공유 컴포넌트/토큰은 락 보유 오너만 수정·화면세션 consume-only) ③저널식 인덱스(`_cds_journal.jsonl` append-only·`_cds_index.json`은 컴팩션 read-model).
**모델 정책**(cds-build.md): assembler 하이브리드(재사용=sonnet·신규/복잡/시안=opus)·quality/governor=opus·compliance/sian/organizer=sonnet.
**공지 채널**: `_cds_claims.json`의 policyVersion+notices — 규칙변경이 running 병렬세션에 다음 화면서 자동 전파(seenPolicyVersion 비교→reloadDocs 재로드).

라이브 검증 완료: 피그마(소통·미팅흐름)+설정담당(설정) 2세션 겹침0 동시가동. 큐 2세션 중복요청→오너 해소(Button Outline sm 신설).

진행: 소통 완료·미팅흐름 2/8(RECORDING·NOTE_RESULT). MVP=사람·소통·설정·미팅흐름(비서·통제 제외). 다음 킥오프=[[project-cnote-meeting-flow]] `01_docs/킥오프/260708_미팅흐름_이어서_킥오프.md`. 관련 [[reference_cds_harness]].
