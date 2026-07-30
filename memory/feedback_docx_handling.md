---
name: feedback_docx_handling
description: docx 파일을 전달받았을 때 pandoc 변환을 먼저 하고 비교 분석하는 처리 순서
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 0979483c-0fe2-4450-9354-df9925c6f50a
---

사용자가 새 기획문서(docx)가 추가되었다고 전달하면, 반드시 아래 순서를 따른다.

1. 파일 형식·위치 확인
2. 동일 이름 .md 파일 존재 여부 확인
3. 없으면 pandoc으로 변환 먼저 (`pandoc 파일.docx -o 파일.md --extract-media="파일명_media"`) — 이미지 추출 옵션 필수
4. 이전 버전 md와 신규 md 비교 분석
5. 필요 시 `/sync-docs` 실행

**Why:** docx는 바이너리라 직접 읽을 수 없다. 변환 단계를 건너뛰고 분석을 시도한 실수가 있었음.

**How to apply:** "문서가 추가됐어", "기획서 업데이트됐어" 같은 말을 들으면 변환 여부부터 확인한다. 절대 docx를 바로 읽거나 분석하지 않는다.
