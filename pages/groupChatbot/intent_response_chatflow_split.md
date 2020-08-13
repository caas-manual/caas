---
title: Split Node
tags: [intent, chatflow, basic]
keywords: [intent, chatflow, basic, 챗플로우, 노드, Node, Split, 분기]
summary: Split Node를 사용하여 조건에 따라 대화를 분기할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: intent_response_chatflow_split.html
folder: groupChatbot
previous: {
    title: Slot Node,
    url: intent_response_chatflow_slot.html
}
next: {
    title: API Node,
    url: intent_response_chatflow_api.html
}
---

## Split Node 란?

**Split Node**란 지정한 **조건에 따라서 대화를 분기**시키는 Node 입니다. <br/>
구체적으로 예를 들어 보겠습니다. 카페에서 음료를 주문 받으려고 합니다. 만약 이때 아메리카노를 주문하면 사이즈가 레귤러인지 라지인지 확인해야 하고 스무디를 주문하면 별도의 사이즈 선택이 없는 상황이라고 가정해보겠습니다. 그렇다면 손님의 메뉴 선택에 따라서 사이즈를 물어볼 것인지, 아니면 바로 결제할 것인지 결정하게 됩니다. 손님의 메뉴 선택은 조건이 되고 사이즈를 묻는 것과 결제를 요청하는 것은 각각의 Node가 될 것입니다. 그리고 이 조건을 판단하여 다음 이어질 대화를 선택해 주는 것이 Split Node라고 보시면 됩니다.<br/>

이런 특성 때문에 Split Node는 현재 제공 중인 Node 중 유일하게 다음 Node로 여러 개의 Node를 연결할 수 있습니다.

{% include image.html file="chatflow/node_split/01_chatflow_split_node_connect.png" max-width="900" caption="Split Node 연결" %}

Split Node를 사용하기 위해서는 위 이미지와 같이 다음 Node를 먼저 연결해줘야만 합니다. 연결된 Node가 없으면 상세 Popup 내에서 조건을 추가할 수 없습니다.

{% include image.html file="chatflow/node_split/02_chatflow_split_node_not_connect.png" max-width="900" caption="Split Node Popup - 연결된 Node가 없을 때" %}

## Split Node Popup

### 조건 Panel

Popup 상단 [ 조건 추가 ] 버튼을 누르면 분기 기준이 될 조건 Panel을 추가할 수 있습니다.

{% include image.html file="chatflow/node_split/03_chatflow_split_node_popup_add_panel.png" max-width="900" caption="Split Node Popup - 기본 구성" %}

Panel 하나 당 연결할 Node 하나를 선택할 수 있고 세부적인 조건식을 추가할 수 있습니다. 하나의 조건 Panel에 최대 50개의 조건식을 추가할 수 있으며 모든 조건식은 AND, OR 중 하나의 연산자로 묶입니다. 각각의 영역을 상세하게 살펴보겠습니다.

#### 연결 Node 선택

조건을 추가했을 경우 연결할 Node는 반드시 선택해줘야만 합니다. Chatflow Design Panel 내에서 Split Node와 실제 Line으로 연결해둔 Node 들만 선택할 수 있습니다.

#### 조건식 설정

**조건식**은 연결할 Node를 선택하기 위한 판단 기준이 될 논리식입니다. 조건식의 가장 작은 단위를 **단위 조건식**이라 명명하겠습니다. 단위 조건식은 Parameter, 비교연산자, 비교값을 설정할 수 있는 한 행 입니다. 즉, x > y 라는 간단한 수식에서 x는 Parameter, > 이라는 비교연산자, y는 비교값이라고 보시면 됩니다. 하나의 조건 Panel 내에서 여러개의 단위 조건식들이 AND 또는 OR의 논리연산자로 통합되어 최종적인 조건식이 만들어집니다. 최종적으로 조건식이 참이 되는지를 확인합니다.

##### Parameter 선택

대화에서 Parameter는 다양한 정보를 담고 있기 때문에 Split Node의 모든 조건식의 비교 대상은 Parameter입니다. 해당 Intent 내에 개발자가 등록한 모든 Parameter와 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[Chatflow System Parameter](intent_response_chatflow.html#chatflow-system-parameter)</span>를 활용할 수 있습니다. 예를 들어 `sys.channelName`에 대한 조건식을 정의하면 사용자가 진입한 채널에 따라서 답변을 분리할 수 있습니다.

##### 비교연산자

Split Node 에서는 다음과 같은 비교연산자를 제공하고 있습니다. 일반적인 비교연산자와 동일한 역할을 합니다.

| 연산자 | 설명 | 예시 |
|-----|-------|--------|
| `==` | 좌우의 값이 같은지 확인한다. | `0 == 0` : 참 / `0 == 1` : 거짓 |
| `!=` | 좌우의 값이 다른지 확인한다. | `0 != 1` : 참 / `0 != 0` : 거짓 |
| `<` | 왼쪽이 오른쪽 보다 작은 지 확인한다. | `0 < 1` : 참 / `0 < 0` : 거짓 |
| `<=` | 왼쪽이 오른쪽 보다 같거나 작은 지 확인한다. | `0 <= 0` : 참 / `1 <= 0` : 거짓 |
| `>` | 왼쪽이 오른쪽 보다 큰 지 확인한다. | `1 > 0` : 참 / `1 > 1` : 거짓 |
| `>=` | 왼쪽이 오른쪽 보다 같거나 큰 지 확인한다. | `1 >= 1` : 참 / `0 >= 1` : 거짓 |
| `contain` | 왼쪽이 오른쪽 값을 포함하는지 확인한다. | `"피자주문" contain "피자"` : 참 / `"피자" contain "피자주문"` : 거짓 |
| `not contain` | 왼쪽이 오른쪽 값을 포함하지 않음을 확인한다. | `"피자" not contain "주문"` : 참 / `"피자주문" not contain "피자"` : 거짓 |

##### 비교값

개발자가 직접 입력하는 값입니다. 비교연산자에 따라 좌측 Parameter와 비교하게 되며 빈값으로 놔둘 시에는 Parameter와 빈 값을 비교하게 됩니다.

{% include image.html file="chatflow/node_split/04_chatflow_split_node_popup_compareSet.png" max-width="900" caption="Split Node Popup - 조건 설정" %}

위와 같이 조건을 정의할 경우 `menu` 라는 parameter의 값이 빈 값일 때, 즉 `menu`에 대한 정보가 없을 때  'Speak Node 1'로 연결함을 의미합니다.

##### 논리연산자

우측에 있는 [+] 버튼을 누르면 단위 조건식을 추가할 수 있습니다. 이때, 단위 조건식 사이의 참 / 거짓을 AND 또는 OR로 연결하여 조건식을 만들 수 있습니다.

| 연산자 | 설명 |
|-----|-------|
| `AND` | 모든 단위 조건식이 참일때 조건식은 참이 된다. |
| `OR` | 단위 조건식 중 하나다로 참이면 조건식은 참이 된다. | 

#### 기본 조건

**기본 조건**이란 모든 조건 Panel이 만족하지 못했을 때 실행하는 조건입니다. 만약 기본 조건을 사용하지 않을 경우 흐름은 여기서 끝납니다.

### Split Node의 동작

하나의 Split Node에 여러개의 조건 Panel을 추가할 경우, 1번 조건 Panel 부터 차례대로 만족하는지 확인합니다. 먼저 만족된 Panel이 있다면 이후 조건 Panel은 확인하지 않고 바로 해당 조건에 연결된 Node로 넘어갑니다. 즉, Split Node Popup의 상단에서 부터 차례로 조건을 확인하며 만족하는 즉시 끝난다고 보면 됩니다. 그래서 먼저 확인해야하는 조건을 위에 설정하여야 합니다.<br/> 
조건 Panel의 순서가 중요하기 때문에 각 조건 Panel 순서를 쉽게 바꿀 수 있도록 이동 버튼(<button class="btn btn-default" disabled style="padding: 2px 5px 0px; margin: 0px; cursor: default;">{% include inline_image.html file="chatflow/icon/lg-chatflow-more.svg" width=15 %}</button>)을 제공하고 있습니다.

{% include image.html file="chatflow/node_split/05_chatflow_split_node_popup_move_panel.png" max-width="900" caption="Split Node Popup - Panel 순서 변경" %}

<!-- ## Split Node 활용하기

(예시) -->
