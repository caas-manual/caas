---
title: Intent 답변유형 - Dialogflow
tags: [intent, basic]
keywords: Basic Conversation
summary: Intent를 통하여 입력 문장을 어떤 의도로 분류할 것인가를 설정할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: intent_response_dialogflow.html
folder: groupChatbot
previous: {
    title: Intent 이해하기, 
    url: intent_basic.html
}
next: {
    title: Chatflow 기본,
    url: intent_response_chatflow.html
}
---

## Dialogflow
{% include callout.html content="화면 위치 : [Intents] > Dialogflow Type Intent 선택" type="default" %}

해당 메뉴에서는 다음과 같은 내용을 설정할 수 있습니다.<br/> 
 - [Contexts](intent_response_dialogflow.html#contexts)
 - [Responses](intent_response_dialogflow.html#responses)
 - [Fulfillment](intent_response_dialogflow.html#fulfillment)

### Contexts

**Contexts** 자연어 Context와 비슷합니다. 누가 여러분에게 '그건 오렌지입니다'라고 말할 때 무엇을 가리키는 것인지 알려면 Context가 필요합니다. 마찬가지로 Dialogflow가 이러한 최종 사용자 표현을 처리하려면 Intent를 정확하게 일치시키기 위해 Context가 제공되어야 합니다.

Context를 사용하여 대화의 흐름을 제어할 수 있습니다. 문자열 이름으로 식별되는 입력 및 출력 Context를 설정하여 Intent의 Context를 구성할 수 있습니다. Intent가 일치하면 해당 Intent에 대해 구성된 출력 Context가 활성화됩니다. 활성화된 Context가 있으면 Dialogflow에서는 현재 활성화된 Context에 해당하는 입력 Context로 구성된 Intent를 일치시킬 가능성이 높습니다.

Context 명을 입력할 때에는 다음과 같은 제약사항이 존재합니다.

- 영문, 숫자, - 또는 _만 Context명으로 허용합니다.
- Context명은 영어 대소문자를 구분하지 않습니다.
- API 사용 시에는 모든 Context 명이 소문자를 사용합니다.

{% include image.html file="intent/intent_basic_context.png" max-width="900" caption="Intent Context 입력" %} 

#### 입력 및 출력 Contexts

입력 및 출력 Context는 Intent에 적용됩니다. 이들은 함께 작동하여 대화 흐름을 제어합니다.

- 출력 Context는 활성 Context를 제어합니다. Intent가 일치하면 이 Intent에 구성된 출력 Context가 활성화됩니다.
- 입력 Context는 Intent 일치를 제어합니다. Context가 활성화된 경우 Dialogflow에서는 현재 활성 Context의 하위 집합인 입력 Context로 구성된 Intent가 일치될 가능성이 더 높습니다.

Context를 사용하면 다음을 수행할 수 있습니다.

- Intent 일치 순서를 제어합니다.
- 동일한 학습 문구를 사용하여 Context별 Intent를 만듭니다.

##### 출력 Context

**출력 Context**가 있는 Intent가 일치하면 수집된 매개변수 값은 활성 Context용 매개변수 참조가 있는 임시 스토리지 역할을 할 수 있습니다. Context가 활성 상태인 동안 향후 Intent 일치 중에 이 값에 액세스할 수 있습니다.

##### LifeSpan

각 활성 Context에는 Context가 활성 상태인 동안에 대화 차례 수를 정의하는 수명이 있습니다. 기본 수명은 일반 Intent의 경우 대화 차례 5회이고 **Follow-up Intent**의 경우 대화 차례 2회입니다. 모든 Context의 기본 LifeSpan을 재정의할 수 있습니다. 또한 모든 Context가 활성화된 후 20분이 지나면 만료됩니다. Intent가 이미 활성 상태인 출력 Context와 일치하면 수명 및 만료 타이머가 재설정됩니다.

{% include image.html file="intent/intent_basic_context_2.png" max-width="900" caption="Intent 출력 Context LifeSpan 수정" %} 

##### 입력 Context

Context가 활성화되면 Dialogflow에서는 현재 활성 Context에 해당하는 입력 Context로 구성된 Intent가 일치할 가능성이 더 높습니다. 자세한 Intent 일치 규칙은 다음과 같습니다.

1. 일치하려면 Intent의 입력 Context 목록이 현재 Context 목록의 하위 집합이어야 합니다. 이는 입력 Context가 없는 Intent의 경우에도 마찬가지입니다.
2. 1번 규칙을 충족하는 Intent의 경우 현재 활성 Context 목록과 가장 가깝게 일치하는 입력 Context 목록이 있는 Intent가 일치할 가능성이 더 높습니다.

##### Follow-up Intent

**Follow-up Intent**를 사용하여 Intent 쌍의 Context를 자동으로 설정할 수 있습니다. Follow-up Intent는 연결된 상위 Intent의 하위 요소입니다. Follow-up Intent를 만들면 출력 Context가 자동으로 상위 Intent에 추가되고 동일한 이름의 입력 Context가 Follow-up Intent에 추가됩니다. Follow-up Intent는 상위 Intent가 이전 대화 차례에서 일치된 경우에만 일치합니다. 여러 수준의 중첩된 Follow-up Intent를 만들 수도 있습니다.

아래의 화면과 같이 Intent 목록에서 Intent의 답변 유형이 Dialogflow 형인 Intent만 Follow-up Intent 생성이 가능합니다.해당 Intent 명의 오른쪽에 있는 + 버튼을 클릭해서, Custom / Fallback Follow-up Intent를 생성할 수 있습니다.

{% include image.html file="intent/intent_basic_followup.png" max-width="900" caption="Intent Follow-up Intent 생성" %} 

### Responses

Intent에는 Intent가 일치된 후 응답을 반환할 수 있는 기본 제공 응답 핸들러가 있습니다. 이 기능은 정적 응답만 지원하지만 이러한 응답에서 매개변수 참조를 사용하여 어느 정도 동적으로 만들 수 있습니다. Dialogflow에서는 여러 유형의 응답을 제공할 수 있습니다. 기본 응답 유형은 텍스트 응답입니다. 다른 유형의 응답을 사용할 수 있으며(이미지, 오디오, 합성된 음성 등) 그중 일부는 특정 플랫폼 전용입니다.

Intent에 두 개 이상의 응답 변형을 정의하는 경우 Chabot은 무작위로 응답을 선택합니다. 자연스러운 대화를 할 수 있도록 여러 개의 응답 변형을 추가해야 합니다.

Chatbot을 빌드할 때 각 Intent에 대한 응답 데이터를 제공해야 합니다. API 또는 Fulfillment를 사용하여 Dialogflow와 상호작용하는 경우 두 메서드 모두 동적으로 응답을 생성할 수 있으므로 엄밀히 말하자면 응답 데이터를 제공할 필요는 없습니다. 그러나 테스트를 위해 시뮬레이터를 사용하거나 간단한 응답이 있는 Intent를 정의하려는 경우 응답 데이터를 제공해야 합니다.

일반적으로 Intent 응답은 다른 Intent와 일치하는 표현을 제공하도록 최종 사용자를 유도해야 합니다. 또한 응답은 구체적인 데이터를 제공하도록 최종 사용자를 안내해야 합니다. 

응답 섹션에는 각 플랫폼별 탭에서 각 플랫폼에서만 작동하는 응답을 정의 할 수 있습니다.

응답 섹션 오른쪽 끝부분에 있는 Response 추가 버튼을 클릭하여 새로운 응답을 생성할 수 있습니다. 

아래 화면과 같이 Default 탭에서는 Text Response와 Custom Payload 응답을 지원합니다. 

{% include image.html file="intent/intent_basic_response.png" max-width="900" caption="Intent Response 추가 팝업" %} 

1. Text Response
 - 기본적으로 Text Response는 Text로 응답을 보냅니다.

{% include image.html file="intent/intent_basic_response_2.png" max-width="900" caption="Intent Text Response" %} 

2. Custom Payload
 - Custom Payload는 비표준 고급 응답을 처리합니다. 이러한 Custom Payload는 플랫폼 문서에 정의된 JSON 형식으로 제공됩니다.
 - 올바른 JSON 형식이 아닐 경우에는, 정상적으로 생성, 수정이 불가능합니다.

{% include image.html file="intent/intent_basic_response_3.png" max-width="900" caption="Intent Custom Payload JSON 형식 에러" %} 

### Fulfillment

기본적으로 Chatbot은 정적 응답으로 일치하는 Intent에 응답합니다. 통합 옵션 중 하나를 사용하는 경우 Fulfillment를 사용하여 보다 동적인 응답을 제공할 수 있습니다. Intent에 Fulfillment를 사용 설정하면 Dialogflow는 정의한 서비스를 호출하여 해당 Intent에 응답합니다. 예를 들어 최종 사용자가 금요일에 이발을 예약하려는 경우 서비스가 데이터베이스를 확인하여 최종 사용자에게 금요일의 예약 가능 정보를 응답할 수 있습니다.

각 Intent에는 Fulfillment를 사용하기 위한 설정이 있습니다. Intent에 시스템 작업 또는 동적 응답이 필요한 경우 Intent에 대해 Fulfillment를 사용 설정해야 합니다. Fulfillment가 사용 설정되지 않은 Intent가 일치하는 경우 Dialogflow는 Intent에 대해 정의된 정적 응답을 사용합니다.

Fulfillment가 사용 설정된 Intent가 일치되는 경우 Dialogflow는 일치된 Intent에 대한 정보와 함께 Webhook 서비스에 요청을 보냅니다. 시스템은 필요한 작업을 수행하고 진행 방법에 대한 정보를 포함한 응답을 Dialogflow에 제공할 수 있습니다. 

#### Webhook 서비스

프로덕션 시스템에서 Fulfillment를 사용하려면 Webhook 서비스를 구현하고 배포해야 합니다. Fulfillment를 처리하려면 Webhook 서비스가 이 가이드에 지정된 대로 JSON 요청을 수락하고 JSON 응답을 반환해야 합니다.

{% include image.html file="intent/intent_basic_fulfillment.png" max-width="900" caption="Intent Fulfillment 설정" %} 