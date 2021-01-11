---
title: 전체 답변 정보 관리
tags: [manage, basic]
keywords: [message, 답변 관리, 전체 답변, 연계 정보, chatflow, response]
summary: Chatbot에 등록된 모든 답변을 한번에 확인하고 관리할 수 있는 기능입니다.
sidebar: chatbot_doc_sidebar
permalink: manage_answers.html
folder: groupChatbot
previous: {
    title: Admin Push Service, 
    url: manage_admin_push_service.html
}
next: {
    title: 사용자 관리,
    url: manage_user_roles.html
}
---

Singlex Chatbot Platform 에서는 정의된 모든 답변 정보를 한 번에 조회하고 수정할 수 있는 기능을 제공합니다.

## 답변 관리

{% include callout.html content="화면 위치 : [Answer Management] > [Message] > 답변 관리 탭 선택" type="default" %}

**답변 관리** 탭에서는 최종 고객에게 내보내는 전체 답변 메시지를 확인할 수 있습니다. Text, Button, Image, Card 등의 형태를 모두 조회할 수 있으며 텍스트 수정이 가능한 영역을 곧바로 수정하여 저장할 수 있습니다. 단, 답변 개수를 늘리거나 줄이는 등의 일은 할 수 없습니다.

### 조회 정보

{% include image.html file="manage/answers_01_answer_default.png" max-width="900" caption="답변 관리 탭 조회 정보" %}

- Intent 명 : 답변이 정의된 Intent 명
- Intent 유형 : 답변이 정의된 Intent의 유형. Dialogflow 또는 Chatflow
- 카테고리 : 답변이 정의된 Intent의 카테고리
- Node 정보 : 답변 Node 정보. Chatflow형일 경우 Node type과 Node명 제공. Dialogflow형일 경우 dialogflow로 고정. node 명을 누르면 해당 Chatflow로 이동합니다.
- 답변 유형 : basic, carousel, custom 으로 구분. Speak node에서 사용되는 response type과 동일.
- 상세 유형 : Text, Image, Button, Quick Reply, Card, Custom
- 답변 내용 : 실제 고객에게 전달되는 답변 내용. 상세 유형에 따라 확인 및 수정 가능한 정보가 상이.
    - Button / Quick Reply : Button type, Button 명, Button Value 확인할 수 있음. Button Type 및 intent호출 type시 button value 수정 불가.
    - Card : Image, Title, Subtitle, Buttom 순으로 확인 가능  
- 등록 일시 : 답변이 정의된 Intent의 등록 일시
- 수정 일시 : 답변이 정의된 Intent의 수정 일시


### 조회 조건

{% include image.html file="manage/answers_02_answer_search.png" max-width="900" caption="답변 관리 탭 조회 조건" %}

- 수정일자 : Intent 최종 수정일에 따라 조회가 가능합니다.
- Intent 유형 : 전체, Dialogflow형, Chatflow형 조회가 가능합니다.
- 카테고리 : Intent 카테고리별 조회가 가능합니다.
- 답변유형 : 전체, Basic, Carousel, Custom 등 답변 UI 형태에 따라 조회가 가능합니다.
- Intent명/답변내용 : Intent명 또는 답변의 내용 검색이 가능합니다.

### 수정 및 저장

답변 관리 탭에서 내용을 수정할 경우 자동으로 체크박스가 선택됩니다. 최종적으로 저장하고자 하는 행만 선택하여 하단 [저장] 버튼을 클릭하면 답변 내용을 수정할 수 있습니다. 단, 답변 저장은 Intent 단위로 이뤄지기 때문에 한 Intent 내의 특정 수정 범위만을 선택할 수는 없습니다.

{% include image.html file="manage/answers_03_answer_save.png" max-width="900" caption="답변 관리 탭 정보 저장" %}


## 연계 정보 조회

{% include callout.html content="화면 위치 : [Answer Management] > [Message] > 연계 정보 조회 탭 선택" type="default" %}

**연계 정보 조회** 탭에서는 Chatflow형 Intent에서 사용한 연계 정보를 모두 조회할 수 있습니다. **연계 정보**란, 하나의 Intent 내에서 가져올 수 있는 정보가 아닌, 외부 API 또는 타 Intent의 정보를 연계한 경우를 말합니다. 그렇기 때문에 연계 정보를 사용할 수 없는 Dialogflow형 Intent는 조회되지 않습니다.</br>
현재 조회 가능한 정보는 다음과 같습니다.
- <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[API Node](intent_response_chatflow_api.html)</span>에 연결된 API 정보
- <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[Jump Node](intent_response_chatflow_jump.html)</span>에 연결된 Intent 정보
- Speak Node 또는 Slot Node에 사용되는 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[Intent 호출 버튼](intent_response_chatflow_speak.html#basic)</span> 정보

### 조회 정보

{% include image.html file="manage/answers_04_link_default.png" max-width="900" caption="연계 정보 조회 탭 조회 정보" %}

- Intent 명 : 연계정보를 사용 중인 Intent 명
- 카테고리 : 연계정보를 사용 중인 Intent의 카테고리
- Node Type : 연계정보가 사용된 Node Type. 현재 speak, slot, api, jump 확인 가능
- Node명 : 연계정보가 사용된 Node 명. 클릭시 해당 Chatflow로 이동.
- 연계 유형 : 연계 정보 종류. 현재 Intent, API 제공.
- 연계 정보 : 실제 연계 정보를 사용중인 Intent에서 연결된 Intent 또는 API. 연결 정보에 오류가 있거나 연결 정보가 정의되지 않은 경우 오류로 표시. Intent호출 버튼일 경우 버튼명과 연계정보를 함께 표시.
- 등록 일시 : 답변이 정의된 Intent의 등록 일시
- 수정 일시 : 답변이 정의된 Intent의 수정 일시

### 조회 조건

{% include image.html file="manage/answers_05_link_search.png" max-width="900" caption="연계 정보 조회 탭 조회 조건" %}

- 수정일자 : Intent 최종 수정일에 따라 조회가 가능합니다.
- 카테고리 : Intent 카테고리별 조회가 가능합니다.
- 연계유형 : 전체, Intent, API 제공. Intent 또는 API 선택 시 연계 정보로 사용된 특정 Intent 또는 API 를 선택 할 수 있습니다. 또한, 연계 정보 누락 또는 오류가 발생한 경우인 **Error**를 검색할 수 있습니다.
- Node Type : 전체, Speak, Slot, Jump, API 제공. 단, 연계 유형에 따라 검색 가능한 Type이 제한됩니다.

{% include image.html file="manage/answers_06_link_error.png" max-width="900" caption="연계 정보 조회 탭 오류 정보 확인" %}
