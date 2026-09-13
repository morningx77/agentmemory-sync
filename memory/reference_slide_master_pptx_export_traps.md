---
name: reference-slide-master-pptx-export-traps
description: slide-master(ppt-master) SVG→PPTX 변환 함정 3종 — 줄묶음 재흐름·한글 글꼴 대체·굵기 2단화. 게이트·SVG렌더를 다 통과하고 PowerPoint에서만 드러난다. 해법 레시피 포함
metadata: 
  node_type: memory
  type: reference
  originSessionId: 5ae1536b-02db-4405-94ea-c07226b39b56
  modified: 2026-09-13T02:44:42.984Z
---

260913 UX Korea PPT(23장)에서 실측. **게이트 23/23·원고 기계대조·SVG 렌더 눈검증을 전부 통과한 덱이 PowerPoint로 열자 망가져 있었다.** PowerPoint COM으로 슬라이드를 PNG로 뽑아 보고서야 드러났다.

**★원칙: SVG 렌더가 맞아도 PPTX는 다를 수 있다. PowerPoint로 연 렌더만이 PPTX의 증거다.** 도구의 `verify_deck.py` 컨택트 시트는 officecli TTY 요구로 비대화 세션에서 실패한다 → PowerPoint COM `Slide.Export(png)`로 대체.

## 함정 ① tspan 줄묶음 → 한 문단으로 합쳐져 재흐름
- `<text>` 안에 `<tspan x=같음 dy=...>`를 여러 개 → 변환기가 **한 문단**으로 만들고 PowerPoint가 글상자 폭에 맞춰 다시 흘림. 목록·표·오른쪽 정렬 열이 붕괴, 원고가 지정한 줄바꿈도 바뀜
- **해법**: 줄마다 독립 `<text>`로 분리(y = 부모 y + 누적 dy). 부수효과로 **tspan 사이 공백이 줄 끝에 붙어 오른쪽 정렬이 한 칸 밀리던 숨은 결함**도 사라짐(픽셀 비교로 발견)
- 검증: COM으로 `TextRange.Lines().Count > 1` 글상자 수 = 0

## 함정 ② `Pretendard Variable` → 한글이 대체 글꼴
- 변환기 `DUAL_SCRIPT_FONTS`에 `Pretendard Variable`이 없음 → 라틴 전용 취급, 한글(ea)은 스택 다음의 `Pretendard`로 지정. 정적 Pretendard가 미설치면 조용히 대체
- 도구 전제 = 번들 `assets/fonts/Pretendard/*.otf` 사용자 단위 설치(`shared-standards.md:297`). 설치: `%LOCALAPPDATA%\Microsoft\Windows\Fonts` 복사 + HKCU `...\Fonts` 등록 + `AddFontResource`
- ★**검증 함정**: COM `Font.Name`은 **라틴 이름만** 준다. 한글은 `Font.NameFarEast`. 라틴만 세고 "대체 0"이라 보고했다가 정정함([[feedback-partial-response-is-not-absence]])

## 함정 ③ 굵기가 굵게/보통 2단으로 뭉개짐
- `elements.py:2164` `b="1" if fw in 600~900` — 900·700→굵게, 400·300→보통
- **해법**: 굵기를 **패밀리명**으로. `spec_lock`에 `heavy_family`/`light_family` 추가(검사기가 `*_family` 키를 허용 목록으로 봄)
  - 900 → `"Pretendard ExtraBold", "Pretendard", …` + **font-weight="400"** (≥600이면 b=1이 붙어 가짜 굵게)
  - 300 → `"Pretendard Light", …` + weight 400 · 700/400 → `"Pretendard"` 그대로
  - 부분 굵기 `<tspan>`에도 패밀리 명시(부모 패밀리 상속 오류 방지 — 변환기는 tspan font-family를 읽음)
- 번들에 Black 없음 → 900은 800으로. 브라우저·PowerPoint 동일 렌더를 샘플로 선검증할 것

## 그 밖
- 회람은 **SVG에서 뽑은 PDF**(Chromium page.pdf · 폰트 임베드). PPTX는 받는 PC에 폰트가 없으면 여전히 대체
- PDF 폰트 확인은 `pdffonts`(정규식은 Type3 글꼴을 놓쳐 "맑은고딕만"으로 오판했다)
- Pretendard에 `⊂`(U+2282) 글리프 없음 → 해당 글자만 대체
- SKILL.md Step 6 = **메인 에이전트 순차 생성**(서브에이전트 병렬 금지) — 이관문서가 병렬을 권해도 도구 규정이 우선
- 관련: [[reference-ps51-bom]] · [[feedback-visual-verification]]
