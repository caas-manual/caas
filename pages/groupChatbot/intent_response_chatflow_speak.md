---
title: Speak Node
tags: [intent, chatflow, basic]
keywords: [intent, chatflow, basic, 챗플로우, 노드, Node, Speak, 답변]
summary: Speak Node를 사용하여 다양한 답변을 구성할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: intent_response_chatflow_speak.html
folder: groupChatbot
previous: {
    title: Listen Node,
    url: intent_response_chatflow_listen.html
}
next: {
    title: Slot Node,
    url: intent_response_chatflow_slot.html
}
---

## Speak Node 란?

**Speak Node**란 사용자의 발화에 대한 **챗봇의 답변을 구성**하는 Node 입니다. 일반적인 Text부터 이미지, 버튼, 카드까지 다양한 형태를 손쉽게 구성할 수 있도록 지원하고 있습니다.

## Speak Node Popup

{% include image.html file="chatflow/node_speak/01_chatflow_speak_node_init.png" max-width="900" caption="Speak Node popup" %}

### 답변 추가하기

Speak Node는 답변을 추가할 수 있는 버튼이 존재하며 각 답변을 **Response Panel**이라고 명명합니다. Response Panel마다 Response Type을 결정할 수 있습니다. 가장 기본은 Basic으로 설정되어 있습니다. Popup 우측 상단 [Response 추가] 버튼을 클릭하면 새로운 Basic Type의 Response Panel이 추가됩니다.<br/>
Speak Node에 구성하는 모든 Response Panel은 한 번에 반환되며 Response Panel 하나가 사용자가 받는 메시지 하나라고 생각하면 됩니다. 즉, Response Panel을 3개 추가했다면 사용자는 3개의 메시지로 구성된 답변을 한꺼번에 받게 됩니다.<br/>

{% include image.html file="chatflow/node_speak/02_chatflow_speak_node_basic_response.png" max-width="900" caption="Speak Node Response 1개(상) / 2개(하)" %}

우측 상단 <button class="btn btn-default" disabled style="padding: 2px 5px 0px; margin: 0px; cursor: default;">{% include inline_image.html file="chatflow/icon/lg-chatflow-more.svg" width=15 %}</button> 버튼을 클릭하시면 Response Panel 끼리의 순서를 변경할 수 있습니다. 여러 개의 답변을 구성할 시에 답변은 Response Panel과 동일한 순서로 나갑니다.

<div markdown="span" class="alert alert-success" role="alert"><i class="fa fa-check-square-o"></i> <b>Tip:</b>
모든 <button class="btn btn-default" disabled style="padding: 2px 5px 0px; margin: 0px; cursor: default;">{% include inline_image.html file="chatflow/icon/lg-chatflow-more.svg" width=15 %}</button> 형태의 버튼은 기본적으로 순서를 변경하는 기능을 합니다.
</div>


### Speak Node 답변 Type

Speak Node에서는 기본적으로 텍스트, 이미지, 버튼, 카드 컴포넌트들을 이용해 답변을 구성할 수 있도록 제공하고 있습니다. 그 외에 개발 채널에 의존적인 메시지 정보는 Custom Payload를 이용하실 수 있습니다. Response Type 별로 자세히 확인해보겠습니다.

#### Basic

**Basic Type**은 가장 기본적인 메시지 형태로 텍스트, 이미지, 버튼을 이용해 구성할 수 있습니다. 채널별 제약사항이 없다면 특정 요소 1개만 있어도 메시지를 구성할 수 있습니다.

{% include image.html file="chatflow/node_speak/03_chatflow_speak_node_basic_response_complex.png" max-width="900" caption="Speak Node Response Type - Basic" %}

##### 텍스트 / 이미지 답변 만들기

가장 기본적인 답변 형태로, 텍스트를 작성하고 이미지 영역에 이미지 URL을 입력하면 텍스트와 이미지로 만들어진 답변을 구성할 수 있습니다. 텍스트만 작성하거나 이미지 URL만 넣을 수도 있습니다. 추가적으로 텍스트와 이미지 URL 입력 Table 최우측 최우측의 [+]버튼을 클릭하면 텍스트와 이미지 입력 행을 추가할 수 있습니다. 만약 하나의 Response Panel 내에 여러 행의 텍스트와 이미지 URL을 구성한다면 이 중 1개를 Random으로 골라 답변으로 내보냅니다. 이를 활용하면 단순히 같은 답변만 내뱉는 봇과의 대화에 비해 훨씬 자연스러운 대화를 만들 수 있습니다.

{% include image.html file="chatflow/node_speak/04_chatflow_speak_node_basic_response_random.png" max-width="900" caption="Speak Node Response Type - Basic Random 답변 구성" %}

##### 버튼 만들기

텍스트와 이미지 입력 영역 하단, 버튼 정보를 입력하는 영역이 있습니다. 선택 또는 입력해야할 버튼의 정보는 총 3가지 입니다.

| 구분 | 설명 |
|------|-----|
| Button Type | 버튼의 종류를 선택합니다. Text, Web Link 등이 존재하며 Type에 따라 버튼의 동작이 달라집니다.<br/>자세한 내용은 하단 표를 참고하세요. |
| Button Name | 사용자가 확인 가능한 버튼명. 사용자 친화적으로 작성하는 것이 좋습니다. |
| Value | System에 실제로 전달되는 값. 버튼 Type에 따라 입력해야 하는 값이 다르며 Text의 경우 일반적으로 버튼명과 동일합니다. |

버튼의 종류에 따라 어떤 역할을 하는지 알아보겠습니다.

| Type | 설명 |
|------|-----|
| Text | 일반적인 선택지입니다. Value에는 일반 텍스트가 들어갑니다. Value에 값을 입력하지 않으면 Button Name과 동일한 값이 자동으로 들어갑니다. |
| Web Link | 웹을 연결할 때 사용합니다. Value에 연결할 웹 URL를 입력해주세요. |
| Intent 호출 | 다른 Intent를 직접적으로 호출합니다. 호출 가능한 Intent 목록 중 하나를 선택하게 됩니다. 이때, Intent는 최상위 레벨만 선택할 수 있습니다. |
| 내부 App Link | 모바일에서 내부 App을 연결할 때 사용합니다. Kakaotalk, Facebook 같은 일반적인 메신저에서는 사용할 수 없습니다. |
| 외부 App Link | 모바일에서 외부 App을 연결할 때 사용합니다. Kakaotalk, Facebook 같은 일반적인 메신저에서는 사용할 수 없습니다. |
| 전화걸기 | 일반적으로 모바일 폰에서 바로 전화를 연결합니다. 채널 종류에 따라 사용 불가능할 수 있습니다. Value에 전화를 걸 번호를 입력해주세요. |

{% include note.html content="위 버튼 Type은 모든 버튼형(일반 버튼, 카드 버튼, Quick Reply)에서 동일하게 적용됩니다." %}

우측 [+] 버튼을 선택할 경우 버튼을 추가할 수 있으며 일반 버튼은 최대 20개까지 추가가 가능합니다. [Intent 호출](intent_response_chatflow_speak.html#intent-호출에-활용하기)에 관해서는 Parameter와 연관지어 아래서 다루도록 하겠습니다.

#### Carousel

**Carousel Type**을 선택하면 카드형의 답변을 구성할 수 있습니다. 카드 하나에 이미지 URL, 카드 Title, 추가 설명 영역인 Sub Title, 버튼을 구성할 수 있으며 우측 [카드 추가] 버튼을 클릭하면 카드를 추가할 수 있습니다. 카드 당 버튼 개수는 동일하게 구성됩니다. 버튼을 제외한 모든 영역은 필수가 아닙니다.

{% include image.html file="chatflow/node_speak/05_chatflow_speak_node_basic_response_carousel.png" max-width="900" caption="Speak Node Response Type - Carousel" %}

#### Custom Payload

**Custom Payload Type**에는 채널에 의존적인 사용자 정의 정보를 담을 수 있습니다. 편의를 위하여 일반적으로 많이 사용하는 데이터 형태인 JSON, XML, HTML, Text 에디터를 사용할 수 있도록 지원하고 있습니다. Custom Payload는 사용자 정의 정보이므로, CAAS 내 Simulator에서는 정상적인 형태로 확인할 수 없습니다. 해당 정보가 정상적으로 도착했는 지 정도만 확인할 수 있습니다.

{% include image.html file="chatflow/node_speak/06_chatflow_speak_node_basic_response_custom.png" max-width="900" caption="Speak Node Response Type - Custom" %}

#### Quick Replies

**Quick Reply**란, 답변 메시지 최하단 또는 입력창 상단에 작은 추가되어 빠르게 클릭할 수 있는 버튼입니다. 일반적으로 클릭하거나 다음 메시지가 오면 사라지기 때문에 정상적인 사용을 위해서는 무조건 제일 마지막에 위치해야 합니다. 그렇기 때문에 Speak Node 상세 Popup 내에서도 항상 제일 마지막 Response Panel 아래 붙어서 설정할 수 있습니다.

{% include image.html file="chatflow/node_speak/07_chatflow_speak_node_basic_response_quick.png" max-width="900" caption="Speak Node Response - Quick Replies" %}

### UI컴포넌트 별 제약사항

하나의 Speak Node에서 설정할 수 있는 각 요소들은 최대 개수 존재합니다.

- Node 당 **Response Panel** 최대 **10개**
- Panel 당 **텍스트 / 이미지 Set** 최대 **50개**
- Panel 당 **버튼, Quick Reply** 최대 **20개**
- Panel 당 **카드** 최대 **10개**
- **카드 당 버튼** 최대 **10개**


## Parameter 사용하기

**Parameter**는 정보를 담는 껍데기 입니다. 여기에서는 Parameter에 담긴 정보를 어떻게 사용할 수 있는 지 안내합니다. Speak Node에서 Parameter를 사용하는 방법은 크게 2가지로 구분할 수 있습니다.

- Parameter에 담긴 값 표시
- Intent 호출 버튼에서 Parameter 연결

### 답변 구성에 Parameter 값 활용하기

Intent Parameter와 Chatflow Parameter 모두 `Value` 라는 영역을 확인할 수 있습니다. 이 Value라는 것은 Parameter 내에 실제로 들어있는 정보를 어떤 형태로 써서 가져올 수 있는지를 나타낸 영역입니다. Value 형태는 기본적으로 Intent Parameter와 Chatflow Parameter 모두 Parameter명 앞에 **$**를 붙여서 사용합니다.

- Value 기본 규칙 : $ParameterName

단, Chatflow Parameter에서 Parameter명에 한글이 들어간 경우 경계를 명확히 해줄 필요가 있으므로 중괄호({})로 Parameter명을 묶어서 사용해야 합니다.

- 한글 Parameter명 Value : ${파라미터명}

#### 텍스트에 Parameter Value 활용하기

기본적으로 각종 입력란에 Parameter Value를 사용할 수 있습니다. 사용 용이성을 위해 Parameter를 사용할 수 있는 각종 입력란에 '$'를 입력하면 현재 사용 가능한 Parameter 목록을 확인할 수 있으며 추가하고자 하는 Parameter를 선택하면 자동으로 Parameter Value가 추가됩니다. $ 뒤에 추가로 키보드가 입력되면 해당 값으로 Parameter 목록을 필터링해서 보여줍니다. 

{% include image.html file="chatflow/node_speak/08_chatflow_speak_node_parameter_add.png" max-width="900" caption="Speak Node Response - Parameter 추가 Dropdown" %}

이렇게 Parameter Value 형태로 입력하면 실제 사용자가 받는 답변은 해당 Parameter에 담긴 정보로 치환되어 보여지게 됩니다.

{% include image.html file="chatflow/node_speak/09_chatflow_speak_node_parameter_value_change.png" max-width="900" caption="Speak Node Response - Parameter 치환" %}

#### 동적 답변 만들기

Parameter를 활용하면 단순 텍스트를 동적으로 만들 수도 있지만 버튼, 카드 등에 사용하게 되면 답변 컴포넌트 자체를 동적으로 구성할 수도 있습니다. 예를 들어 맛집을 추천해는 대화를 구성한다고 가정하겠습니다. 마곡 맛집은 5개까지 보여줄 수 있는데 여의도 맛집은 4개 밖에 보여주지 못한다고 하면 답변을 구성할 때 2가지 방법이 존재합니다.

1. 마곡 맛집 Speak Node와 여의도 맛집 Speak Node를 각각 구성한다.
2. 맛집 리스트를 전부 Parameter에 담아서 사용한다.

1번의 경우 답변이 추가될 때마다 Speak Node를 새로 만들어야 합니다. 하지만 2번의 경우 최대 개수까지만 미리 만들어두면 하나의 Speak Node로도 여러 답변을 커버할 수 있습니다. 상황에 따라 Parameter에 정보가 존재하지 않을 경우 해당 컴포넌트는 최종적으로 사용자에게 보이지 않기 때문입니다.

{% include image.html file="chatflow/node_speak/10_chatflow_speak_node_dynamic_response.png" max-width="900" caption="Speak Node Response - 동적 답변 구성" %}

### Intent 호출에 활용하기

Parameter의 또다른 활용은 대화 흐름간 정보 전달입니다. Speak Node에서 대표적으로 사용하는 방법이 Intent 호출 버튼에서 Parameter를 연결해주는 것입니다.

#### Intent 호출 버튼 알기

Parameter 활용 방법에 앞서, **Intent 호출 버튼**에 대해 우선적으로 알아보겠습니다. 앞서 버튼 Type에서 설명했던 것처럼 Intent 호출 버튼은 직접적으로 내가 구성한 다른 Intent의 답변을 호출하는 버튼입니다. 명확하게 Intent를 선택하므로 원하지 않는 대화가 만들어질 확률을 대폭 낮출 수 있습니다. 일반적으로 답변에 대한 연관질문, 혹은 자주 묻는 질문 등을 보여줄 때 많이 사용합니다. 

{% include image.html file="chatflow/node_speak/11_chatflow_speak_node_callIntent_param_disable.png" max-width="900" caption="Speak Node Response - Intent 호출 버튼" %}

이것을 버튼 클릭이 아닌 자연스러운 전달을 위해 Node로 만든 것이 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[Jump Node](intent_response_chatflow_jump.html)</span>라고 생각하면 됩니다.

#### Intent 호출 버튼 Parameter 연결

버튼 Type으로 Intent 호출을 선택하고 연결할 Intent를 선택하면 [Parameter 연결] 버튼이 활성화 됩니다. Parameter 연결을 통하여 현재 대화에서 만들어진 정보를 전달할 수 있습니다. 

{% include image.html file="chatflow/node_speak/12_chatflow_speak_node_callIntent_select_intent.png" max-width="900" caption="Intent 호출 버튼 - Intent 선택 및 Parameter 연결 활성화" %}

Parameter 연결 Popup에서 선택한 Intent의 모든 Parameter를 확인할 수 있습니다. 그리고 각 Parameter 마다 직접 값을 입력하거나 현재 Intent의 Parameter를 선택해서 전달할 정보를 구성할 수 있습니다.<br/>

좀 더 쉬운 이해를 위해 예를 들어보겠습니다. 

{% include image.html file="chatflow/node_speak/13_chatflow_speak_node_callIntent_param_connect.png" max-width="900" caption="Intent 호출 버튼 - Parameter 연결 Popup" %}

해당 Chatflow는 무엇을 먹을지 추천해주고 만족하지 못하면 다시 추천해주는 흐름으로 구성되어 있습니다. 메뉴 추천을 다시 해줄까 물었을때, '메뉴 추천 다시' 버튼을 누르면 동일 Chatflow를 다시 실행합니다. 이때, 방금 추천한 메뉴를 제외하기 위해서 현재 추천된 메뉴, 즉 `menu` Parameter의 정보를 `originMenu`라는 Parameter에 담고자 하는 설정입니다.

{% include image.html file="chatflow/node_speak/14_chatflow_speak_node_callIntent_example.png" max-width="900" caption="Intent 호출 Parameter 연결 예시" %}

실제 대화를 살펴보면, '메뉴 추천 다시' 버튼을 눌렀을 때 이전에 추천했던 `오므라이스`를 제외하고 다시 추천해주겠다는 메시지가 보입니다. Simulotor Debug 모드에서 자세한 Parameter 전달 결과값을 확인해보면 정상적으로 정보가 전달되었음을 확인할 수 있습니다. Debug 모드를 확인하는 방법은 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[Simulator](test_simulator.html#debug-모드)</span> 페이지에서 확인해주세요.



