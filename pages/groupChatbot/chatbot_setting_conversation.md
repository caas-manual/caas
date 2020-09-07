---
title: Conversation
tags: [settings, basic]
keywords: Conversation Setting
summary: Chatbot의 Conversation 정보 설정 방법을 알아봅니다.
sidebar: chatbot_doc_sidebar
permalink: chatbot_setting_conversation.html
folder: groupChatbot
previous: {
    title: Language, 
    url: chatbot_setting_language.html
}
next: {
    title: Fulfillment,
    url: chatbot_setting_fulfillment.html
}
---

## Conversation 정보 변경
 {% include callout.html content="화면 위치 : [Settings] > [Chatbot Info.] > Conversation 탭 선택" type="default" %}

Conversation 탭에서는 Chatbot과 대화할 때 필요한 다음과 같은 내용을 설정할 수 있습니다.<br/>
 - [Classification Threshold](chatbot_setting_conversation.html#classification-threshold)
 - [감정분석](chatbot_setting_conversation.html#감정분석)

### Classification Threshold
Classification Threshold는 대화를 분류하는 임계값입니다. 0에서 1사이의 값을 가질 수 있으며 추론 결과의 정확도가 해당 값 이하로 분석될 시에는 Default Fallback으로 인식하게끔 설정하는 역할을 합니다.
{% include note.html content="Classification Threshold는 Chatbot 생성 시 기본 0.3으로 저장됩니다." %}

{% include image.html file="chatbot_info\15_chatbot_info_conversation_classification.png" max-width="900" caption="Classification Threshold 설정" %}


### 감정분석
감정분석 설정은 Chatbot의 **서비스 형태가 운영**일 경우에만 가능합니다. <br/>
해당 기능은 감정분석 사용 여부를 선택하고 임계값을 이용하여 긍정/중립/부정을 판단하는 기준을 세울 수 있습니다. 중립 구간은 -1에서 1사이로 설정 가능한데 -1에 가까울수록 부정, 1에 가까울수록 긍정에 가깝습니다.

{% include note.html content="감정분석 중립 구간은 Chatbot 생성 시 기본 -0.2 ~ 0.2로 저장됩니다." %}

{% include image.html file="chatbot_info\16_chatbot_info_conversation_sentiment.png" max-width="900" caption="감정 분석 설정" %}
