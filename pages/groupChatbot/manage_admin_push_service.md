---
title: Admin Push Service
tags: [manage, basic]
keywords: [관리자 메시지, push, notification]
summary: Chatbot 관리자가 Push 기능을 통하여 고객에게 메시지를 보낼 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: manage_admin_push_service.html
folder: groupChatbot
previous: {
    title: System Alarm, 
    url: manage_alarm.html
}
next: {
    title: 전체 답변 정보 관리,
    url: manage_answers.html
}
---

{% include note.html content="Admin Push Service 메뉴는 Admin 권한을 가진 Chatbot 개발자만 사용할 수 있습니다." %}

Admin Push Service 메뉴는 해당 Chatbot과 실재로 대화하는 고객들에게 Chatbot 개발 관리자가 메시지를 보낼 수 있는 기능을 제공합니다. 단, 아래와 같은 주의 사항이 있습니다.

- 메시지를 받을 수 있는 대상은 Singlex Chatbot Platform에서 제공하는 Chat Front UI를 사용하는 고객에 한정한다. 
- 메시지 전송 건수 당 과금 추가.
- Push Service를 등록한 사용자에 한정하여 제공


## Send
{% include callout.html content="화면 위치 : [Notification] > [Admin Push Service] > Send 탭 선택" type="default" %}

Admin Push Service 메뉴에 들어오면 2개의 탭을 확인할 수 있습니다. 그 중 **Send** 탭에서는 말 그대로 메시지를 작성하여 전송할 수 있습니다.

{% include image.html file="manage/push_01_send_default.png" max-width="900" caption="Admin Push Service Send 탭" %}

### 관리자 알림 메시지 Title

전송할 메시지 작성을 위하여 가장 먼저 Title을 입력합니다. Title은 실제 고객에게 전달되는 정보가 아닌, 알림 메시지 이력에서 관리하는 정보입니다.

### 관리자 알림 메시지 작성

{% include image.html file="manage/push_02_send_message.png" max-width="900" caption="Admin Push Service 메시지 작성 영역" %}

메시지를 작성하는 영역은 Chatbot을 만들어 보았다면 익숙하게 보일 겁니다. 메시지 작성 폼은 Chatflow형 intent에서 답변을 정의할 때 사용되는 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[**Speak Node**](intent_response_chatflow_speak.html)</span>와 동일한 형태입니다. Speak Node에 정의할 수 있는 형태와 같은 메시지를 보낼 수 있습니다. 다만, Speak Node와 아래와 같은 차이점이 존재합니다.

- 메시지는 한번에 최대 3개로 나누어 전송할 수 있습니다. [Message 추가] 버튼을 통해 메시지 Bubble을 추가합니다.
- Parameter를 활용한 답변은 구성할 수 없습니다.
- Quick Reply 형태의 버튼은 제공하지 않습니다.


### Message 불러오기

{% include image.html file="manage/push_03_send_load_message.png" max-width="900" caption="Admin Push Service 메시지 불러오기" %}

이미 보낸 메시지가 있다면 Message 불러오기 버튼을 통하여 다시 내용을 불러올 수 있습니다. [Message 불러오기] 버튼 선택하면 History 탭이 활성화 되며 불러오기 버튼을 확인할 수 있습니다. 선택을 원하는 메시지의 불러오기 버튼을 클릭하면 내용이 복사됩니다.

### 임시저장

메시지를 작성하고 하단 임시저장 버튼을 선택할 경우 메시지가 임시 저장됩니다. 다시 본 메뉴에 접근했을 때 가장 최근에 임시 저장한 메시지를 자동으로 불러옵니다.

### 전송

{% include image.html file="manage/push_04_send_popup.png" max-width="900" caption="Admin Push Service 메시지 전송 Popup" %}

메시지 작성 완료 후 전송 버튼을 클릭하면 작성한 메시지를 미리볼 수 있는 preview와 함께 서비스 인증키를 입력하는 Popup이 뜹니다. 서비스 인증키는 **AI 서비스 포탈**의 **[계약정보] - [계약정보 상세]**에서 확인할 수 있습니다. 

{% include image.html file="manage/push_05_service_auth_key.png" max-width="900" caption="AI 서비스포탈 서비스 인증키 확인" %}

해당 챗봇과 계약된 정보의 서비스 인증키를 정확하게 입력하지 않으면 메시지를 전송할 수 없습니다. 최종적으로 전송 버튼을 클릭하면 Chat Front UI를 사용중인 고객에게 메시지가 전송됨을 확인할 수 있습니다.

## History
{% include callout.html content="화면 위치 : [Notification] > [Alarm] > History 탭 선택" type="default" %}

History 탭에서는 관리자 알림 메시지 전송 이력을 확인할 수 있습니다. 

{% include image.html file="manage/push_06_history_default.png" max-width="900" caption="Admin Push Service History 탭" %}

수정일자, 전송상태, 메시지명을 기준으로 검색할 수 있으며 목록을 클릭하면 상세 내용을 확인할 수 있습니다. 만약 전송 실패가 발생할 경우 실패 이유에 대한 Message도 목록 클릭 시 보이는 상세 영역에서 확인할 수 있습니다.

{% include image.html file="manage/push_07_history_detail.png" max-width="900" caption="Admin Push Service History 상세 정보" %}
