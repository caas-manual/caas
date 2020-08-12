---
title: Chatbot 생성
tags: [basic]
keywords: [Chatbot, 챗봇, 생성, 챗봇 만들기]
summary: 대화 주체의 단위인 Chatbot을 생성하는 법을 알아봅니다.
sidebar: chatbot_doc_sidebar
permalink: basic_create_chatbot.html
folder: groupChatbot
previous: {
    title: Chatbot 기본 상식, 
    url: index.html
}
next: {
    title: Intent 이해하기,
    url: intent_basic.html
}

---

## Chatbot 생성하기

Chatbot은 대화를 하는 주체의 단위입니다. Chatbot단위로 사용자가 발화하는 내용을 이해하고, 답변하는 것이 달라집니다.
온라인 게임에서 캐릭터 하나 만든다고 생각하고 쉽게 시작할 수 있습니다.

### Chatbot 생성
{% include callout.html content="화면 위치 : Chatbot명 선택 > [+Create New Chatbot]" type="default" %}

Admin 권한을 가진 Chatbot 개발자가 최초 로그인을 했을 때, Chatbot이 하나도 없다면 Chatbot 생성 화면으로 넘어갑니다. 

{% include image.html file="create_chatbot\01_chatbot_create.png" max-width="900" caption="Chatbot 생성 화면" %}

Chatbot을 생성하기 위한 과정은 간단합니다. Chatbot 생성에 필요한 정보들을 입력한 뒤 ***"저장"*** 버튼을 클릭합니다. 
감정분석 사용은 서비스 형태가 운영일 때만 가능하며 Description은 입력하지 않아도 저장이 가능합니다. 

{% include image.html file="create_chatbot\02_chatbot_create.png" max-width="900" caption="Chatbot 생성 저장" %}

Chatbot이 생성되면 Chatbot 목록으로 화면이 이동되어 생성한 챗봇을 확인할 수 있습니다. 

{% include image.html file="create_chatbot\03_chatbot_created.png" max-width="900" caption="생성된 Chatbot 확인" %}


### Chatbot 목록
{% include callout.html content="화면 위치 : Chatbot명 선택 > [My Chatbots]" type="default" %}

Chatbot 목록에서는 현재 계약 내 사용 권한이 있는 Chatbot들을 확인할 수 있습니다.

{% include image.html file="create_chatbot\04_chatbot_list.png" max-width="900" caption="Chatbot 목록" %}

- <span style="color:#2c3238; font-size:13px"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px"></i>[Intents](intent_basic.html)</span> : Chatbot이 추론할 수 있는 의도(Intent)의 개수
- <span style="color:#2c3238; font-size:13px"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px"></i>[Entities](entity_basic.html)</span> : Chatbot이 추출할 수 있는 Entity종류 수
- Language : Chatbot이 대화할 수 있는 언어권

Intents 또는 Entities를 클릭하면 각각의 해당 메뉴로 이동합니다. Chatbot명을 클릭하여 선택한 Chatbot의 상세 정보 페이지에서 Chatbot의 기본정보를 변경하거나 삭제할 수 있습니다.

{% include note.html content="Chatbot은 계약별로 최대 10개까지만 생성할 수 있습니다." %}

### Chatbot 정보 변경
{% include callout.html content="화면 위치 : [Settings] > [Chatbot Info.]" type="default" %}

Chatbot 생성할 때 입력한 정보들을 수정할 수 있습니다. 

{% include image.html file="create_chatbot\05_chatbot_info.png" max-width="900" caption="Chatbot 정보 변경" %}

General 탭에서는 Chatbot명과 Description 수정이 가능합니다. 수정할 내용을 입력한 뒤 ***"저장"*** 버튼을 클릭합니다. <br/>
이외 탭들에 대한 설정은 <span style="color:#2c3238; font-size:13px"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px"></i>[Settings](chatbot_setting.html)</span> 내에서 확인해 주세요.

### Chatbot 삭제

{% include image.html file="create_chatbot\06_chatbot_info_delete.png" max-width="900" caption="Chatbot 삭제" %}

Chatbot 설정 화면의 하단에 있는 ***"Chatbot 삭제"***기능은 매우 조심해야 하는 기능입니다. 등록되어 있는 모든 학습데이터와 대응되는 답변 시나리오가 삭제됩니다. ***매우 매우 조심하셔야 합니다!***

## Chatbot과 대화하기

Chatbot을 생성하면 자동으로 Default Welcome Intent와 Default Fallback Intent도 함께 생성되는데 이를 활용하여 간단한 대화를 해볼 수 있습니다.

{% include note.html content="본 내용은 [Intent 이해하기](intent_basic.html) 페이지를 확인하신 후 다시 본다면 이해도를 높일 수 있습니다." %}

### Default Intents
{% include callout.html content="화면 위치 : [Intents]" type="default" %}

자동으로 생성된 Default Welcome Intent와 Default Fallback Intent는 Intents 목록 화면에서 확인 가능합니다.

- Default Welcome Intent : 사용자가 Chatbot과 ***대화를 시작할 때*** 매칭되는 Intent
- Default Fallback Intent : Chatbot이 사용자의 표현을 ***이해하지 못했을 때*** 매칭되는 Intent

{% include image.html file="create_chatbot\07_chatbot_default_intents.png" max-width="900" caption="Intents 목록 화면" %}
{% include image.html file="create_chatbot\08_chatbot_default_welcome_intent.png" max-width="900" caption="Default Welcome Intent 상세 화면" %}
{% include image.html file="create_chatbot\09_chatbot_default_fallback_intent.png" max-width="900" caption="Default Fallback Intent 상세 화면" %}

### Simulator를 통한 기본 대화
{% include callout.html content="화면 위치 : 우측 Simulator 영역" type="default" %}

우측의 Simulator 영역에서 두 개의 Default Intent들을 활용하여 Chatbot과 간단한 대화를 나눠봅시다. <br/>
먼저, '반가워'를 입력했더니 Chatbot이 '안녕!'이라고 대답하네요. 
{% include image.html file="create_chatbot\10_chatbot_default_welcome_intent_simulator.png" max-width="900" caption="Default Welcome Intent Simulator" %}

Chatbot에게 '넌 이름이 뭐야?'라고 알아들을 수 없는 질문을 하자 Chatbot은 이해하지 못했다는 뜻으로 Default Fallback Intent에 등록된 응답 중 하나를 대답합니다.
{% include image.html file="create_chatbot\11_chatbot_default_fallback_intent_simulator.png" max-width="900" caption="Default Fallback Intent Simulator" %}