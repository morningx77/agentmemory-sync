---
name: reference_nativewind_animated_classname
description: NativeWind는 Animated.View의 className을 처리하지 않음 — 애니메이션 컴포넌트 스타일 함정
metadata: 
  node_type: memory
  type: reference
  originSessionId: 1763df05-ea22-4314-8d21-41768b3621ee
  modified: 2026-07-21T09:53:13.949Z
---

CNOTE 스토리북(react-native-web + NativeWind)에서 **NativeWind는 `Animated.View`(및 Animated.createAnimatedComponent 래퍼)의 `className`을 처리하지 않는다.** `<Animated.View className="bg-x rounded-md px-md ...">`로 주면 그 클래스가 **조용히 전부 무시**되어 배경·패딩·레이아웃이 사라진다. 자식 `<Text>`/`<View>`의 className은 정상 적용되므로, 흰 텍스트가 투명(=사라진) pill 위에서 안 보이는 식으로 렌더가 깨진다.

**해결**: 애니메이션과 스타일링을 분리한다 — `Animated.View`에는 `style={{opacity, transform}}`(동적 애니값)만 주고, 실제 시각 스타일(bg·radius·padding·flex)은 그 **내부의 일반 `View`에 className**으로 준다.
```tsx
<Animated.View style={{ opacity: anim, transform:[{translateY: ...}] }}>
  <View className="bg-toast-surface rounded-md px-md py-cozy flex-row ...">…</View>
</Animated.View>
```

★교훈: 게이트·type-check PASS여도 렌더는 깨질 수 있다 → [[feedback_visual_verification]] 눈검증 필수. Toast 컴포넌트(260721)에서 실제 발생·수정. 향후 Animated 쓰는 신규 컴포넌트(스낵바·시트 슬라이드·스켈레톤 등) 모두 동일 패턴 적용.

**★값 0 인 transform 클래스는 CSS 를 안 낸다 (260913 · W2 작업대 · 커밋 58e102f6)** — `className="translate-x-0"` 을 넣어도 계산 스타일 `transform` 이 `none` 으로 남았다(값이 0이라 변환이 생성되지 않는다). `position: fixed` 자식을 가두려고 containing block 을 만들 때 이 클래스는 **효과가 0**이다. 되는 것 = `style={{ transform: [{ translateX: 0 }] }}` (RN Web 이 `translateX(0px)` 를 실제로 낸다 → fixed 기준이 그 조상이 된다).
- **Why:** 클래스 한 줄로 될 거라 가정했다가 실측(fixed 요소마다 기준이 창인지 조상인지 `getComputedStyle` 로 쟀다)에서 창 기준 그대로인 걸 보고서야 알았다. 눈으로는 「조금 바뀐 것 같다」로 속기 쉽다.
- **How to apply:** NativeWind 클래스가 **레이아웃 부수효과**(containing block·stacking context)를 위한 것이면 붙이고 끝내지 말고 **계산 스타일을 잰다**. ⚠ RN `Modal` 은 body 로 포털되어 transform 조상으로도 **안 갇힌다**(작업대 시트는 본문만 올린다). ⚠ 틀에 같이 건 `overflow-hidden` 이 그림자·툴팁을 자를 수 있다.
