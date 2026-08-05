---
name: project_tieming_bi
description: Tieming — CNOTE 앱 BI/앱아이콘 방향 확정(파동-m). 크리에이티브 세션 260729
metadata: 
  node_type: memory
  type: project
  originSessionId: 9c0b9b86-936a-4d31-9f94-e1910d50c034
  modified: 2026-08-05T04:31:36.740Z
---

★260805 **A-4 적용범위 계약 확정**(기획·정본=`ISPARK\…\01_docs\설계_명세\TieMing_BI_적용범위_계약_260805.md`): **Tier1 풀브랜딩**(앱아이콘·스플래시·온보딩 시작)/**Tier2 라이트**(공유링크 랜딩 TieMing 표기·트랜잭션메일 헤더·푸시 앱네임·디지털명함 하단 표기 기본ON)/**Tier3 비노출=앱 내부 일상화면 전부**(로고·워터마크 금지·색/타이포로만·헤더 심볼 금지). 규칙=워드마크≥16px·클리어스페이스≥50%·골드 정점 1곳≤5%·다크=흰+골드/라이트=잉크+골드. 크래프트=스토리북2/피그마(저널 전달·백로그와 별개 트랙). Phase A 마감.

★260729 크리에이티브 세션. CNOTE 앱의 **BI 네이밍 "Tieming" 확정**(사용자 승인).

- **네임/컨셉**: **Tieming** = **Tie(관계를 잇다) + Ti(ming)** → 읽으면 "타이밍", 뜯어보면 "관계". 태그라인 **"관계는 타이밍이다 / Relationships are all about timing"**. CNOTE 포지셔닝(저장 아닌 타이밍)과 정확히 일치.
- **심볼**: 워드마크 "Tieming"의 **가운데 m을 파동/펄스로 형상화**(2마루=∩∩=m이자 신호). **오른쪽 정점 1점만 골드**(="그 순간", ≤5%). 이 파동을 떼어 **다크 스퀘어클 앱 아이콘**으로. 48px 가독 OK.
- **버린 방향(사용자 반려 이력)**: ① 기존 인터섹션(두 원 교차) 그대로 앱아이콘化=**재탕**(인앱 스플래시 그래픽 복사) ② 파셋/명도스텝 로우폴리=**올드** ③ CDS 관습 답습 경향. → "힘있는 그래픽 형태 마음껏"으로 재발산. 힘있는 3안(결속 인터록/순간 궤도/이음) 거쳐 최종 **파동-m**으로 수렴.
- **팔레트 계승**(=[[project_cnote_palette_violet_gold]]): 베이스 #0C0A16/#100E18, 바이올렛 #6549FF/#8B7BFF, 골드 #F2DB10(정점만). 무드=Precise·Calm·Executive·Intelligent "조용한 확신". **음성 녹음/회의록 클리셰 금지**(제품이 부정).
- **산출물**(전부 `03_projects/260610_C-Level_note/02_design/`):
  - `_APP_ICON_BI_기반브리프_260729.md` (제품·타깃·팔레트 근거)
  - `_Tieming_BI_아티팩트_생성_프롬프트_260729.md` (재생성용 프롬프트)
  - `tieming_bi_board.html` = **시안 A · 파동 펄스**(바이올렛+골드, executive) → artifact `ac0dbe4a-2794-4be1-924d-607f4e5f6037`
  - `tieming_bi_board_spectrum.html` = **시안 B · 스펙트럼 막대**(6색 무지개 이퀄라이저, 활기·대중적, 참조이미지 기반) → artifact `1b4d1efa-7995-4173-9b1f-34eea4e08c61`
  - Figma CDS 페이지 "BI"(node 2486:872)엔 발산 습작들(원/파셋/힘있는3안)이 남아있음.
- **아티팩트 URL**: A=https://claude.ai/code/artifact/ac0dbe4a-2794-4be1-924d-607f4e5f6037 · B=https://claude.ai/code/artifact/1b4d1efa-7995-4173-9b1f-34eea4e08c61 (재게시=같은 file_path).
- **함정/노하우**: (1)use_figma 벡터는 vectorPaths 세팅 시 bbox를 (0,0) 정규화→노드 x/y를 **점들의 min으로** 세팅해야 제자리. 기존 벡터 path 교체 시도 금지(위치 틀어짐)→**새로 생성**. (2)아티팩트 눈검증=로컬 chrome-headless-shell(`$LOCALAPPDATA/ms-playwright/chromium_headless_shell-*/`)로 `--screenshot --force-prefers-reduced-motion --virtual-time-budget` 캡처 가능(npm playwright 없이).
- **미결/다음(★260804 세션종료·마이그레이션 완료 후 재개)**: ⓐ **시안 A vs B 정본 결정**(소견: C레벨 포지션엔 A 정합, B는 컬러 거버넌스 이탈) ⓑ 절충안 C(막대형+바이올렛·골드 2색 듀오톤) 제작 옵션 ⓒ 선택안 디테일 튜닝 ⓓ Figma "BI" 페이지 벡터 이관 ⓔ "Tieming"이 CNOTE **전체 정식 리네이밍**인지 확인 대기(현재 BI/아이콘에만 반영·폴더명 `260610_C-Level_note` 유지).
- **★경로 주의**: 회사/개인 분리 마이그레이션(=[[project_workspace_company_personal_split]]) 후 CNOTE는 **`ISPARK\03_projects\260610_C-Level_note\`**로 이동됨. 위 산출물·Figma 작업은 그 새 경로에서 재개. 전달사항=루트 `_MIGRATION_전달사항_크리에이티브세션_260804.md`.
