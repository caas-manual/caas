---
title: Kakaotalk
tags: [channel,advanced]
keywords: Basic Conversation
summary:  간단한 설정으로 카카오톡에 연결할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: channel_kakaotalk.html
folder: groupChatbot
previous: {
    title: Facebook,
    url: channel_facebook.html
}
next: {
    title: Histroy,
    url: history.html
}
---

## Kakaotalk 챗봇 생성
공통 챗봇 챗봇서비스를 카카오톡 채널에 연계하는 방법을 설명합니다. 
<br/>

#### 카카오톡 계정 생성
카카오 계정이 있어야 채널과 챗봇을 생성할 수 있습니다.
<br/>
<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[카카오톡 계정 생성하러 가기](https://accounts.kakao.com/weblogin/create_account?continue=https://accounts.kakao.com)</span>
<br/>

#### 카카오톡 채널 개설
생성한 계정으로 로그인 한 뒤 아래 링크에서 채널을 개설합니다.<br/>
<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[카카오톡 채널 개설하러 가기](https://center-pf.kakao.com/create)</span>
<br/>

카카오톡채널 관리자 센터에서 개설한 채널의 상세설정 페이지에서 홈URL은 다음 단계 챗봇 신청 시 필요하며,
상세설정 페이지 하단의 공개설정을 변경합니다. (홈 공개 및 검색 허용 모두 ON으로 되어 있어야 합니다.)
<br/>
{% include image.html file="channel/kakao/01_kakao_channel.png" max-width="900" caption="카카오톡 채널 상세설정1" %} 
{% include image.html file="channel/kakao/02_kakao_channel_2.png" max-width="900" caption="카카오톡 채널 상세설정2" %} 
<br/>

#### 카카오 i 오픈 빌더 OBT 신청
'카카오톡 채널 챗봇 만들기'를 하면 로그인한 계정에 최초 한번은 카카오 i 오픈 빌더 OBT를 신청해야 합니다.<br/>
<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[카카오 i 오픈빌더 바로가기](https://i.kakao.com/)</span>
{% include image.html file="channel/kakao/03_kakao_open_builder.png" max-width="900" caption="카카오i오픈빌더 신청" %}  

신청 시 기업명, 카카오톡 채널 홈 URL, 신청사유를 입력하는데 이때 홈 URL은 위의 **카카오톡 채널 상세정보에서 가져온 '홈 URL'** 을 입력합니다.
(신청 후 개설하는데 최소 2~6일 걸리며, 신청 사유를 그럴듯하게 적지 않으면 카카오측에서 해당 챗봇 개설을 반려함)
{% include image.html file="channel/kakao/04_kakao_OBT.JPG" max-width="900" caption="OBT 신청" %} 
<br/>


#### 카카오 i 오픈 빌더 챗봇 생성
채널 개설완료 메일을 받았다면 카카오 i 오픈빌더에서 다시 '카카오톡 채널 챗봇 만들기'를 클릭하여 챗봇을 생성합니다.
{% include image.html file="channel/kakao/05_kakao_chatbot.png" max-width="900" caption="챗봇 생성 1" %} 
{% include image.html file="channel/kakao/06_kakao_chatbot_2.JPG" max-width="900" caption="챗봇 생성 2" %} 
<br/>

[설정]탭에서 위에서 만든 카카오 채널을 선택하여 연결해줍니다.
{% include image.html file="channel/kakao/07_kakao_chatbot_setting.JPG" max-width="900" caption="챗봇에 채널연결" %} 
<br/>
<br/>

## 공통 챗봇서비스와 Kakaotalk 채널 연동
지금까지 만든 카카오톡 챗봇을 공통 챗봇 챗봇서비스와 연동하는 방법을 설명합니다. 

#### 공통 챗봇에서 채널 연계 설정하기
지금까지 카카오톡에서 운영할 채널과 챗봇 생성과 설정을 완료하였고, 이제 공통 챗봇과 연결해야합니다.
{% include callout.html content="화면 위치 : [Settings] > [Chatbot Info.] > [Channel] " type="default" %}
공통 챗봇에서 사용하는 챗봇을 카카오톡과 연결하기 위해서는 공통 챗봇에서 Kakaotalk 채널 연결을 설정하고 저장합니다. 
이때 자동으로 생성된 **앱 URL**은 향후 카카오 i 오픈빌더에서 설정 시 사용하게 되므로 따로 메모해둡니다.
{% include image.html file="channel/kakao/08_kakao_chatbot_info_channel.png" max-width="900" caption="Kakaotalk 연결 설정" %}
<br/>

#### 공통 챗봇 챗플로우 연동
카카오 챗봇 응답을 공통 챗봇에서 설정한 chatflow와 연동하기 위해서는 [스킬]탭에서 먼저 스킬을 생성합니다. URL은 [Setting] > [Chatbot Info.]에서 카카오 채널 연결 설정 시 자동 생성된 앱 URL를 입력하고, 따로 설정할 헤더값은 없습니다. 여기서 챗봇 ID는 카카오톡 챗봇ID가 아니라, 공통 챗봇에 [Setting] > [Chatbot Info.]에 설정되어있는 챗봇ID를 입력합니다.
 - URL : **[공통챗봇에서 자동 생성된 앱URL]**

{% include image.html file="channel/kakao/09_kakao_chatbot_skill.png" max-width="900" caption="스킬 생성" %} 
<br/>

[시나리오]탭에서 폴백 블록에 파라미터 설정 우측에서 방금 만든 스킬을 연결해줍니다. 뿐만 아니라 하단에 응답 추가 쪽에 스킬데이터를 선택해야 합니다.
{% include image.html file="channel/kakao/10_kakao_chatbot_fallback.png" max-width="900" caption="시나리오에 스킬 연결" %} 
<br/>

최초 1회 [배포]탭에서 배포를 진행해야하며, 위 내용 중 변경사항이 생기게 될 경우 다시 배포를 해야 변경사항이 반영됩니다. 
{% include image.html file="channel/kakao/11_kakao_chatbot_dist.JPG" max-width="900" caption="배포" %} 
<br/>
<br/>

## 제약사항
카카오톡 챗봇 서비스를 이용하는데 있어 제약사항을 알려드립니다.<br/>
아래 내용을 참고하시어 챗봇 Intent를 설계하시기 바랍니다.

| 답변유형 | 응답유형1 | 응답유형2 | 제약사항 |
|--------|--------|--------|--------|
| Dialogflow | - | Text | 1000자 미만 |
| Chatflow | Basic | Text | 1000자 미만 |
|  |  |  | 최대 2줄 |
|  |  | Button | 텍스트나 이미지 없이 버튼만 생성 불가 |
|  |  |  | 버튼 최대 3개 |
|  |  |  | 버튼명 최대 8자 |
|  |  |  | 버튼유형 Text, Web Link, Intent 호출, 전화걸기만 지원 |
|  |  | Quick reply | 최대 10개 |
|  |  |  | Quick reply유형 Text, Web Link, Intent 호출, 전화걸기만 지원 |
|  | Carousel | Card | 최대 10개 |
|  | Custom | - | 지원안함 |

<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[기타 카카오 챗봇 응답 타입별 제약사항 확인하기](https://i.kakao.com/docs/skill-response-format#skillpayload)</span>
<br/>
<br/>

{% include important.html content="2020년 9월 1일부터 오픈빌더에 유료화 정책이 적용되어 안내드립니다.<br/>
- 모든 사용자들에게 월별로 활성채팅방 5만 건이 무료로 제공됩니다.<br/>
- 5만 건을 초과하는 경우 건당 30원 또는 40원(지식+BETA 이용시)의 사용요금이 부과됩니다.<br/>
※엔터프라이즈급 파트너사의 경우 별도로 협의 가능 " %}
더 자세한 요금 안내는 우측 링크를 참조하세요.
<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>
[카카오 i 오픈빌더 요금 안내](https://i.kakao.com/login/pricing)</span>