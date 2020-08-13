---
title: History
tags: [history, intent, chatflow]
keywords: History 발화 대화 이력 조회
summary: 챗봇 사용자들의 대화 이력을 세션 단위로 조회할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: manage_history.html
folder: groupChatbot
previous: {
    title: Kakaotalk, 
    url: channel_kakaotalk.html
}
next: {
    title: Training,
    url: manage_training.html
}
---

## 대화 이력(History)
 {% include callout.html content="화면 위치 : History" type="default" %}
**History** 페이지에서는 해당 챗봇의 대화 이력을 조회할 수 있습니다. 사용자가 챗봇과 실제로 어떤 대화를 나누었는지 확인할 수 있으며 세션 단위로 이력 정보를 제공합니다.<br/>

### 조회 조건

<br/>History 페이지에서는 아래와 같은 조건으로 조회가 가능합니다.<br/>

{% include image.html file="manage/history_filtering.jpg" max-width="900" caption="조회 조건" %}

 - 조회기간
 - 시작 Intent명
 - Default Fallback 포함 여부
 - 채널
 - 감정분석
 - User ID/대화 내용 검색
<br/>

원하는 조회 조건을 설정 후 **검색** 버튼을 누르면 조회 결과를 확인할 수 있습니다.<br/>

**조회기간** : 대화 시작일시를 기준으로 조회하고자 하는 기간을 선택합니다.

{% include image.html file="manage/history_filtering_date.JPG" max-width="900" caption="조회조건 - 조회기간" %}

**시작 Intent명** : 대화가 시작된 Intent를 선택하여 조회가 가능합니다. 다중선택이 가능하며 아무것도 선택하지 않은 경우 Intent 전체 기준으로 조회됩니다.<br/>

{% include image.html file="manage/history_filtering_intent.JPG" max-width="900" caption="조회조건 - 시작 Intent명" %}

**Default Fallback** : 대화 내역에서 Default Fallback의 포함 여부를 선택할 수 있습니다.<br/>

{% include image.html file="manage/history_filtering_default.JPG" max-width="900" caption="조회조건 - Default Fallback" %}

**채널** : Facebook Messenger나 Kakaotalk 등 챗봇에 연계된 채널을 선택할 수 있습니다. ***'Test'***를 선택하면 CAAS 내 [Simulator](test_simulator.html#시뮬레이터simulator)에서 입력한 대화들을 볼 수 있습니다.<br/>

{% include image.html file="manage/history_filtering_channel.JPG" max-width="900" caption="조회조건 - 채널" %}

**감정분석** : 대화내역에서 선택한 감정분석 결과가 포함된 대화들을 조회할 수 있습니다. <br/>

{% include image.html file="manage/history_filtering_sentiment.JPG" max-width="900" caption="조회조건 - 감정분석" %}

**User ID/대화 내용** : User ID와 대화 내용은 텍스트 입력을 통해 검색할 수 있습니다. User ID는 입력값과 동일한 값을 가진 대화를 조회하고, 대화 내용은 입력값을 포함하고 있는 대화를 조회합니다.<br/>

{% include image.html file="manage/history_filtering_search.JPG" max-width="900" caption="조회조건 - User Id/대화 내용" %}

### 이력 정보
#### 요약 정보

**History** 페이지에서 대화 이력 조회시 세션별 대화 요약 정보가 조회됩니다.
{% include image.html file="manage/history_summary.jpg" max-width="900" caption="대화 이력 요약" %}

요약 정보에서 확인할 수 내용들은 아래와 같습니다. <br/> 
 
| 구분 | 설명 |
|-------------|-------------|
| **대화 시작 일시** | 대화 세션의 시작 일시를 뜻합니다. Chatbot 개발자 PC의 시간대(Timezone) 기준으로 보여집니다. |
| **사용자 정보(User ID)** | 사용자를 식별할 수 있는 값을 포함하고 있습니다. |
| **시작 intent명** | 사용자의 첫 발화가 어떤 의도로 분류되었는지를 보여줍니다. |
| **interaction 수** | 세션 내 사용자의 발화 건수를 뜻합니다. |
| **fallback 수** | 사용자의 발화 중 의도 분류에 실패한 건수를 뜻합니다. |
| **채널** | 어떤 채널에서 사용자의 대화가 진행되었는지를 뜻합니다. |

#### 상세 정보
대화 상세 내역을 조회하고자 하는 행을 클릭하면 해당 세션에 대한 대화 상세 내역을 조회할 수 있습니다.<br/>

{% include image.html file="manage/history_detail.jpg" max-width="900" caption="대화 이력 상세" %}

상세 정보에서 확인할 수 있는 내용들은 아래와 같습니다. <br/>

| 구분 | 설명 |
|-------------|-------------|
| **시간** | 사용자가 대화를 입력한 시간입니다. Chatbot 개발자 PC의 시간대(Timezone) 기준으로 보여집니다. |
| **대화** | 사용자가 입력한 발화와 챗봇의 응답 내용입니다. |
| **Intent** | 사용자가 입력한 발화의 의도분류 결과를 나타냅니다. |
| **감정분석** | 사용자가 입력한 발화의 감정분석 결과를 나타냅니다. 긍정/중립/부정 세가지로 분류되며, 이모지로 표현됩니다. |
| **Chatflow** | 해당 대화와 연계된 [Chatflow](intent_response_chatflow.html#챗플로우chatflow)로 연결됩니다. |
| **Parameter** | 사용자의 발화에서 추출된 [Parameter](intent_basic.html#파라미터parameter) 값을 보여줍니다. |
| **Log** | Dialogflow의 Raw response 값을 보여줍니다. |

### 다운로드

{% include image.html file="manage/history_download.png" max-width="900" caption="대화이력 다운로드" %}

조회된 검색결과(요약정보)를 엑셀 파일(history.xlsx)로 다운로드 하는 기능입니다. 다운로드한 파일은 아래와 같은 정보들을 포함하고 있습니다.<br/>

| 구분 | 설명 |
|-------------|-------------|
| **Date** | 대화 세션의 시작 일시를 뜻합니다. Chatbot 개발자 PC의 시간대(Timezone) 기준으로 보여집니다. |
| **User ID** | 사용자를 식별할 수 있는 값을 포함하고 있습니다. |
| **Intent name** | 사용자의 첫 발화가 어떤 의도로 분류되었는지를 보여줍니다. |
| **Interaction Count** | 세션 내 사용자의 발화 건수를 뜻합니다. |
| **Fallback Count** | 사용자의 발화 중 의도 분류에 실패한 건수를 뜻합니다. |
| **Channel** | 어떤 채널에서 사용자의 대화가 진행되었는지를 뜻합니다. |

<br/>



