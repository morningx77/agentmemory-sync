---
name: project-cnote-recording-entry
description: "CNOTE 녹음(기록) 진입 설계 확정 — FAB '녹음' 통일 + 탭/롱프레스 이원 진입 + 명함 기록 흐름"
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
---

CNOTE 1차 MVP 화면 설계에서 **녹음(기록) 진입 경로**를 확정·배포한 결과(260702~03). 정본=mid-fi `2midfi_*.html` + `data/flows.json`. 관련: [[project-cnote-ia-source-of-truth]], [[project-cnote-wireframe-html]], [[reference-cnote-ops]].

**FAB 라벨 통일**: 하단 네비 FAB "미팅 정리" → **"녹음"** 전 화면 통일(mid-fi 10파일 63개 + flows.json FAB 핫스팟 + 프로토타입 재빌드·재배포). 근거: 시니어(C-Level) 대상 → 행동 즉시성. 마이크 아이콘과 1:1로 읽힘. (빈상태/직후 CTA "미팅 정리 시작·하기"는 맥락 달라 유지.)

**녹음 진입 최종 구조 (탭/롱프레스 이원)**:
- **FAB 탭 = 녹음화면(SCR_RECORDING) 즉시 진입(음성 기본)** → 화면 안 "다르게 기록: [텍스트로][명함으로]" **정식 전환**(기존 "텍스트로 정리하기(마이크 거부 시)" 폴백 프레이밍 제거). = 정본·시니어 발견성.
- **FAB 롱프레스 = 입력방식 선택 시트**(홈 `capture-sheet` 상태 오버레이: 음성 녹음/텍스트로/명함으로/닫기). = 숙련자 지름길(plus-alpha).
- 두 경로가 **동일 3방식·동일 목적지로 수렴**. 롱프레스 몰라도 정식 경로로 전부 도달(시니어 무손실).

**핵심 원칙(재사용 가능)**: 시니어 대상은 **숨김 제스처(롱프레스·스와이프)를 유일 진입으로 두면 안 됨**(발견 못 하면 없는 기능). 단 명시적 정식 경로가 있으면 롱프레스는 순수 보조로 병행 OK = progressive disclosure.

**명함 기록 흐름**(화면 신규 0, 재사용): 녹음화면 [명함으로] → SCR_CARD_SCAN → SCR_CARD_RESULT → **"인물로 등록" → SCR_PERSON**. 명함 화면은 2midfi_01(온보딩)에 있고 원래 "이 정보로 등록"→내 프로필(SELF_TIMELINE) 전용. 기록 맥락 CTA "인물로 등록"을 병존 추가(baseline은 둘 다 표시, 실제 앱은 진입 맥락별 택1 — 주석 명시).

**게이트/배포 실무 함정**:
- validate-flows·sync-check는 **화면 ID만 검증, 핫스팟 라벨 텍스트는 미검증** → 라벨 변경은 게이트에 안전(단 프로토타입 핫스팟-버튼 라벨 일치를 위해 mid-fi 버튼과 flows label 함께 맞춤).
- 신규 오버레이는 **SCR_ 신설 대신 기존 화면의 state(예: SCR_HOME|capture-sheet)로** 추가하면 IA·인벤토리 재등재 불필요(sync-check는 SCR_ 화면 단위, state는 device 실재만 검사).
- deploy-sftp 타겟 = prototype·storybook·**midfi**(신규 추가). midfi = `2midfi_*.html`+`_midfi_kit.css`+`link.html`을 remoteDir `/upload`(=`next.sgate.biz/v1/design/`)에 올림 → 개별 mid-fi URL 갱신. 프로토타입은 mid-fi 임베드라 prototype 타겟만으로도 반영되지만, 개별 `2midfi_*` URL은 midfi 타겟 재배포 필요(`node scripts/deploy-sftp.mjs midfi`).

**정합 프레임(잠정, v2 홈 파일럿)**: mid-fi=계약(정보·행동·플로우 WHAT, 불변) / 크리에이티브 다크 시안+DESIGN_PRINCIPLES ㉑~㉔=표현(레이아웃·위계·원 언어 HOW, 자유). "정보구조=mid-fi"가 "레이아웃=mid-fi 복제"를 뜻하지 않음(리스킨 금지). 단 **홈은 절제**(관계망 장식 제거, 프로필만). 파일럿 `02_design/CNOTE_home_reconciled_v2_260702.html`. 홈 비주얼 방향 최종 확정은 미완(녹음 진입으로 화제 전환됨).

**하네스 고도화 왕복(260703, 진행중)**: 피그마 세션이 `02_design/_HARNESS_UPGRADE_BRIEF_260703.md`(Fable로 표현 하네스 고도화 — 정본5건·크리에이티브 프롬프팅 프로토콜·Figma 플레이북) 작성. 기획 세션이 **보강 5건 전달**: ①프로토콜에 "계약 충족 게이트"(발산이 mid-fi 계약 훼손 금지, 검증에 계약6항) ②브리프 입력에 기획 정본(mid-fi·flows·IA·프로토타입) 추가 ③정본에 시니어 진입/발견성 원칙 ④nav IA 정합(피그마 관계/비서/내정보 vs mid-fi 사람/할일/설정) ⑤HTML mid-fi 트랙↔Figma 크리에이티브 트랙 두 트랙 인지. **사용자가 피그마에 전달→수정본 회신 예정**. 회신 오면: 정합 확인 + 이 세션 몫(시니어 진입 원칙·계약↔표현 정합 프레임)을 DESIGN_PRINCIPLES/screen-pipeline 방법론에 명문화.

**하네스 왕복 2차 — 사용자 행동 분석 훅(260703)**: 페이블이 하네스 고도화 완료(정본 §0-1 계약↔표현·㉔Dark/Light쌍·§5글래스·㉕구축규율·㉖시니어진입 + 크리에이티브 프롬프팅 프로토콜[발산→비평→합성] + Figma 플레이북 P0~P6). 기획이 **사용자 행동 분석 계측 훅 4건 전달**: ①플레이북C 제작절차에 "계측 자리"(analyticsId prop·useScreenView·data-private, 스토리북 no-op) ②플레이북 DoD에 측정훅 체크 ③정본 ㉕에 "측정 가능성"(핵심 행동요소=식별자, 설계ID=이벤트ID) ④하네스 로드목록에 04_ops 2문서 참조 등록. **경계: 창작 프로토콜(발산/비평)엔 반영 금지, 구축 계층에만.** 사용자 행동 분석 문서 정본=`04_ops/CNOTE_사용자행동분석_도입방안_260703.md`+`_측정계획_260703.md`(이벤트 6종·flow별 56화면·퍼널 6종·마스킹). **도구=Microsoft Clarity 확정(260704)**: 프로젝트 ID `xgmui6yrcp`, RN SDK 설치 완료. 무료·세션리플레이·히트맵+`sendCustomEvent`로 Funnels 지원. **함정: Clarity는 이벤트별 속성(props) 미지원**(sendCustomEvent는 이름 문자열만)→표준(이벤트=행동,ID=속성) 대신 **이벤트명에 인코딩**(scr_/cta_/funnel_ 접두사+snake_case). `track()` 추상레이어가 도구별 변환(컴포넌트는 표준형식 유지→도구전환 무수정). 세션속성=setCustomTag/setCustomUserId. **마스킹=Balanced이상+녹음/명함/인물 화면 강제 maskView, Relaxed금지**. 문서=`04_ops/CNOTE_사용자행동분석_01_도입방안·02_측정계획_260703.md/docx`(01/02 넘버링). **순서: Clarity 매핑표 확정·대시보드 퍼널등록·이벤트흐름 검증은 스토리북 구현 완료 후**(지금은 네이밍·마스킹 규칙만 확정, 매핑표는 시기상조).

**B확정+통합본(260706)**: Clarity 단독→**Clarity+GA4 병행 확정**. 이유=피드백설계 문서의 4축 판단룰(D7재방문≥40%·TTV≤3일·루프폐합률≥60% 등 숫자임계값)을 1차부터 돌리려면 GA4의 리텐션·시간·속성집계 필수(Clarity는 이벤트속성 미지원→리플레이"왜"만). 역할=Clarity(정성·리플레이)+GA4(정량·집계), 둘다무료, track()추상레이어가 양쪽분배. **3문서(도입방안01·측정계획02·MVP설계피드백)를 단일 통합→`04_ops/CNOTE_사용자행동분석_실행설계_260706.md/docx`(정본)**. 통합내용: C레벨행동근거+4축(A흐름완주/B재진입/C신뢰유도/D위임니즈)+F5녹음진입검증 보강+이벤트(기본6종+신설11종 loop_closed·reentry·ai_edit·delegate_intent 등)+공통속성(session_id·seq_index·latency_ms 등=GA4)+지표별 도구매핑5열+마스킹+fake door위임+운영프로세스. **MVP성공=①루프완주(축A)+②반복(축B)+③가치·신뢰(축C), 소수표본이라 임계값=방향신호·개별리플레이관찰이 판정중심**. 기존3문서(01·02·피드백)는 통합본으로 대체—정리대상.

**하네스 왕복 완료(260704)**: 페이블이 계측 훅 4건 전부 반영 — 플레이북 `_FIGMA_DESIGN_PLAYBOOK_260703.md`(P5-B 7수 계측자리·P6 DoD 측정훅체크·P0.1 로드목록 참조) + 정본 ㉕(측정 가능성). 경계 준수(프로토콜엔 불반영). 기획 몫(계약↔표현=§0-1·시니어진입=㉖)도 함께 반영됨→별도 명문화 불요. **하네스 완비**(정본+프로토콜+플레이북+계측훅). 다음 실행: "정본+프로토콜+플레이북 로드 후 시작"으로 컴포넌트 카탈로그·온보딩 4화면. **제작 시 검수 포인트**: DoD 측정훅 체크에 "측정계획 퍼널 F1~F6 스텝 요소(BTN_RECORD_DONE·BTN_SHEET_* 등) analyticsId 커버" 대조하면 측정 누락 0.
