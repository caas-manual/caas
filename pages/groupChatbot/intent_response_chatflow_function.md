---
title: Function Node
tags: [intent, chatflow, advanced]
keywords: [intent, chatflow, advanced, 챗플로우, 노드, Node, Function, javascript]
summary: Function Node를 이용하여 다양한 데이터를 처리할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: intent_response_chatflow_function.html
folder: groupChatbot
previous: {
    title: Jump Node,
    url: intent_response_chatflow_jump.html
}
next: {
    title: Entity 이해하기,
    url: entity_basic.html
}
---

## Function Node 란?

**Function Node**란 **Javascript를 작성하여 실행**시킬 수 있는 Node 입니다. Function Node의 사용은 필수가 아니지만 다양한 방식의 데이터 처리의 가능성을 열어두기 위해 제공하고 있습니다. 개발자들를 위한 Node라고도 볼 수 있습니다.

## Function Node Popup

{% include image.html file="chatflow/node_function/01_chatflow_function_init.png" max-width="900" caption="Function Node popup" %}

Function Node Popup을 보면 기본적으로 Script를 적을 수 있는 Editor가 존재합니다. 기본적인 문법 오류를 잡아주며 오류가 있을 경우 저장할 수 없습니다. 우측 상단 [ Parameter 추가 ] 버튼을 누르면 현재 Chatflow에서 가져다 쓸 수 있는 Parameter 목록을 확인할 수 있습니다.

{% include image.html file="chatflow/node_function/02_chatflow_function_param_dropdown.png" max-width="900" caption="Parameter 추가 Dropdown" %}

Intent Parameter, 또는 Chatflow Parameter를 Function Node 내에서 사용하면 미리 저장된 값을 가져올 수도 있고, 혹은 Parameter의 값을 변경하여 다른 Node에 값을 전달할 수 있습니다. <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[Chatflow System Parameter](intent_response_chatflow.html#chatflow-parameter)</span>의 값도 사용할 수 있습니다.

{% include note.html content="Chatflow System Parameter의 값은 변경할 수 없습니다." %}

## 자주 쓰는 기본 Function

개발자가 아니라도 쉽게 가져다 쓸 수 있는, 간단하지만 유용하게 쓰이는 Function들이 있습니다.

### 길이 확인

```javascript
var length = parameter명.length;
```

텍스트의 길이 등을 확인할 때 사용할 수 있습니다. 예를 들어 메시지 길이에 따라서 30자 이상이라면 더 간단하게 말해야달라는 답변을 내보내는 등의 일을 할 수 있습니다.

### 난수 발생기

```javascript
var random = Math.floor(Math.random()*1000) % 100 + 1;
```
난수를 발생시켜서 당첨자를 뽑는 다거나, 혹은 여러가지 데이터 중의 하나를 랜덤으로 선택할 때 사용할 수 있습니다. 위 예시는 1~100까지의 수 중 하나를 랜덤으로 발생시킵니다. 위 코드의 구조를 자세히 살펴보겠습니다.

1. `Math.random()` - 0~1 사이 random한 소수를 발생
1. `Math.random()*10의 배수` - 0.XX ~ 10^10의배수.XX 한 수로 만듦
1. `Math.floor(☆)` - 소수점을 버림
1. `☆ % 최대값` - ☆를 최대값으로 나눈 나머지를 얻음. 즉, 0~ 최대값 -1 의 수를 얻을 수 있음.
1. `+ 1` - 1을 더함. 숫자 발생을 1~최대값 범위로 바꿈.

### 날짜/시간 얻기

```javascript
var date = new Date(); //오늘 날짜(Function이 실행된 순간)의 정보를 얻음
var day = date.getDate(); //오늘 날짜의 일자를 얻음
var month = date.getMonth() + 1; //오늘 날짜의 월을 얻음
var year = date.getFullYear(); //오늘 날짜의 연도를 얻음.
var hour = date.getHours(); //현재 시간을 얻음. 0~23시
```

위 코드를 활용하면 Function이 실행되는 날짜와 일정 날짜를 비교하여 특정 날짜 이후에는 답변을 바꾸는 등의 일을 할 수 있습니다. 혹은 시간을 활용하여, 다음과 같은 시나리오 구성이 가능합니다.

```
<상담원 연결 요청 시나리오>
조건 : 9시~16시 사이 전화 상담원 연결이 가능, 사용자가 전화 상담을 요청했을 때.

Case01 : 채팅 시간이 9시 이상 16시 이하일때 - 전화 연결 버튼 안내
Case02 : 채팅 시간이 9시 이전, 16시 이후일때 전화 연결 불가 및 상담 가능 시간 안내.
```

//IMAGE추가 - 실제 Chatflow 구성 및 simulator |

<!-- ## Function Node 활용하기

(예시) -->