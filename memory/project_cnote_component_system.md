---
name: project-cnote-component-system
description: "CNOTE 컴포넌트 주도 디자인 시스템 — 유형 가이드→Figma 컴포넌트→화면 템플릿 흐름, 빌더/워커 분리"
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
---

CNOTE 디자인 운영 모델 = **컴포넌트 주도**(2026-06-30 전환). 컴포넌트 유형이 정본, 화면은 유형을 가져다 조립. 화면 통째 AI 생성에서 **컴포넌트 조합**으로 전환.

**운영 흐름**: 컴포넌트 가이드(유형 정본) → ⑨ 컴포넌트 브리프 → [Figma MCP] 컴포넌트 제작 → 화면 템플릿(컴포넌트 인스턴스 재사용).

**산출물** (`03_projects/260610_C-Level_note/02_design/screen_design_v2/`):
- `data/_component_types.json` — 유형 분류 정본(40유형·424 인스턴스 매핑·49 레이아웃 `_excluded`). data-component(48)+data-aux(419) 흡수. 각 유형 `{_desc,_screens,instances}`.
- `2midfi_00_components.html` — 컴포넌트 가이드(유형 라이브러리). idx-back·더보기(메타 접힘)·가로100%·사용화면 goto 링크. `data-stage="guide"`로 빌더 격리.
- `brief_component/<유형>.md` — 컴포넌트 브리프(Figma 제작 명세: anatomy·상태·variant·props·무드). 레퍼런스=`InputField.md`.

**하네스 — 판단/결정론 분리**: cataloger(워커)=분류(`_component_types.json`)만 / `build-component-guide.mjs`(빌더)=가이드 HTML 조립(결정론). 워커 40유형 손조립 48분 hang→빌더 1초. 분류 바뀌면 빌더만 재실행. 게이트=`validate-components.mjs`. ["결정론은 빌더, 판단은 워커"]

**워커 3종**(`.claude/agents/screen-component-*`): cataloger(⑧ 분류)·briefer(⑨ 컴포넌트 브리프)·ui-reviewer(⑩ 검증, read-only 7차원). 검증 기준 = "Figma 컴포넌트(Variant Set)로 만들 수 있나". 멀티에이전트(유형 그룹 병렬→adversarial verify→개선→빌더 재생성).

**브리프 2계층**: ⑨ 컴포넌트 브리프(Figma 제작용, 지금) / ③ 화면 조립 브리프(템플릿용, 나중).

**빌더 진화**(`build-component-guide.mjs`) — `_component_types` 읽어 인스턴스 추출·조립. ① 미드파이 `<style>` 주입(인스턴스 스타일 보존=깨짐 방지) ② `.variant-item{width:fit-content;overflow:visible}`(넓은 위젯/바텀시트 넘침 방지) ③ fixed류(`.fixed-action-bar`·`.save-dup-area`) static 가두기 ④ `clean()`으로 검수메타 제거(`.pri` 우선도·`.pb/wgt-hidden`·`→SCR` 핫스팟안내·note·issue-panel) ⑤ 사용화면=`findScreen` 실제 SCR_ID `prototype.html?goto=` 링크. 게이트=`validate-components.mjs` v2(흐름 data-component+aux ↔ types ↔ _excluded 미분류0·중복0).

**현황(2026-06-30)**: 41유형·423 인스턴스 매핑·제외 42·미분류 0·컴포넌트 브리프 37개(`brief_component/`). 검증=40에이전트 병렬(Figma준비 4/미준비 36→브리프화). ActivityTimeline은 쓰레기통 오분류라 해체.

**분류 정확성 검수(47에이전트, 2026-06-30)**: 41유형 5그룹 병렬 검수 → 1차 의심 42건 → adversarial 재검으로 17건 확정 재배치(캘린더설정카드 4종→SettingsCard / 버튼묶음 OUTLINK·SEND_METHOD·ROW_INPUT→ActionGroup / 인라인라디오 CADENCE→SettingsRow / MEETING_TYPE_TOGGLE→Toggle / CARD_GMAIL_DISCONNECTED→SettingsCard 등). 빈유형 0.

**빌더 모바일프레임**: 인스턴스를 `.phone`>`.screen`으로 감싸 미드파이 레이아웃 컨텍스트 복원(여백·넘침 근본해결). `.phone *{position:static}`로 바텀시트 오버레이(absolute)를 흐름 복귀(빈카드 방지). 미드파이 `<style>` 주입은 유지.

**시각검수 게이트(check-layout.mjs, 2026-06-30)**: playwright-core + 시스템 Chrome(`C:\Program Files\Google\Chrome\Application\chrome.exe`)로 가이드를 실제 렌더 → 각 variant-item의 빈카드(`.screen` 높이<24)·가로넘침(scrollWidth>clientWidth)·토글핸들(`.toggle::after` width<6) 결정론 검출(exit 1). 텍스트게이트(validate-components·grep)가 못 잡던 **레이아웃 회귀를 자동 발견**. 실제로 `* static` 땜질이 토글 핸들(::after absolute)을 깬 걸 적발 → override를 인라인 absolute/fixed만 static으로 정밀화(클래스 position 보존). **`build-all.mjs`(재생성→validate-components→check-layout 일괄)가 회귀 방지 핵심 — 재생성 시 두 게이트 자동 실행.** check-layout 빈카드 판정=자식요소0(텍스트0이라도 체크박스·아바타·스켈레톤은 자식 있어 정상=false positive 방지). extractBlock은 `display:none` ghost(reserved-empty-state) 건너뛰고 실제 렌더 추출(CARD_PERSON_ALMOST_READY 빈카드 사례).

**레이아웃 교훈**: 인스턴스를 `.phone`>`.screen` 모바일프레임으로 감싸 미드파이 컨텍스트 복원. override는 광범위(`*`)하면 의도된 position(토글핸들·배지)을 깨므로 **인라인 스타일 선택자로 한정**. 회귀는 시각검수 게이트로 매 빌드 자동 검출.

**마일스톤(2026-06-30)**: 41유형 가이드 + **컴포넌트 브리프 41/41 완비**(`brief_component/`, anatomy·상태·variant·props·치수·무드·완성도갭) + 가이드 각 유형에 '📋 디자인 브리프' 링크(빌더가 `brief_component/<유형>.md` 존재 확인). 게이트 2종: `validate-components`(텍스트: 분류·매핑·사용화면미상) + `check-layout`(시각: 빈카드·넘침·토글핸들). 위젯·푸시는 SCR_화면 아니라 사용화면=명시폴백('홈·잠금화면'/'OS알림센터'). **Figma 컴포넌트 제작 준비 완료** — 브리프가 Variant Set 제작 입력. 다음=Figma MCP 컴포넌트 제작→화면 템플릿. ※briefer 워커는 Write 차단될 수 있음(SummaryCard 사례)→오케스트레이터가 result 받아 직접 저장.

**피그마 핸드오프**: `02_design/screen_design_v2/_FIGMA_HANDOFF.md` — 피그마 세션이 이 문서로 컴포넌트 제작 시작(입력자료·제작순서·CDS토큰매핑·우선순위 atom→행→카드→OS위젯·정합체크). **설계세션(가이드·브리프·게이트)→피그마세션(Figma 제작)** 역할분담. CDS=figma.com/design/OEqJJI0oCGgGZ28exd866d. 핵심: 구조=브리프/비주얼=CDS토큰, 하드코딩치수→토큰바인딩(일괄변경 전제).

**CDS 매핑(node 314-2 "🧩 Component Sets", 43 Component Set)**: 41유형 중 **중첩22**(네이밍 다름: Toggle→Switch·InputField→Input·Dropdown→Select·ListRow→ListItem·InputArea→Textarea·TabsSegmented→Tabs·Skeleton→SkeletonLoader·Widget→WidgetCard·SettingsRow→SettingRow)→업데이트 / **부분중첩3**(WidgetPart·SettingsCard→SettingsGroup·IllustrationPlaceholder→EmptyState내장)→보강 / **신규16**(TaskCard·ScheduleCard·SummaryCard·StatusCard·ActionGroup·PermissionRow·NotificationItem·DateHeading·ImageThumb·CalendarEventCard·PersonAddCard·NoteCard·DelegateCard·SearchResultCard·FormField·MenuItem)→제작(ListItem·ChecklistItem 재사용우선). **CDS포맷**=showcase"DS·{Name}"+실제VariantSet"Prop=Value"콤마+Color변수바인딩, 카드류=Card패밀리섹션(464:60). 매핑·포맷 전문=`_FIGMA_HANDOFF.md` 7·8절.

**피그마 세션 1차 실패 + TaskCard 시범(2026-06-30)**: 피그마 세션이 신규 16종을 ①기존 컴포넌트 인스턴스 재사용 안 하고 직접 그림(`instances:0`, 제각각) ②회색조 변수 바인딩(wireframe 톤)으로 만듦. 근본=핸드오프가 '무엇을'만 주고 '어떻게'(실행)를 안 줌. **해결=설계세션이 TaskCard 올바른 시범 제작**(CDS node `626:112` "DS · TaskCard", type=single 3 variant). 방식: 기존 atom **인스턴스 조립**(`defaultVariant.createInstance()`+`setProperties` variant전환) + **브랜드 토큰 바인딩**(`setBoundVariableForPaint`/`setBoundVariable`, color/surface·text-primary·primary·danger / spacing·radius). atom key: Checkbox327:7·Avatar323:10·Badge322:12·Button300:27·Input587:146·Textarea325:10. 변수컬렉션=CNOTE Colors/Spacing/Radius+텍스트스타일11종(Pretendard Variable). **Pretendard·Badge라벨은 MCP 로드 불가→데스크탑 플러그인 세션에서만**(한글=Noto Sans KR 가능). 실행지시 전문=`_FIGMA_HANDOFF.md` 9절. 신규16종 재작업=626:112 레퍼런스.

**와이어프레임 섹션 디자인 개선(6종, 2026-06-30)**: 피그마 세션이 만든 와이어프레임 톤 섹션 6종을 재디자인. **원칙=①카드 배경 없이**(화면 템플릿 조립 친화 — 컴포넌트 자체에 카드/그림자 금지, 부모와 충돌) **②요소별 형태감**(녹음중=고스트pill·스텝=원형·타임라인=세로커넥터·파형=라운드캡) **③브랜드 토큰**(primary·success·danger·neutral·surface) **④가운데 정렬** **⑤대비 위계**(주요소 크게·굵게 / 보조 작게·연하게, '평균적 비례' 회피). 컴포넌트 id: RecordTimer482:18·Stepper482:53·AudioWaveform482:23·RecordControls482:17·Timeline481:44·QuickActionTile479:26.

**전체 일괄수정 협업체계(2026-07-01)**: 피그마 세션 작업물 전체를 TaskCard/6섹션 기준으로 재수정. **오케스트레이터(figma use_figma 수정)+진단/검수 에이전트(서브, figma MCP 접근 가능 확인됨)+사용자 게이트**. 진단=5에이전트 병렬(P0·P1P2·신규카드·신규개별·Card패밀리). **진단 핵심발견: 색/토큰은 대체로 OK, 결함=atom 인스턴스 미재사용(직접 그림)에 집중**. 와이어프레임 회색조=신규개별4(MenuItem·FormField·NotificationItem26색·PermissionRow16색)+TaskCard612(→626대체). 중대=SettingsGroup(SettingRow/Divider 미인스턴스). 양호=Tag·Divider·SocialLogin·Tooltip·SettingRow. **품질기준=9항**(①인스턴스②토큰③카드없이④형태감⑤대비⑥정렬 + ⑦리듬감⑧여백=디자인⑨그리드규율 + **⑩시각적경량화/중첩박스회피**(컨테이너 안 요소는 보더·배경 중복금지='박스 안 박스'·이중카드 금지, 구분=divider/여백, 답답함 주범=경계선·배경 중첩. 사용자가 SettingsGroup의 SettingRow 보더 제거 요청→레퍼런스)) **+CNOTE 디자인언어**(Porsche·Unit8 절제고급 차용: 대담한 타이포격차·넉넉한여백 spacing2xl·pill칩메타·절제그림자+radius lg·무채+primary 1포인트). 전문=`_FIGMA_HANDOFF.md` 10절. [[project-session-alias-registry]] [[reference-cnote-screen-links]] [[reference-screen-design-pipeline]] [[project-cnote-screen-changes]]
