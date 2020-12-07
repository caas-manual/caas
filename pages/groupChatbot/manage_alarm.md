---
title: Alarm
tags: [settings, basic]
keywords: Conversation Setting
summary: Chatbot 개발자나 Admin에게 보낼 알림을 설정하는 페이지입니다.
sidebar: chatbot_doc_sidebar
permalink: manage_alarm.html
folder: groupChatbot
previous: {
    title: Dashboard, 
    url: manage_dashboard.html
}
next: {
    title: 사용자 관리,
    url: manage_user_roles.html
}
---

## Settings
 {% include callout.html content="화면 위치 : [Settings] > [Alarm] > Settings 탭 선택" type="default" %}

Alarm 메뉴의 Settings 탭 화면 접근은 **Admin** 권한을 가진 Chatbot 개발자만 가능합니다.<br/>
Settings 탭에서는 알림 수신 여부와 어떤 조건에서 알림을 전송할지를 정할 수 있고 알림을 수신할 대상자를 설정할 수 있습니다. 

### 알림 설정
챗봇의 알림을 설정하고 싶으면 토글 버튼을 클릭하여 상태를 ON으로 변경합니다.
{% include image.html file="alarm\01_alarm_settings_settings_toggle.PNG" max-width="900" caption="알림 설정 ON" %}

설정을 ON으로 변경하면 어떤 알림을 받을지를 체크하고 필요한 조건 값을 입력할 수 있습니다.
{% include image.html file="alarm\02_alarm_settings_settings_value.PNG" max-width="900" caption="설정 값/수신 여부 입력" %}


### 수신계정 목록
**계정추가** 버튼을 클릭하면 수신계정 추가 팝업이 오픈되며, 해당 화면에서 원하는 사용자를 추가할 수 있습니다. 

{% include image.html file="alarm\03_alarm_settings_receivers_list.PNG" max-width="900" caption="수신계정 목록" %}
{% include image.html file="alarm\04_alarm_settings_receivers_popup.PNG" max-width="900" caption="수신계정 추가 팝업" %}

수신계정 삭제를 원하는 경우 삭제할 계정 체크 후 **계정삭제** 버튼을 클릭합니다.
{% include image.html file="alarm\05_alarm_settings_receivers_delete.PNG" max-width="900" caption="수신계정 삭제" %}

## History
 {% include callout.html content="화면 위치 : [Settings] > [Alarm] > History 탭 선택" type="default" %}

Alarm 메뉴의 History 탭 화면 접근은 **Admin** 권한을 가진 Chatbot 개발자만 가능합니다.<br/>
History 탭에서는 최근 30일간 알림 발송 건수를 확인할 수 있습니다. 

### 최근 30일간 알림 발송 건수
본 테이블에서는 알림 유형과 알림 발송 시간을 확인할 수 있는데, 이 때 알림 유형은 Settings 탭의 알림 설정 하위의 알림 유형을 말합니다.
{% include image.html file="alarm\06_alarm_history.PNG" max-width="900" caption="최근 30일간 알림 발송 건수" %}


