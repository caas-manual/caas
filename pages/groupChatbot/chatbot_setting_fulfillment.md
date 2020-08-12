---
title: Fulfillment
tags: [settings, basic]
keywords: Fulfillment Setting
summary: Chatbot의 Fulfillment 정보 설정 방법을 알아봅니다.
sidebar: chatbot_doc_sidebar
permalink: chatbot_setting_fulfillment.html
folder: groupChatbot
previous: {
    title: Conversation, 
    url: chatbot_setting_conversation.html
}
next: {
    title: Simulator,
    url: test_simulator.html
}
---

## Fulfillment 정보 변경

기본적으로 Chatbot은 Intent에 등록된 문장들로 응답하는데 fulfillment를 사용하여 보다 동적인 응답을 제공할 수 있습니다. 예를 들어 사용자가 금요일에 영화를 예약하려는 경우 서비스가 DB를 확인하여 사용자에게 금요일 예약 가능 여부에 대한 정보를 응답할 수 있습니다. 

### Fulfillment 정보 저장
 {% include callout.html content="화면 위치 : [Settings] > [Chatbot Info.] > Fulfillment 탭 선택" type="default" %}

동적으로 호출할 서비스의 url, 인증 정보, 헤더 정보 등을 입력 후 저장합니다.

{% include image.html file="chatbot_info\17_chatbot_info_fulfillment.png" max-width="900" caption="Chatbot Info Fulfillment 저장" %}

### Intent의 fulfillment 사용 설정
 {% include callout.html content="화면 위치 : [Intents] > Intent명 선택" type="default" %}

각 Intent에는 fulfillment를 사용하기 위한 설정이 있습니다. Intent에 시스템 작업이나 동적인 응답이 필요한 경우엔 Intent에 fulfillment 사용 설정을 해야합니다. Fulfillment 사용 설정되지 않았다면 Responses에 저장된 문장 중에 하나를 답합니다. 

{% include image.html file="chatbot_info\18_chatbot_info_fulfillment_in_intent.png" max-width="900" caption="Intent에서 Fulfillment 사용" %}