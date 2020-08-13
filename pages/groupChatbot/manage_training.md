---
title: Training
tags: [training, intent]
keywords: training 학습 재학습
summary: 사용자 발화에 대한 의도분류 이력을 조회하고, 의도분류 결과를 토대로 추가 학습할 수 있는 화면입니다.
sidebar: chatbot_doc_sidebar
permalink: manage_training.html
folder: groupChatbot
previous: {
    title: History, 
    url: manage_history.html
}
next: {
    title: Dashboard,
    url: manage_dashboard.html
}
---

## Training
 {% include callout.html content="화면 위치 : Training" type="default" %}
**Training** 화면에서는 사용자 발화별 의도분류 결과를 조회할 수 있습니다. **대화 이력** 테이블에서 추론율이 낮거나 의도분류 결과가 틀린 경우 **발화 학습** 테이블에서 학습 발화 내용 또는 학습 intent명을 수정한 뒤, 추가 학습을 진행할 수 있습니다. 
이 화면에서 학습이 완료된 문장은 해당 Intent 예문에도 동일하게 등록됩니다.<br/>

### 조회 조건

{% include image.html file="manage/training_filtering.JPG" max-width="900" caption="조회 조건" %}

<br/>Training 페이지에서는 아래와 같은 조건으로 조회가 가능합니다.<br/>
 - 조회기간
 - Intent
 - 추론율
 - 사용자 발화
 - 학습상태
<br/>

원하는 조회 조건을 설정 후 **검색** 버튼을 누르면 조회 결과를 확인할 수 있습니다.<br/> 
 
**조회기간** : 발화 입력 시간을 기준으로 조회하고자 하는 기간을 선택합니다. <br/>

{% include image.html file="manage/training_filtering_date.JPG" max-width="900" caption="조회 조건" %}

**Intent** : 발화가 분류된 의도를 선택해서 조회할 수 있습니다. 다중선택이 가능하며 아무것도 선택하지 않은 경우 Intent 전체 기준으로 조회됩니다. <br/>

{% include image.html file="manage/training_filtering_intent.JPG" max-width="900" caption="조회 조건" %}
**추론율** : 추론율 범위를 선택하여 조회할 수 있습니다.<br/>

{% include image.html file="manage/training_filtering_confidence.JPG" max-width="900" caption="조회 조건" %}

**사용자 발화** : 텍스트를 입력해서 해당 검색어를 포함하고 있는 발화들을 조회할 수 있습니다.<br/>

{% include image.html file="manage/training_filtering_search.JPG" max-width="900" caption="조회 조건" %}

**학습 상태** : 학습 상태 여부를 선택하여 조회할 수 있습니다. 발화 학습의 학습 상태 컬럼 옆 화살표를 클릭하면 선택 가능합니다. 아무것도 선택하지 않은 경우 전체 기준으로 조회됩니다.<br/>

{% include image.html file="manage/training_filtering_train.png" max-width="900" caption="조회 조건" %}

### 검색결과

#### 대화 이력

{% include image.html file="manage/training_before.png" max-width="900" caption="대화이력" %}

**대화 이력** 테이블은 사용자 발화별 의도 분류 결과를 포함하고 있으며 아래와 같은 정보를 확인할 수 있습니다.<br/>

| 구분 | 설명 |
|-------------|-------------|
| **생성 일시** | 사용자가 챗봇에 발화를 입력한 시간입니다. Chatbot 개발자 PC의 시간대(Timezone) 기준으로 보여집니다. |
| **Intent명** | 발화의 의도분류 결과를 나타냅니다. |
| **사용자 발화** | 사용자가 챗봇에 입력한 발화 내용을 나타냅니다. |
| **추론율** | 발화가 해당 Intent로 분류된 확률을 나타냅니다. |

#### 발화 학습

{% include image.html file="manage/training_after.png" max-width="900" caption="대화이력" %}

**발화 학습** 테이블에서는 아래와 같은 데이터를 수정하고 학습에 반영할 수 있습니다. <br/>
 - 학습 Intent명
 - 학습발화
 - 학습 상태

데이터 수정을 완료한 뒤, 수정할 문장들을 선택해서 **'학습'** 버튼을 클릭하면 추가 학습이 진행됩니다.<br/>

**학습 Intent명** : 해당 발화의 의도분류 결과가 잘못된 경우, 수정해서 학습할 Intent명을 선택해서 변경할 수 있습니다.<br/>

{% include image.html file="manage/training_intent_wrong.png" max-width="900" caption="Intent명 수정" %}

예를 들어, 위의 이미지에서 **"자동화기기 이체 수수료가 얼마야?"** 이라는 발화가 **"자동화기기_한도_이체"**라는 Intent로 분류된 것을 확인할 수 있습니다. 이 발화를 아래와 같이 **"자동화기기_수수료"**라는 Intent로 변경해보겠습니다.

{% include image.html file="manage/training_intent.png" max-width="900" caption="Intent명 수정" %}

**학습발화** : '연필'모양의 아이콘을 클릭하면 발화를 수정할 수 있는 팝업창이 나타납니다. 팝업창 내에서 발화 수정 및 파라미터 추가가 가능합니다.<br/>

예를 들어, **"ATM기 이체 한도는 얼마까지야?"** 라는 발화를 수정해보겠습니다. 학습발화 옆 **'연필'**모양의 아이콘을 클릭하면 아래와 같은 팝업창이 나타나게 됩니다.

{% include image.html file="manage/training_phrase_edit.png" max-width="900" caption="학습발화 수정" %}

해당 팝업창에서는 Intent 화면에서와 동일하게 **parameter**도 추가할 수 있습니다.

{% include image.html file="manage/training_phrase_parameter.png" max-width="900" caption="학습발화 수정" %}

학습할 발화에 대한 수정이 끝나면 학습할 행들을 선택한 뒤 아래 **'학습'** 버튼을 클릭해서 학습을 진행합니다.

{% include image.html file="manage/training_save.png" max-width="900" caption="학습 진행" %}

**학습 상태** : 해당 발화의 학습 여부를 나타냅니다. 학습이 완료된 발화인 경우 학습완료 된 시간을 확인할 수 있으며, 마우스를 가져다대면 학습한 계정 정보를 확인할 수 있습니다. <br/>

위에서 수정하고 학습한 내용이 잘 반영되어 있는 것을 확인할 수 있습니다. <br/>

{% include image.html file="manage/training_finish.png" max-width="900" caption="학습 완료" %}

### 다운로드

{% include image.html file="manage/training_download.png" max-width="900" caption="학습이력 다운로드" %}

조회된 검색결과를 엑셀 파일(training.xlsx)로 다운로드 하는 기능입니다. 다운로드한 파일은 아래와 같은 정보들을 포함하고 있습니다.<br/>

| 구분 | 설명 |
|-------------|-------------|
| **Date** | 사용자가 챗봇에 발화를 입력한 시간입니다. Chatbot 개발자 PC의 시간대(Timezone) 기준으로 보여집니다. |
| **Intent name** | 발화의 의도분류 결과를 나타냅니다. |
| **Query text** | 사용자가 챗봇에 입력한 발화 내용을 나타냅니다. |
| **Inference** | 발화가 해당 Intent로 분류된 확률을 나타냅니다. |
| **Training Intent** | 학습완료된 발화의 경우 학습된 Intent 명이 나타납니다. 학습이 되지 않은 발화의 경우 기존에 분류된 결과와 동일한 Intent 명이 나타납니다. |
| **Training phrase** | 학습완료된 발화의 경우 학습된 발화가 나타납니다. 학습이 되지 않은 발화의 경우 기존에 사용자가 입력한 발화와 동일한 내용이 나타납니다. |
| **Training Y/N** | 발화의 학습 여부를 나타냅니다. 학습이 완료된 경우 'Y', 그렇지 않은 경우는 'N' 값을 가지고 있습니다. |
| **Training date** | 학습완료된 발화의 경우 학습완료 시간입니다. |
| **Trainer** | 학습완료된 발화의 경우 학습을 수행한 계정 정보입니다. |

<br/>


