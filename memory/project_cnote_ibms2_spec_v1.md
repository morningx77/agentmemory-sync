---
name: project_cnote_ibms2_spec_v1
description: IBMS2 연동 인터페이스 명세 v1 반영(v0.24.0·260806) — 화면 정합 완료
metadata: 
  node_type: memory
  type: project
  originSessionId: 26da2990-5736-4b13-9636-9d5ffad0098d
  modified: 2026-08-06T05:59:30.343Z
---

★260806 [MVP2] **IBMS2 연동 명세 v1(개발단·260805) mid-fi 정합 = v0.24.0**. 정본=`01_docs/기획/TieMing_x_IBMS2_연동_인터페이스_명세.htm`(_INDEX 등록). 핵심 개념: 기준=**인물 소속 회사 사업자등록번호**→거래처→영업건. 인증=OAuth2 PKCE·토큰=서버만 보관·웹훅=식별자만(데이터 전용 푸시→앱 재조회).

**화면 반영**:
- **no-opp 반전**: 구 "경고+비활성(막다른 길)"→**AI가 채운 신규 영업건 카드 자동 제시**(보내기=거래처+담당자+영업건 동반 생성·API 1회·activityId 멱등). [수정▾]→|new-case-edit(3묶음·"이어짐" 축약·**담당자 구분=업체담당 고정**—명함으론 자금/세금 담당 구분 불가).
- **SCR_IBMS2_CASE_DETAIL 신규**: 수정=단계·영업건명 둘뿐(영업 본진=IBMS2)·나머지 읽기전용·저장=updatedBy(인물 정보) 동봉 안내·STAGE_TRANSITION_NOT_ALLOWED=사유 표시 후 원복.
- **인물상세**: ● IBMS2 영업건 n건 섹션(5상태: 있음/영업건없음/거래처없음/확인불가=사업자번호 입력란/미연동=비표시)+접점 이력 병합(IBMS2 출처 배지=읽기전용·전송됨=보낸 시각·멱등 재전송).
- **요약=5줄 고정 형식**(일자/장소/인원/주제/내용·없는 항목 줄 생략)+제목✎·요약✎.
- **타임라인(SCR_MY_TIMELINE) 진입점 유지**(사용자 확정·명세엔 인물상세만—개발 확인 요청 저널).

**함정/교훈**: ①no-opp·sent에 bottomnav 잔존했었음(260805 nav 스윕 누락—midfi는 check-nav-policy 게이트 밖, 스토리북 게이트만 잡음)→신규 화면 만들 때 하위=탭바 없음 수동 확인. ②mid-fi 예시 데이터 정합: 인물상세(넥스트 솔루션즈)에 명세 예시(한국정밀기계) 그대로 넣으면 흐름 모순—같은 인물/회사 데이터셋으로 정렬. ③04_people 앵커는 both-sides 변형과 중복(관계요약·범례 각 2건)—치환 시 count 확인. [[project_cnote_ibms2_integration]]
