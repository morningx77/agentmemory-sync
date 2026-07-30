---
name: project-cnote-ia-source-of-truth
description: CNOTE 화면 정본 = IA v2 엑셀. AI_Designer_Pack은 그 위 케이스별 컴포넌트 정의 레이어
metadata: 
  node_type: memory
  type: project
  originSessionId: 1eb6668f-19d8-4993-a54f-2430e5f07c0f
---

**문서 lineage (2026-06-22 확정)**: 기획 docx(상위·개념 22화면) → [참고하여 분해] → **IA v2 엑셀(하위·와이어프레임 36~47화면)**. 즉 엑셀이 기획 docx를 더 granular하게 분해한 다운스트림.

**와이어프레임 정본 = `01_docs/CNOTE_IA_v2_draft_260616.xlsx`** (하위 와이어프레임 IA, 36~47화면). `wireframes/` PNG 세트(WF/EX/WGT)와 매칭. → 우리 `screen_design_v2/`(47화면)가 정확한 와이어프레임 기준. **재빌드 유효.**

**기획 docx(`AI음성노트앱 기획 v2.1_260615`, 최신 06-22)** = 상위 개념(22화면 인벤토리 v5) + **트리거·데이터 노출 정의서 통합**(93 트리거 A~K · 시점별 데이터 노출 매트릭스 · 매핑표 v4(트리거×화면·컴포넌트) · 정책 v5). 22화면은 개념/설계 레벨이고, 엑셀 36은 그걸 분해한 와이어프레임 레벨. **v2.1의 트리거/데이터 detail은 taxonomy 무관하게 v2 와이어프레임 콘텐츠·우선순위 보강 재료.** (이전 `AI_Designer_Screen_Pack_v1.md`는 이 정의서의 일부가 별도 파일이던 것.)

**중대한 함의(2026-06-22 발견)**: 기존에 만든 lo-fi/mid-fi HTML([[project-cnote-wireframe-html]])은 **AI_Designer_Pack의 22화면을 골격으로 삼아 IA v2(36~47화면)와 어긋나 있다.** 이름 완전 일치 6개뿐. → IA v2를 정본으로 **재정렬(재빌드) 필요**. 진행: 크로스워크(매핑표) → IA v2를 인벤토리로 [[reference-screen-design-pipeline]] 재빌드.

**대응 요약**: 재활용(이름변경) ~18(SCR_PERSON_DETAIL→SCR_PERSON, SCR_PERSON_LINK→SCR_PERSON_MATCH, SCR_MEETING_BRIEFING→SCR_MEETING_BRIEF, SCR_EMAIL_SUMMARY→SCR_COMM_DETAIL, SCR_DELEGATE→SCR_DELEGATE_HOME 등) · 신규 ~30(사람탭·소통·비서4·설정8·위젯7·온보딩 다수) · 드롭/2차 5(LEAD·OPPORTUNITY·COMPANY_DETAIL·TABLET·EXEC — IA v2 미포함, 모바일 전용). 크로스워크: `01_docs/2026-06-22_IA_v2_crosswalk.md`.
