---
title: Entity 이해하기
tags: [entity, basic]
keywords: Basic Conversation
summary: Intent(인텐트)에 사용되는 매개변수인 Entity(엔티티)에 대한 간략한 이해와 Entity의 상세 유형에 대한 개념을 확인할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: entity_basic.html
folder: groupChatbot
previous: {
    title: Function Node, 
    url: intent_response_chatflow_function.html
}
next: {
    title: Entity 만들기,
    url: entity_custom.html
}
---

## Entity (엔티티)
 {% include callout.html content="화면 위치 : [Entities]" type="default" %}
**Entity**란, 사용자의 말 속에서 원하는 정보를 뽑아내기 위해 설정하는 값입니다. Entity는 모든 단어 또는 어구를 담을 수 있는 타입이며 주로 특정하기 힘든 단어 또는 어구를 찾기 위해 사용할 수 있습니다. 앞서 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[Intent의 Parameter](intent_basic.html#parameter)</span>에서 설명한 것과 같이 Parameter라는 껍데기가 어떤 정보를 담을 수 있을지 결정해주는 역할을 합니다.<br/>

해당 메뉴에서는 다음과 같은 내용을 이용할 수 있습니다.<br/>

- [사용자 정의 Entity](entity_custom.html#사용자-정의-entity)
- [시스템 Entity](entity_system.html#시스템-entity)
- [Entity 업로드/다운로드](entity_basic.html#api-업로드다운로드)


Entity의 종류에는 크게 두 가지가 있습니다. **사용자 정의 Entity**와 **시스템 Entity**가 있으며 각 Entity에 대한 자세한 내용은 위 항목을 클릭하여 확인할 수 있습니다.

## Entity 업로드/다운로드

Chatbot은 편의 기능의 일종으로 업로드/다운로드 기능을 제공하고 있습니다. 해당 기능은 JSON파일로 지원됩니다.<br/>

### 업로드
{% include callout.html content="화면 위치 : [Entities] > [업로드]" type="default" %}

Entity 목록 조회화면 우측에 **업로드** 버튼이 존재합니다. 업로드 형식에 맞추어 작성한 JSON파일을 올려주시면 자동으로 API가 생성됩니다. 업로드 파일은 다음과 같은 제약사항이 존재합니다.
 - JSON 파일만 가능합니다.
 - 동시에 여러개의 파일을 업로드할 수 있습니다.
 - 최대 파일 수 : 50, 파일 당 최대 3MB까지 업로드할 수 있습니다.
 - 파일명은 최대 50자까지 허용합니다.

<!-- 업로드 화면 -->
{% include image.html file="entity/00_entity_basic_upload.PNG" max-width="900" caption="Entity 업로드" %} 

#### 업로드 형식
입력하고자 하는 정보는 JSON 형식으로 작성이 되어야하며, 필수값에 해당하는 정보가 없거나 형식이 맞지 않으면 파일은 업로드에 실패하게 됩니다. 실제 업로드 파일은 다음과 같은 형식으로 쓰게 됩니다.

```
{%raw%}
{
  "botId" : "Chatbot Id",
  "id" : "Entity Id",
  "df" : "Dialogflow Entity Id",
  "name" : "Entity 명",
  "synonym" : 유의어 정의 선택 여부(true/false),
  "regexp" : 정규표현식 선택 여부(true/false),
  "autoExpansion" : 자동 확장 선택 여부(true/false),
  "fuzzy" : 퍼지 매칭 선택 여부(true/false),
  "languages" : [ "선택 언어 목록" ],
  "categoryName" : "카테고리 명",
  "reference" : [ {
    "synonymList" : [ "유의어 항목" ],
    "language" : "선택 언어",
    "id" : "Entity 레퍼런스 Id",
    "category" : "Entity 레퍼런스명"
  } ]
}
{%endraw%}
```

### 다운로드
생성한 Entity를 JSON 파일로 다운로드 받으실 수 있습니다. Chatbot 별 전체 Entity 다운로드 기능과 Entity 별 단건 다운로드 기능을 제공하고 있습니다.

#### 단건 다운로드
{% include callout.html content="버튼 위치 : [Entities] > 특정 Entity 선택 > [다운로드]" type="default" %}

Entity 상세화면의 우측 하단에 **다운로드**  버튼이 존재하며 Entity 등록 이후에 생성됩니다. 단건 다운로드 시 하나의 Entity에 관한 정보가 JSON 파일로 저장됩니다.

#### 다건 다운로드
{% include callout.html content="버튼 위치 : [Entities] > [전체 다운로드]" type="default" %}

Entity 목록 조회화면 우측에 **전체다운로드** 버튼이 존재합니다. 전체 다운로드 시 Chatbot 전체 API가 JSON 파일로 저장되며 zip 파일로 압축되어 제공됩니다.
