---
name: project_cnote_figma_variables
description: "CNOTE Figma 디자인 시스템 — Variables 생성·바인딩 완료, 다크모드 전환 작동"
metadata: 
  node_type: memory
  type: project
  originSessionId: 222a6e50-655e-4af5-8e7e-780620dce9e3
---

CNOTE 디자인 시스템(Figma `OEqJJI0oCGgGZ28exd866d`, 페이지 `🎨 Design System`)의 Figma Variables 작업 **완료**(2026-06).

**생성된 컬렉션:**
- `CNOTE Colors` — 37개 색상, **Light/Dark 2모드** (`tokens.css` 값 매핑)
- `CNOTE Spacing` — 6개 (xs4·sm8·md16·lg24·xl40·2xl64)
- `CNOTE Radius` — 6개 (xs4·sm8·md12·lg16·xl24·full9999)

**바인딩 완료:** 색상 fills 838 + strokes 120 / 간격(itemSpacing·padding) 270 / radius 119. 페이지 `setExplicitVariableModeForCollection`으로 Dark 전환 시 배경·텍스트·버튼(primary→#7D8CF5) 자동 전환 검증됨.

**남은 한계 (필요 시 수동 조정):** 값 기준 자동 매핑이라 `#FFFFFF`를 일괄 `surface/base`로 바인딩 → 다크모드에서 **흰색 전경(FAB 위 아이콘/버튼 라벨 등)** 이 어두워질 수 있음. 이런 전경은 `text/inverse` 또는 고정 흰색으로 수동 재바인딩 필요.

**타이포그래피(완료):** Text Styles 11종(Display~Caption, tokens.css 크기·행간). 535개 텍스트 적용 — 한글 **Pretendard Variable** 242개(사용자가 데스크톱 `Pretendard'em All` 플러그인으로 적용 완료), 영문/숫자 **Poppins** 292개(글자별 override 유지). MCP는 로컬·가변 폰트(Pretendard) 미노출이라 적용 불가 → 데스크톱 플러그인으로 처리. 잔여: Section 3 desc 텍스트 1개만 Noto Sans KR(Pretendard'em All 재실행 시 잡힘). **다크모드:** 흰색 전경 surface/white 바인딩, secondary/500 다크값 #334155로 조정 완료.

**MCP 폰트 제약:** `use_figma`/`listAvailableFontsAsync`는 Google Fonts(~7600개)만 보임. 로컬 설치 폰트(Pretendard Variable 등)·가변 폰트는 Plugin API에 노출 안 됨. CJK 디자인 시스템 공통 이슈.

**⚠️ 2026-06-21 폰트 정책 변경:** Pretendard Variable이 Figma에서 굵기 렌더 문제(Bold/Medium이 얇게 폴백) → **한글은 Noto Sans KR로 전면 교체, Pretendard·"Pretendard'em All" 워크플로우 폐기.** 위 타이포 단락의 Pretendard 적용 내용은 더 이상 유효하지 않음. 상세는 [[project_cnote_figma_storybook_sync]].

**Figma MCP 문서:** `03_projects/260609_FIGMA_MCP/01_docs/`(00~03)에 도구 레퍼런스·제약·스킬 가이드. `use_figma` 호출 전 `/figma-use`, `create_new_file` 호출 전 `/figma-create-new-file` 스킬 필수. **2026-06-21 설치 완료**: 두 스킬을 `.claude/skills/{figma-use,figma-create-new-file}/SKILL.md`에 로컬 설치(MCP 리소스 `skill://figma/...` 사본). references/* 는 용량 커서 로컬 미복사 → `ReadMcpResourceTool(server="figma", uri="skill://figma/figma-use/references/<파일>")`로 온디맨드 로드. `use_figma` 호출 시 `skillNames`에 `resource:figma-use` 전달. [[reference_figma_skills_install]]

**레이아웃 검증:** Section 2~11 전부 `/verify-section` 절차로 수정 완료. 공통 버그 = auto-layout `STRETCH`/`layoutGrow` 미적용으로 프레임이 1px/hug collapse → 고정폭 명시로 해결. 검증 스킬: `.claude/commands/verify-section.md`. [[project_cnote]]
