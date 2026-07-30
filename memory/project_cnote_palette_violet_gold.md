---
name: project_cnote_palette_violet_gold
description: "CNOTE 신규 프리미엄 팔레트 — 바이올렛(primary)+골드(accent≤5%)+그레이(canvas) 3층, 코드=SSOT. 기존 인디고 #2A3FEC·Figma #5a6cf7 폐기"
metadata:
  node_type: memory
  type: project
  originSessionId: a1564576-d2f1-4b63-8e58-a95aa706891e
---

CNOTE 색상 팔레트를 **바이올렛+골드+그레이 3층 프리미엄 배색**으로 확정(260709, 스토리북 세션, R-Design). 기존 인디고 #2A3FEC도, Figma의 #5a6cf7도 아닌 **신규 방향**. 근거 = `02_design/CDS_상업공간_색채계획_가이드.md`(70/25/5 배분법칙·시니어 한색선호·AAA대비). 코드(global.css)=SSOT, Figma는 역반영 대기([[project_cnote_storybook_v2_rn]] backport 문서).

**팔레트 (라이트 / 다크)**
- 주조 canvas: `#EBEBEB` / `#100E18`(바이올렛-차콜) — 중성필드+백색카드 figure-ground
- primary(상시CTA·브랜드 ~25%): `#4127D1`(흰글자 8.7:1) / `#6549FF`(흰글자 5.3:1) — 바이올렛=액티브시니어 선호색, AAA대비
- accent(최상위CTA **≤5%**): `#F2DB10`(검정글자 14:1) / `#EBC934` — 골드=주얼포인트, primary와 보색텐션
- primary 계열 full: hover #3319B8/#7D66FF, subtle #ECE9FB/#211C3D, muted #D6CFF7/#2E2752

**핵심 교훈·규칙**
- ★다크 primary는 **base만 뒤집으면 버그**: subtle/muted/hover가 라이트값(#EDEFFE 등)으로 남아 비활성/로딩이 **밝은 덩어리**로 튐. → 계열 전체를 다크 정의해야(수정·렌더검증 완료). [[next_session_cnote_contrast]]와 동일계열 문제.
- ★**시맨틱 -subtle 전부 다크 오버라이드 필수(260709 R4 재발·수정)**: warning/success/info/danger-subtle이 라이트 파스텔값(#FEF3C7·#DCFCE7·#DBEAFE·#FEE2E2)만 정의돼 다크에서 **밝은 색덩어리**로 튐(안전보증 카드·확인필요 필드·정보칩). global.css 다크블록에 어두운 틴트 추가(warning #2A2410·success #16281A·info #16233F·danger #2E181A). primary-subtle 버그와 **동일 패턴** — 새 시맨틱색 추가 시 -subtle 다크값도 반드시 세트로. 그 위 값 텍스트=text-text-primary(양모드 가독)로.
- ★골드 accent는 **fill+검정글자+아이콘**으로만, **화면당 최상위 CTA 1개 ≤5%**. 노랑 텍스트·대량fill·단독 의미전달 금지(시니어 수정체 황화→노랑 구별력↓, 이중코드 원칙).
- ★accent(그린기미 골드) ↔ warning(오렌지 앰버 #F59E0B) **구분 유지**(의미충돌 방지). success/danger/info 시맨틱색 그대로.
- 현재 accent 토큰은 신설만, **컴포넌트 미적용** → R4 화면조립 때 화면별 최상위 CTA에 적용.
- 라이트 primary는 흰글자, 다크는 밝은 바이올렛이라 흰글자 유지 가능(5.3:1). 캔버스는 네이비 폐기→바이올렛-차콜(브랜드 통일).

관련 [[feedback_semantic_size_tokens]] [[project_cnote_premium_craft]] [[feedback_visual_verification]].
