---
name: project_themony_adsense_niche_focus
description: "THEMONY AdSense \"가치없는콘텐츠\" 재심사 대응 — 니치집중·off-niche 숨김"
metadata: 
  node_type: memory
  type: project
  originSessionId: 65ee744c-c1c6-4520-901a-b07c503118b7
  modified: 2026-07-21T09:43:17.182Z
---

THEMONY AdSense 승인 재차 반려(**"가치가 별로 없는 콘텐츠"**) 대응(260721).

## 진단 (콘텐츠 감사)
- 168글: 길이 min1773/중앙2722/max4994자(얇음0)·유사도 0.12기준 0쌍(중복아님) → **글 자체는 OK**.
- ★진짜 원인 = **대량 자동발행 지문**: 6/27~7/13 2.5주에 ~140글, 하루 최대 **22글**(7/5)·18/18/13/12. = Google scaled content abuse. + AI동일템플릿(편집팀·목차·표·FAQ)·공공정보재가공·여행제휴(얇음)·약한E-E-A-T·잡화(금융+여행+쇼핑).
- 감사 스크립트/리포트: `01_docs/검토_분석/콘텐츠감사_리포트_260721.md` + CSV.

## 실행 (사용자 결정: 금융·생활 니치집중, off-niche 숨김)
- **여행 51 + 쇼핑추천 9 = 60글 → draft(비공개)** REST 일괄. 표본 404 확인. 168→108공개. 자동발행은 이미 중단상태.
- 유지 니치: 정부지원66·연금세금33·부동산6·금융1·보험1·계산기.
- **메뉴/템플릿 잔재 제거**: WP메뉴항목 309(여행)·310(쇼핑) 삭제. 자식테마 front-page.php(여행/쇼핑 섹션+sb_cats배열)·header.php(생활정보27 메가메뉴브랜치) FTP편집. 백업 `.bak_260721niche`.
- ★복원 정본: `01_docs/계획_핸드오프/_HANDOFF_콘텐츠숨김_복원가이드_260721.md` + `콘텐츠숨김_ids_260721.json`(60 id). 복원=status→publish + .bak되돌리기 + 메뉴재추가.

## ★★함정 (캐시 3중)
변경이 안 보이면: ①**opcache 리셋**(템플릿 변경만, cafe24 validate_timestamps=0, opcr.php로 opcache_reset 호출) ②**SPC 디스크캐시**(`X-WP-SPC-Disk-Cache:HIT`, ★CF퍼지·글touch·REST수정으로 안 지워짐) ③CF purge_everything. FTP홈=웹루트(/www prefix 없음).
- ★★★**SPC 디스크캐시 지우는 정답 = fallback_cache 폴더 FTP 리네임**(`wp-content/wp-cloudflare-super-page-cache/themony.com/fallback_cache` → `_old`). SPC가 빈 폴더 재생성·새 캐시. **개별 *.html 삭제(914개, 2분 타임아웃)보다 압도적으로 빠름**. 콘텐츠/템플릿/페이지 편집이 origin에서도 안 보이면 이거.

## 콘텐츠 리라이트(탈템플릿 고유가치) — 260721
- 진단: 얇음 아님(2700자·유사도0), 문제=대량자동발행지문+**획일 템플릿**(편집팀·목차·표·FAQ). 파일럿=post1428.
- ★★함정: 파일럿패턴(자가진단→★놓치는3가지)을 **전 글 복붙하면 새 템플릿=팜신호**. 서브에이전트에 골드예시 하나만 주면 획일화됨(1차 15개 실패→전량 원복).
- ★정답 아키텍처 = **설계레이어 분리**: Opus가 글마다 다른 **포맷 지정**(워크스루/시나리오/타임라인/비교/해설/오해바로잡기) + "1428구조 재현금지" 명시 → Sonnet 실행. 검증=id별 특징마커 다름 확인. **소수정예 6개만**(73·2088·1376·1414·168·2096), 나머지 원본유지. 정본 가이드 `01_docs/계획_핸드오프/_GUIDE_콘텐츠리라이트_EEAT_260721.md`(§1.5 포맷메뉴).
- 부수 팩트교정: 73 퇴직소득세 ÷2×2→환산급여방식, 1414 보금자리론 운영주체 LH→HF(한국주택금융공사). Sonnet도 가드레일 주면 팩트오류 잡음.
- ★PS5.1 함정: `ConvertTo-Json`이 ~7000자+ 문자열을 `{"value":..}`로 오래핑→502. 긴 content POST는 **Python(io+json.dumps)** 권장(회피됨).

## 남은 것
- E-E-A-T(실명작성자)·핵심글 고유가치 주입(정부지원·연금세금 재가공→고유) → 4~8주 품질유지 후 **AdSense 검토요청**. [[project_themony_adsense_remediation]] [[project_themony_cloudflare]]
