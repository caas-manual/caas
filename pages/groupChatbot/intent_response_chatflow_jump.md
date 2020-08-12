---
title: Jump Node
tags: [intent, chatflow, basic]
keywords: [intent, chatflow, basic, 챗플로우, 노드, Node, Jump, 연결]
summary: Jump Node를 사용하여 자연스럽게 대화를 연결할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: intent_response_chatflow_jump.html
folder: groupChatbot
previous: {
    title: API Node,
    url: intent_response_chatflow_api.html
}
next: {
    title: Function Node,
    url: intent_response_chatflow_function.html
}
---

## Jump Node 란?

**Jump Node**란 **서로 다른 답변을 연결**해주는 Node 입니다. 즉, 다른 Intent의 답변을 연결하여 자연스럽게 대화가 넘어가도록 하거나 공통으로 사용되는 답변을 연결할 수 있도록 지원합니다. Jump Node를 사용하면 현재의 대화 흐름에서 벗어나기 때문에 Jump Node 우측에는 다른 Node와 연결 가능한 Circle(연결점)이 존재하지 않음을 확인할 수 있습니다.

{% include image.html file="chatflow/node_jump/01_chatflow_jump_node.png" max-width="900" caption="Jump Node" %}

Jump Node는 Speak Node에서 확인했던 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[Intent 호출 버튼](intent_response_chatflow_speak.html#intent-호출-버튼-알기)</span>과 동일한 역할을 합니다. 다만, 동작하는 시점의 차이가 있을 뿐입니다. Intent 호출 버튼은 버튼을 클릭했을 때 동작하지만 Jump Node는 대화가 흘러가는 도중에 자연스럽게 동작합니다.<br/>

## Jump Node Popup

{% include image.html file="chatflow/node_jump/02_chatflow_jump_node_popup_init.png" max-width="900" caption="Jump Node Popup" %}

Jump Node 상세 Popup에서는 2가지를 설정할 수 있습니다.

- [Intent 연결](intent_response_chatflow_jump.html#intent-연결하기)
- [Parameter 연결](intent_response_chatflow_jump.html#parameter-연결하기)

### Intent 연결하기

Jump Node를 추가하면 기본적으로 Intent를 선택해야만 합니다. Intent를 선택하지 않으면 저장이 불가능합니다. Intent 선택 Selectbox를 클릭하면 연결 가능한 Intent 목록을 확인할 수 있습니다. Jump Node나 Intent 호출 버튼 모두 기본적으로 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[Followup Intent](//연결확인)</span>가 아닌, 최상위 Intent ( 1 Depth )만 연결할 수 있습니다.

### Parameter 연결하기

Intent를 선택하면 Parameter 연결 영역에서 연결 가능한 Parameter 목록을 확인할 수 있습니다. 선택한 Intent에 등록된 Parameter가 없는 경우에는 연결이 불가능합니다.

{% include image.html file="chatflow/node_jump/03_chatflow_jump_node_popup_param_connect.png" max-width="900" caption="Parameter 연결 불가능 Intent(상)/Parameter 연결 가능 Intent(하)" %}

연결 가능한 Parameter가 존재할 경우 우측 Selectbox에서는 현재 Intent에 등록된 모든 Parameter 목록과 직접입력 항목을 확인할 수 있습니다. Parameter를 선택할 경우 현재 Parameter에 담겨 있는 정보를 전달할 것이고 직접입력을 선택할 경우 개발자가 직접 전달할 정보를 기재할 수 있습니다. 직접입력 선택시 정보는 Text만 전달이 가능하며 입력 항목을 비워둘 수 없습니다.

{% include image.html file="chatflow/node_jump/04_chatflow_jump_node_popup_param_connect_value.png" max-width="900" caption="Paraameter 연결 방법 2가지" %}



