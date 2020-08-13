---
title: Slot Node
tags: [intent, chatflow, basic]
keywords: [intent, chatflow, basic, 챗플로우, 노드, Node, Slot,  Parameter, 되묻기, 질문]
summary: Slot Node를 사용하여 사용자에게 질문을 던지고 정보를 얻을 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: intent_response_chatflow_slot.html
folder: groupChatbot
previous: {
    title: Speak Node,
    url: intent_response_chatflow_speak.html
}
next: {
    title: Split Node,
    url: intent_response_chatflow_split.html
}
---

## Slot Node 란?

**Slot Node**란 간단하게 말하면 **질문을 던져서 사용자에게 정보를 얻는** Node입니다.<br/>
예를 들어 커피 주문을 받는다고 가정하겠습니다. 고객이 처음부터 명확하게 '아이스 아메리카노 그란데 사이즈로 한 잔 주세요' 라고 말할 수도 있습니다. 하지만 모든 사람이 어떤 커피를 몇 잔을 시킬 건지, 사이즈는 어떻게 할 건지 완벽한 정보를 주지는 않습니다. 하나라도 정보가 빠지면 정확한 주문을 완성하지 못하기 때문에 우리는 되물어봐야 합니다. 어떤 커피를 주문하시겠어요? 몇 잔 드릴까요? 사이즈는 어떻게 해 드릴까요? 이런 질문을 던지는 것이 Slot Node 입니다.

### Slot Filling의 동작

Slot Node를 정확하게 이해하기 위해서는 기본적인 Slot Filling의 동작에 대해서 정확히 이해해야 합니다.<br/>
Chatbot 기본 상식 페이지에서 용어에 대해 간단히 설명했지만 여기서 조금 더 자세히 알아보겠습니다. **Slot Filling**이라는 용어를 간단하게 해석하면 **슬롯을 채운다**는 의미입니다. Chatbot의 입장에서 **질문을 던져 답을 얻는 행위 자체**를 Slot Filling이라고 말합니다. 이미 채워져 있는 것은 다시 채울 필요가 없고 **비어있는 곳만 채우면 됩니다**. 다음 시나리오를 살펴보겠습니다.

```
[시나리오 01]
고객 : 주문이요.
점원 : 무엇을 주문하시겠어요?
```

커피 주문에는 메뉴, 사이즈, 잔 수에 대한 정보가 필요합니다. *1번 시나리오*에서는 그 어떤 것에 대한 정보도 존재하지 않습니다. 가장 먼저 물어봐야할 대상이 '메뉴'이기 때문에 메뉴에 대해서 물어보게 됩니다. 

```
[시나리오 02]
고객 : "아이스 아메리카노" 주세요.
점원 : 사이즈는 레귤러로 하시겠습니까?
```

그에 반해 *2번 시나리오*에서는 '아이스 아메리카노'라는 메뉴에 대한 정보를 처음부터 인식했습니다. 그렇기 때문에 메뉴를 제외하고 그 다음 필요한 정보인 '사이즈'를 묻습니다. 

```
[시나리오 03]
고객 : 주문이요.
점원 : 무엇을 주문하시겠어요?
고객 : 치킨 샌드위치요
점원 : 저희 매장에는 치킨 샌드위치가 없어요. 무엇을 주문하시겠어요?
```
*3번 시나리오*는 질문을 했을 때 원하는 정보가 돌아오지 않은 상황입니다. 준비된 메뉴에 '치킨 샌드위치'가 없기 때문에 다시 메뉴를 물어보게 됩니다.<br/>
<br/>
Slot Node도 이와 동일하게 동작합니다. 원하는 정보가 다 채워져 있다면 Slot Node에 질문을 설정해두더라도 되묻지 않습니다. 만약 질문을 했을 때 정보를 채우지 못했다면 같은 질문을 되물어보게 됩니다. 모든 필요 정보를 얻었을 때에만 Slot Node를 넘어갈 수 있습니다.

{% include image.html file="chatflow/node_slot/01_chatflow_slot_node_example.png" max-width="900" caption="Slot Node 동작 확인" %}

### Parameter와 Entity

Slot Filling의 핵심은 필요한 정보를 얻기 위해 **질문을 하고 그 답을 얻는 것**입니다. 그렇다면 정보가 부족하다는 것을 판단할 대상이 필요합니다. 또한 원하는 정보를 얻었음을 인식해야 합니다. 이때 대상이 되는 것이 바로 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>**[Parameter](intent_basic.html#parameter)**</span> 입니다. Parameter는 **정보를 담아두기 위한 슬롯** 역할을 함과 동시에 어떤 정보를 담을 것인지 표현과 범위를 표시합니다. Parameter를 추가할 때 선택하는 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>**[Entity](entity_basic.html)**</span>가 **정보의 범위와 표현**을 의미합니다. 그렇기 때문에 Intent에 등록된 Parameter가 존재하지 않으면 Slot Node는 사용할 수 없습니다. 

{% include image.html file="chatflow/node_slot/02_chatflow_slot_node_no_parameter.png" max-width="900" caption="Slot Node Popup - Intent Parameter가 존재하지 않을 때" %}

{% include tip.html content="개발자가 이해하기 쉬운 표현으로 말하면, Parameter는 변수이고 Entity는 그 Parameter의 Type입니다." %}


시나리오02 와 함께 더 자세히 알아보겠습니다.

```
[시나리오 02]
고객 : "아이스 아메리카노" 주세요.
점원 : 사이즈는 레귤러로 하시겠습니까?
고객 : 큰 걸로 주세요
```

질문을 던지면 고객은 답을 합니다. 시나리오에서 고객은 '큰 걸로 주세요'라고 답했습니다. 하지만 이 외에도 '큰 사이즈', '라지 사이즈요', 'L' 등의 다양한 표현으로 답을 할 수 있습니다. 이 답에서 '라지' 라는 사이즈를 얻기 위해서 Chatbot은 사이즈의 표현과 범위를 알고 있어야 합니다. 이것을 Chatbot 용어로 표현해보겠습니다. Chatbot에는 'L,라지,빅,큰,Large,Big'을 L'로 정의한 'Size'라는 Entity가 존재하며 Intent에는 'Size'를 Entity로 설정한 'size'라는 Parameter가 등록되어 있습니다. Chatflow Slot Node에서 'size'에 대한 질문을 등록할 것이며 size가 비어 있을 때 Slot Node를 통해 질문합니다. 사용자가 답을 했을 때 그 답변 내에서 'Size'에 포함이 되는 정보를 찾아서 size 라는 Parameter에 넣을 것입니다. 이렇게 size를 채우고 나면 Slot Node를 넘어가 다음 연결된 Node를 동작시키게 될 것입니다.

## Slot Node Popup

{% include image.html file="chatflow/node_slot/03_chatflow_slot_node_popup.png" max-width="900" caption="Slot Node Popup" %}

Slot Node 상세 Popup을 켜보면 Speak Node와 유사한 형태임을 확인할 수 있습니다. 다시 말해 질문 메시지 역시 답변 메시지와 동일하게 구성할 수 있습니다. 하지만 Popup의 각 Panel 구성으로 보았을 때 크게 2가지 차이를 확인할 수 있습니다.

1. 필수 Parameter 및 옵션 설정
1. Propmt Panel 1개마다 Quick Reply 설정 가능

필수 Parameter와 Propmt Panel이 뭔지, 왜 이런 차이가 있는지 자세히 알아보겠습니다.

### Propmt Panel

**정보를 얻기 위해 던지는 질문을 설정하는 Panel**을 **Prompt Panel**이라고 명명합니다. 질문을 작성하는 방법은 Speak Node의 Response Panel과 동일합니다. 다만, Speak Node와 다른 점은 Quick Reply가 Panel마다 붙을 수 있다는 것입니다. Slot Node는 Speak Node와 달리 여러개의 Prompt Panel이 설정되어 있어도 한 번에 하나의 Panel만 질문이 나갑니다. 이는 정보를 얻기 위해서 한 번에 하나씩 질문을 하는 Slot Node의 특징입니다. 질문에 대한 답이 되돌아오면 정보를 얻었는지 여부 및 추가적인 옵션에 따라 다음 Prompt Panel이 전송되거나 다음 Node로 넘어가거나 혹은 되물어보게 될 것입니다.

{% include note.html content="메시지 구성에 대한 자세한 내용은 [Speak Node 답변 Type](intent_response_chatflow_speak.html#speak-node-답변-type) 부분을 확인해주세요." %}

### 필수 Parameter

**반드시 정보를 얻어야 하는 Parameter**를 **필수 Parameter**라고 합니다. 앞에서 계속 설명한 정보를 채우기 위한 값입니다. 필수 Parameter 하나 당 반드시 Propmt Panel 하나가 붙습니다. 이때, 필수 Parameter는 Intent에 등록된 Parameter만 설정할 수 있으며 하나의 Slot Node에 중복해서 설정할 수 없습니다. 

#### 필수 Parameter 추가

반드시 정보를 얻어야 하는 Parameter가 여러 개이고 연속적으로 확인을 하고자 한다면 Slot Node 하나에 여러 개의 필수 Parameter를 추가할 수 있습니다. 다만 앞서 언급한 것처럼 Slot Node 하나 내에서 동일한 필수 Parameter에 대해 2개 이상의 질문은 설정할 수 없습니다. 그래서 하나의 Slot Node 내에 최대로 추가 가능한 Prompt Panel은 Intent에 등록된 Parameter 개수와 동일합니다. 필수 Parameter가 여러개 존재하면 질문은 상위에 추가된 것부터 순서대로 진행됩니다.

{% include image.html file="chatflow/node_slot/04_chatflow_slot_node_popup_multi_panel_setting.png" max-width="900" caption="Slot Node Popup - 여러 질문 설정" %}

{% include image.html file="chatflow/node_slot/05_chatflow_slot_node_popup_multi_panel_test.png" max-width="900" caption="질문 순서 확인" %}

#### 필수 Parameter 옵션

Slot Node를 사용한 Slot Filling이 어떻게 동작하는지 이해했다면 각 옵션이 왜 존재하는지 알 수 있습니다. 

##### 무조건 물어보기

**무조건 물어보기** 옵션을 선택하면 해당 질문에 도달했을 때 **Parameter에 정보가 있어도 Parameter의 정보를 지우고 무조건 물어봅니다.** 대화를 구성하다 보면 경우에 따라 동일한 Parameter에 대해 되물어봐야 할 때가 있습니다. 예를 들어 주문 확인을 요청했을 때 주문이 틀려서 다시 정보를 수정해야 합니다. 하지만 Slot Node에서 그냥 필수 Parameter를 설정하여 사용하게 되면 이미 Parameter에 정보가 담겨 있기 때문에 수정이 불가능합니다. 이럴 때는 무조건 물어보기를 체크하여 되물어봐야 합니다.

{% include image.html file="chatflow/node_slot/06_chatflow_slot_node_popup_is_must_example.png" max-width="900" caption="무조건 물어보기와 아닐 경우 동작 차이" %}

##### 한번만 물어보기

일반적으로는 앞선 [시나리오 03]과 같이 질문을 했을 때 원하는 정보를 얻지 못하면 되물어봅니다. 하지만 **한번만 물어보기** 옵션을 선택하면 **질문에 대한 답변에서 원하는 정보를 얻지 못해도 다시 질문하지 않습니다**. 즉, 딱 한 번만 질문하고 쿨하게 Parameter가 빈 채로 넘깁니다. 예를 들어 용어 사전을 만들었다고 가정해보겠습니다. Entity에는 답변을 줄 수 있는 용어 목록이 포함되어 있습니다. 그러나 사용자는 용어사전이라고 해서 Entity에 포함되지 않은 용어를 물어봅니다. 한번만 물어보기를 체크하지 않으면 Chatbot은 계속해서 어떤 용어가 궁금하냐고 되물어볼 것입니다. 만약 한번만 물어보기를 활용한다면 해당 용어의 뜻은 지금 답해줄 수 없다고 넘어갈 수 있을 것입니다.

##### 무조건 물어보기 & 한번만 물어보기

만약 두 옵션을 모두 선택하면 말 그대로 무조건 한번만 물어보게 됩니다. Parameter에 정보가 존재해도 무조건 물어보고 다시 되물었을 때 답을 못받아도 다음 순서로 넘어가게 됩니다.

### Slot Filling 강제로 벗어나기

한번만 물어보기 옵션을 선택하지 않는다면 Chatbot은 원하는 정보를 얻을 때까지, 즉 Parameter가 정상적으로 채워질 때까지 동일한 질문을 반복합니다. 이때, 사용자가 **'그만', '취소', '멈춰'** 등 취소의 의미를 가진 간단한 키워드를 입력하면 Slot Filling 상태를 강제로 벗어나게 됩니다.

{% include image.html file="chatflow/node_slot/08_chatflow_slotfilling_stop.png" max-width="900" caption="Slot Filling 상태 강제 취소" %}

<!-- ## Slot Node 활용하기

(간단한 활용 시나리오) -->