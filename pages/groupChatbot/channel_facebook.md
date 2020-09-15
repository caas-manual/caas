---
title: Facebook
tags: [channel,advanced]
keywords: Basic Conversation
summary:  간단한 설정으로 Facebook에 연결할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: channel_facebook.html
folder: groupChatbot
previous: {
    title: Native App(API),
    url: channel_native_app.html
}
next: {
    title: Kakaotalk,
    url: channel_kakaotalk.html
}
---

## Facebook 챗봇 생성
공통 챗봇챗봇서비스를 Facebook 메신저에 연계하는 방법을 설명합니다. 사용자가 페이스북 페이지에 방문하여 메시지를 보내면 챗봇과 대화하게 됩니다.
<br/>

#### Facebook 계정 생성
Facebook 계정이 있어야 페이지와 챗봇을 생성할 수 있습니다.<br/>
<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>
[Facebook 계정 생성하러 가기](https://www.facebook.com/r.php)</span>
<br/>
<br/>

#### Facebook 페이지 개설
생성한 계정으로 로그인 한 뒤 아래 링크에서 페이지를 개설합니다.<br/>
<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>
[Facebook 페이지 개설하러 가기](https://facebook.com/pages/create)</span>
<br/>

페이지 이름과 카테고리를 선택하면 페이지를 만들 수 있습니다.
{% include image.html file="channel/facebook/01_facebook_page.png" max-width="900" caption="페이스북 페이지 개설" %}
<br/>

#### Facebook 앱 생성
페이스북 페이지를 만들었다면 메신저 앱을 생성해야합니다. 아래 링크에 접속하여 Facebook 계정으로 로그인 후 우측 상단의 내앱 > 새 앱 추가 버튼을 클릭합니다. <br/>
<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>
[Facebook for develop 바로가기](https://developers.facebook.com/)</span>

메신저 앱을 만들어야하므로 '비즈니스 통합 관리'를 선택합니다.
{% include image.html file="channel/facebook/02_facebook_new_app.png" max-width="500" caption="페이스북 새 앱 생성1" %} 
<br/>

앱 이름을 설정하면 앱이 생성됩니다.
{% include image.html file="channel/facebook/03_facebook_app.JPG" max-width="500" caption="페이스북 새 앱 생성2" %} 
<br/>

앱에 Messenger 플랫폼을 추가하기 위해 '설정'버튼을 클릭합니다.
{% include image.html file="channel/facebook/04_facebook_product.png" max-width="900" caption="페이스북 메신저 앱 추가" %} 
<br/>

[액세스 토큰]탭에서 메신저를 운영하기 위해 만들어둔 페이스북 페이지를 추가합니다.
{% include image.html file="channel/facebook/05_facebook_page_setting.JPG" max-width="900" caption="페이스북 페이지 연결" %} 
<br/>

페이지를 추가하고나면 아래와 같은 화면이 나타나는데, '토큰 생성'버튼을 눌러 토큰을 발급한 후 해당 **엑세스 토큰**을 추후 공통 챗봇 챗봇 서비스에서 채널 연결 설정에 사용되므로 기록해둡니다.
{% include image.html file="channel/facebook/06_facebook_token.png" max-width="900" caption="페이스북 페이지 연결" %}
<br/>
<br/>


## 공통 챗봇서비스와 Facebook 채널 연동
지금까지 만든 페이스북 메신저 챗봇을 공통 챗봇서비스와 연동하는 방법을 설명합니다. 페이스북 메신저 응답을 공통 챗봇에서 설정한 chatflow와 연동하기 위해서 공통 챗봇에서 채널 연계 설정을 먼저 한 후에 다시 Facebok for developers로 돌아가 webhook 설정을 해야합니다.

#### 공통 챗봇에서 채널 연계 설정하기
지금까지 페이스북에서 운영할 채널과 챗봇 생성과 설정을 완료하였고, 이제 공통 챗봇과 연결해야합니다.
{% include callout.html content="화면 위치 : [Settings] > [Chatbot Info.] > [Channel] " type="default" %}

공통 챗봇에서 사용하는 챗봇을 페이스북과 연결하기 위해서는 공통 챗봇 챗봇 서비스에서 Facebook 채널 연결을 설정하고 저장합니다. 
이때 **콜백 URL**은 자동 생성되고, **확인 토큰**은 webhook 인증 시에 사용할 검증 토큰으로 Chatbot 개발자가 임의로 특정 단어를 입력합니다. 이 콜백 URL과 확인 토큰은 추후 공통 챗봇에서 채널 연결 설정 시 필요한 값이므로 따로 기록해둡니다. 페이지 **엑세스 토큰**은 위에서 Facebook 앱에서 페이지 연결 시 발급받았던 액세스 토큰을 기입합니다.
{% include image.html file="channel/facebook/09_chatbot_info_channel_facebook.png" max-width="900" caption="Facebook Messenger 연결 설정" %}
<br/>

#### Facebook Webhook 설정
Facebook 채널과 연동을 마무리하려면 다시 Facebook for developer 페이지로 돌아와 설정을 마무리해야합니다. 
[Webhooks]탭에서 **콜백 URL** 및 **확인 토큰**을 추가합니다. <br/>
 - 콜백URL : **[공통챗봇에서 자동 생성된 콜백 URL]**
 - 확인 토큰 : **[공통챗봇에서 입력한 확인 토큰]**
{% include image.html file="channel/facebook/10_facebook_webhook_setting.png" max-width="900" caption="Facebook Webhook설정" %}
<br/>

#### Facebook 앱 받아보기 설정
앱 하단의 [받아보기 추가] 버튼을 클릭하여 해당 페이지에서 사용할 Webhook 이벤트를 설정합니다. 
- 받아보기 필드 : messages, messaging_postbacks
{% include image.html file="channel/facebook/11_facebook_event.png" max-width="900" caption="Facebook Event 설정" %}
<br/>

#### Facebook 앱 공개
앱이 비공개일 경우 해당 앱에 역할이 부여된 계정만 해당 페이지 검색이 가능하므로, 모든 사람이 해당 챗봇을 사용할 수 있도록 만들기 위해서는 앱을 공개해야 합니다. 앱 공개를 위해서는 Facebook for developers 페이지에서 [설정] > [기본설정]에서 다음 정보를 반드시 입력해야합니다.
 - 개인정보처리방침 URL
 - 앱아이콘 : Facebook Messenger에서 대화시 노출되는 프로필 사진
 - 카테고리 설정
{% include image.html file="channel/facebook/12_facebook_basic_setting.png" max-width="900" caption="Facebook 앱 공개 설정" %}
<br/>

#### 메신저 앱 사용을 위한 검수 요청	
메신저 사용을 위한 검수 사항 제출기본 설정 항목을 모두 입력했다면 Facebook for developers 페이지에서 [앱 검수] > [요청]에서 pages_messaging 우측 [요청] 버튼을 클릭하면 검수 요청이 완료됩니다.
{% include image.html file="channel/facebook/13_facebook_auth.png" max-width="900" caption="Facebook 앱 검수 요청" %}
<br/>

#### 검수 승인 후 앱 공개 설정	
앱 검수가 완료되면 모듈 사용자가 해당 앱을 사용할 수 있게되며 상단의 앱ID옆의 [개발중] 토글버튼을 클릭하여 [라이브됨]으로 변경하면 앱이 공개되어 사람들이 챗봇을 사용할 수 있습니다.
<br/>
<br/>

## 제약사항
Facebook Messenger 챗봇 서비스를 이용하는데 있어 제약사항을 알려드립니다.
아래 내용을 참고하시어 챗봇 Intent를 설계하시기 바랍니다.
<br/>

#### Speak Node

| 답변유형 | 응답유형1 | 응답유형2 | 제약사항 |
|--------|--------|--------|--------|
| Chatflow | Basic | Text | 텍스트는 필수값 |
|  |  | Button | 텍스트나 이미지 없이 버튼만 생성 불가 |
|  |  |  | 버튼 최대 3개 |
|  |  |  | 버튼명 20자 미만 |
|  |  |  | 버튼유형 Text, Web Link, Intent 호출, 전화걸기만 지원 |
|  |  | Quick reply | 최대 13개 |
|  |  |  | Quick reply유형 Text, Intent 호출, 전화걸기만 지원 |
|  |  |  | Text 20자 미만 |
|  | Carousel | Card | Card내 Title 필수(Title없을 시 해당 응답 지원하지 않음) |
|  |  |  | 최대 10개 |
|  | Custom | - | 지원안함 |


#### Slot node
위와 동일
단 Prompt Type이 Carousel인경우, Prompt는 지원하지 않음

<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[기타 페이스북 메신저 응답 타입별 제약사항 확인하기](https://developers.facebook.com/docs/messenger-platform/reference/templates)</span>