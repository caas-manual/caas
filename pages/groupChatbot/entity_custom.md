---
title: Entity 만들기
tags: [entity, basic]
keywords: Basic Conversation
summary: Entity(엔티티)를 등록하는 방법과 Entity 유형들에 대해 소개합니다.
sidebar: chatbot_doc_sidebar
permalink: entity_custom.html
folder: groupChatbot
previous: {
    title: Entity 이해하기, 
    url: entity_basic.html
}
next: {
    title: System Entity,
    url: entity_system.html
}
---

## 사용자 정의 Entity
 {% include callout.html content="화면 위치 : [Entities] " type="default" %}

**사용자 정의 Entity**는 직접 정의하여 사용하는 Entity 입니다. 즉, Parameter를 해당 Entity로 지정할 경우 담길 수 있는 정보를 직접 정의할 수 있습니다.<br/>

해당 메뉴에서는 다음과 같은 내용을 설정할 수 있습니다.<br/> 

 - [사용자 정의 Entity 등록하기](entity_custom.html#사용자-정의-Entity-등록하기)

<br/>또한 Entity를 등록/수정하며 아래와 같은 다양한 Entity를 만들 수 있습니다.<br/>

 - [매핑 Entity](entity_custom.html#매핑-Entity)
 - [리스트 Entity](entity_custom.html#리스트-Entity)
 - [복합 Entity (리스트형 / DOCUMENT 챗봇의 multi coffe 엔티티 참조)](entity_custom.html#복합-Entity)
 - [정규 표현식 Entity](entity_custom.html#정규-표현식-Entity)

<br/>메뉴에서 선택한 옵션에 따라 **매핑 Entity**, **리스트 Entity**, **복합 Entity**, **정규 표현식 Entity**를 만들 수 있습니다.
 또한 Entity의 종류를 결정하지는 않지만 Entity의 매칭에 영향을 주는 옵션으로 **자동 확장(Automated expansion)**과 **퍼지 매칭(Fuzzy matching)**이 있습니다.<br/>

 - [자동 확장](entity_custom.html#자동-확장)
 - [퍼지 매칭](entity_custom.html#퍼지-매칭)
<br/>

## 사용자 정의 Entity 등록하기

해당 메뉴에서는 Entity에 대한 **Entry(엔트리)**를 등록할 수 있습니다. 하나의 Entry는 하나의 **Value(참조 값)**과 **Synonym(유의어)**목록을 포함합니다. 예를 들어 다음 각 행은 'Food'라는 Entity의 Entry들 입니다.<br/>

{% include image.html file="entity/00_entity_custom_enroll.PNG" max-width="900" caption="사용자 정의 Entity 등록" %}

예를 들어 위와 같이 *'치킨'*이라는 Value에는 *'치느님, Chicken'* 등의 Synonym을 등록할 수 있습니다. 이렇게 등록한 치느님, Chicken 등의 정보를 입력받았을 때 Chatbot(챗봇)은 '치킨'으로 인식하게 됩니다.<br/>

Entity 등록/수정에는 다음과 같은 제약사항이 존재합니다.

- Entity명은 Agent(에이전트)마다 고유합니다. Entity명은 문자로 시작해야 하며 A-Z, a-z, 0-9, _(밑줄), -(대시)를 포함할 수 있습니다.
- Entity명은 최대 30자로 제한합니다.
- Entity는 반드시 하나 이상의 Entry를 가져야 합니다.
- Value는 최대 40자로 제한합니다.
- Entry는 반드시 하나 이상의 Synonym를 가져야 합니다.
- 하나의 Entry에 Synonym는 최대 200개까지 등록이 가능합니다.
- 퍼지 매칭은 정규 표현식 Entity에 사용 설정할 수 없습니다. 이러한 기능은 상호 배타적입니다.
- 각 Agent에는 최대 50개의 정규 표현식 Entity가 있을 수 있습니다.
- Entity에 대한 정규 표현식 최대 길이는 1024자입니다.
<br/>

또한 Entity 상세 화면의 테이블 상단 우측에 있는 **JSON으로 작성**버튼을 클릭하면 JSON 형식으로 작성하실 수 있습니다. <br/>

{% include image.html file="entity/00_entity_custom_enroll_json.PNG" max-width="900" caption="사용자 정의 Entity 등록 - JSON 모드" %}

Entity 상세 화면 상단의 카테고리 란에서 카테고리를 선택할 수 있습니다. 카테고리 목록을 조회하면 ‘카테고리 없음’ 항목은 기본적으로 생성되며, 사용자가 새로 카테고리를 검색, 추가 및 선택을 할 수 있습니다.<br/>

{% include image.html file="entity/00_entity_custom_enroll_category_0.PNG" max-width="900" caption="Entity 카테고리 등록란" %}
{% include image.html file="entity/00_entity_custom_enroll_category_1.PNG" max-width="900" caption="Entity 카테고리 입력" %}
{% include image.html file="entity/00_entity_custom_enroll_category_2.PNG" max-width="900" caption="Entity 카테고리 목록 조회" %}

<br/>
Entity의 종류는 상세 화면의 체크박스들의 체크 유무에 따라 결정할 수 있습니다. 다음과 같이 체크된 항목에 따른 Entity 유형들을 확인할 수 있습니다. <br/>

### 매핑 Entity
 매핑 Entity은 각 Value에 Synonym의 매핑을 제공합니다. 최종 사용자 표현 부분에서 특정 Synonym이 일치하면 일치한 Entity에 연결된 Value가 추출되고 연결된 Parameter 값을 확인하는 데 사용됩니다.<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[매핑 Entity란?](https://cloud.google.com/dialogflow/docs/entities-options#map)</span>

{% include image.html file="entity/01_entity_custom_map.PNG" max-width="900" caption="매핑 Entity 설정" %}

 Synonym 목록에는 Value와 같은 값이 들어갈 수 있으며 생략해도 괜찮습니다. 이는 최종 사용자 표현 부분과 일치하지 않지만 Synonym 중 하나가 일치할 때 추출된 값으로 사용됨을 의미합니다.<br/>

매핑 Entity를 만들려면 다음 안내를 따르세요.<br/>
- 상세 화면의 체크박스에서 정규 표현식 옵션을 선택 해제하고 유의오 정의 옵션을 선택합니다. 
<br/><br/>

### 리스트 Entity
리스트 entity은 단일 값 Entry 목록을 제공합니다. 이 경우 Synonym 목록은 없습니다.
<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[리스트 Entity란?](https://cloud.google.com/dialogflow/docs/entities-options#list)</span>

{% include image.html file="entity/01_entity_custom_list_case.PNG" max-width="900" caption="리스트 Entity 설정 Case" %}

최종 사용자 표현 부분에서 특정 Value가 일치하면 일치하는 값이 추출되고 연결된 Parameter 값을 확인하는 데 사용됩니다.<br/>

리스트 Entity를 만들려면 다음 안내를 따르세요.<br/>

- 상세 화면의 체크박스에서 정규 표현식 옵션을 선택 해제하고 유의어 정의 옵션을 선택 해제합니다.
<br/><br/>

#### 복합 Entity
복합 Entity은 특별한 종류의 리스트 Entity 입니다. 리스트 Entity의 Entry에 다른 Entity가 참조되어 포함된 형태로 이를 복합 Entity라 합니다.
<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[복합 Entity란?](https://cloud.google.com/dialogflow/docs/entities-options#comp)</span>

복합 Entity의 Entry는 참조되는 Entity의 이름과 선택한 속성 이름을 포함하며 다음과 같이 설정할 수 있습니다.<br/>
 {% include callout.html content="@Entity명:속성이름" type="default" %}

아래의 그림은 'multiCoffe'라는 복합 Entity의 Entry를 구성하는 예시입니다.<br/>

{% include image.html file="entity/01_entity_custom_list.PNG" max-width="900" caption="Entity 목록" %}
{% include image.html file="entity/01_entity_custom_composite_list.PNG" max-width="900" caption="복합 Entity 설정" %}

<br/>

### 정규 표현식 Entity
정규 표현식 Entity는 리스트형의 Entity이며 정규 표현식을 설정할 수 있습니다.
<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[정규 표현식 Entity란?](https://cloud.google.com/dialogflow/docs/entities-regexp#compound)</span>

{% include image.html file="entity/01_entity_custom_regexp.PNG" max-width="900" caption="정규 표현식 Entity 설정" %}

정규 표현식 Entity를 만들려면 다음 안내를 따르세요.<br/>
- 상세 화면의 체크박스에서 정규 표현식 옵션을 선택합니다.
- 퍼지 매칭 옵션은 정규 표현식 Entity에 설정할 수 없습니다. 이러한 기능은 상호 배타적입니다.
- 각 Agent(에이전트)에는 최대 50개의 정규 표현식 Entity가 있을 수 있습니다.
- 복합 정규 표현식 최대 길이는 1024자입니다.

### 자동 확장

자동 확장을 사용 설정하면 Agent에서 명시적으로 제공되지 않은 값을 인식할 수 있습니다. 자세한 내용은 오른쪽 링크를 참조해주세요.
<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[자동 확장이란?](https://cloud.google.com/dialogflow/docs/entities-options#expansion)</span>

예를 들어 다음과 같은 쇼핑 목록 항목 유형이 있다고 가정해 보겠습니다.

| Value |Synonym |
|------|------|
| bread	| bread |
| butter | butter |
| milk | milk |
| apple	| apple |
| ice cream	|아이스크림|

최종 사용자 표현이 'I need to buy some carrots'라면 제공되지 않더라도 'carrots'가 이 항목 유형에 일치합니다. 에이전트는 'carrots'가 다른 값과 비슷함을 인식합니다. Agent가 Entity 유형을 확장할 수 있도록 학습 문구에 많은 Entity 값 예시를 제공해야 합니다. 그렇지 않으면 자동 확장이 예상대로 작동하지 않을 수 있습니다.<br/>

{% include image.html file="entity/01_entity_custom_map_auto.PNG" max-width="900" caption="자동 확장 설정" %}

자동 확장을 사용 설정하려면 다음 안내를 따르세요.<br/>
- 상세 화면의 체크박스에서 자동 확장 옵션을 선택합니다.


### 퍼지 매칭

퍼지 매칭을 사용 설정하면 Value나 Synonym에서의 단어 순서가 중요하지 않게 됩니다.

<span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[퍼지 매칭이란?](https://cloud.google.com/dialogflow/docs/entities-fuzzy)</span>

{% include image.html file="entity/01_entity_custom_map_fuzzy.PNG" max-width="900" caption="퍼지 매칭 설정" %}

퍼지 매칭을 설정하려면 다음 안내를 따르세요.<br/>
- 상세 화면의 체크박스에서 퍼지 매칭 옵션을 선택합니다.
