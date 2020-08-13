---
title: Dashboard
tags: [dashboard]
keywords: dashboard 통계 대시보드 
summary: 챗봇의 처리량과 응답률 등의 통계 데이터를 확인할 수 있는 화면입니다.
sidebar: chatbot_doc_sidebar
permalink: manage_dashboard.html
folder: groupChatbot
previous: {
    title: Training, 
    url: manage_training.html
}
next: {
    title: 사용자 관리,
    url: manage_user_roles.html
}
---

## 대시보드(Dashboard)
 {% include callout.html content="화면 위치 : Dashboard" type="default" %}
**Dashboard**화면은 **처리량**과 **응답률** 두 개의 탭으로 구성되어 있습니다. **처리량** 탭에서는 챗봇의 사용량에 관한 통계정보를 확인할 수 있으며,
**응답률** 탭에서는 챗봇의 의도분류에 관한 통계정보를 확인할 수 있습니다.<br/>

{% include image.html file="manage/dashboard_tab.png" max-width="900" caption="Dashboard 기본 화면" %}

### 조회 조건

{% include image.html file="manage/dashboard_filtering.PNG" max-width="900" caption="Dashboard 조회 조건" %}
<br/>
Dashboard 페이지에서는 아래와 같은 조건으로 조회가 가능합니다.
 - 조회기간
 - 챗봇
 - 채널
<br/>

원하는 조회 조건을 설정 후 **검색** 버튼을 누르면 조회 결과를 확인할 수 있습니다.<br/> 

**조회기간** : 조회기간은 시간별/일별/월별 중 하나를 선택합니다. **'시간별'**을 선택했을 경우에는 조회하고자 하는 날짜를, **'일별'**, **'월별'**을 선택했을 경우에는
조회하고자 하는 기간을 선택하면 됩니다. <br/>

{% include image.html file="manage/dashboard_filtering_date.PNG" max-width="900" caption="Dashboard 조회 조건 - 조회기간" %}

**챗봇** : 동일한 **계약번호** 내의 챗봇 목록 중 조회하고자 하는 챗봇들을 다중 선택할 수 있습니다. 초기값으로는 계약 번호 내 전체 챗봇이 선택됩니다. <br/>

{% include image.html file="manage/dashboard_filtering_chatbot.PNG" max-width="900" caption="Dashboard 조회 조건 - 챗봇" %}

**채널** : 연계된 채널 목록 중 조회하고자 하는 채널들을 다중 선택할 수 있습니다. 초기값으로는 전체 채널이 선택됩니다. <br/>

{% include image.html file="manage/dashboard_filtering_channel.PNG" max-width="900" caption="Dashboard 조회 조건 - 채널" %}

### 기본 통계량
가장 상단에 조회되는 항목에는 조회하는 시점의 챗봇 목록에 대한 [Intent](intent_basic.html), [Entity](entity_basic.html), [Chatflow](intent_response_chatflow.html) 건수가 집계되어 있습니다. <br/>

{% include image.html file="manage/dashboard_basic.png" max-width="900" caption="Dashboard 기본 통계량" %}

{% include warning.html content="해당 통계량들은 **조회기간**의 영향을 받지 않습니다." %}

### 처리량
**처리량**탭에서는 다음과 같은 항목들을 확인할 수 있습니다. <br/>
 - 누적 세션
 - 누적 처리량
 - 세션당 평균 처리량
 - 세션 
 - 처리량
 - Intent 사용빈도 Best
 - Intent 사용빈도 Worst

<br/>
**기준일자**는 해당 기간 데이터가 업데이트 된 일시를 뜻하며 Chatbot 개발자 PC의 시간대(Timezone) 기준으로 보여집니다. <br/>

{% include image.html file="manage/dashboard_tnx_basic.png" max-width="900" caption="Dashboard 처리량" %}

#### 누적 세션

**누적 세션** 값은 조회 기간동안의 누적된 세션 건수를 뜻합니다. <br/>

#### 누적 처리량

**누적 처리량** 값은 조회 기간동안의 누적된 트랜잭션 건수를 뜻합니다. <br/>

#### 세션당 평균 처리량

**세션당 평균 처리량** 값은 누적 처리량을 누적 세션으로 나눈 값을 뜻합니다. <br/> 

{% include image.html file="manage/dashboard_tnx_stats.PNG" max-width="900" caption="Dashboard 처리량" %}

#### 세션

**세션** 항목에서는 조회 기간동안 챗봇 별 세션 수 순위 및 추이를 그래프로 보여줍니다. <br/>
그래프는 조회 기간에서 선택한 시간별/일별/월별 기준으로 변화량을 확인할 수 있습니다. <br/>

{% include image.html file="manage/dashboard_session_graph.png" max-width="900" caption="Dashboard 세션 통계" %}

{% include note.html content="각 그래프 위에 마우스를 가져다 대면 챗봇명과 해당 시점의 세션 건수를 확인할 수 있습니다." %}

#### 처리량

**처리량** 항목에서는 조회 기간동안 챗봇 별 처리량 순위 및 추이를 그래프로 보여줍니다. <br/>
그래프는 조회 기간에서 선택한 시간별/일별/월별 기준으로 변화량을 확인할 수 있습니다. <br/>

{% include image.html file="manage/dashboard_tnx_graph.png" max-width="900" caption="Dashboard 처리량 통계" %}

{% include note.html content="각 그래프 위에 마우스를 가져다 대면 챗봇명과 해당 시점의 처리량을 확인할 수 있습니다." %}

#### Intent 사용빈도 Best/Worst

**Intent 사용빈도 Best/Worst** 항목에서는 조회 기간동안 Intent별 누적 추론 횟수 순위 및 추이를 그래프를 보여줍니다. 상위/하위 10개의 Intent에 대한 통계량을 확인할 수 있습니다.<br/>
그래프는 조회 기간에서 선택한 시간별/일별/월별 기준으로 변화량을 확인할 수 있습니다. <br/>

{% include image.html file="manage/dashboard_intent_count.PNG" max-width="900" caption="Dashboard 인텐트 추론 통계" %}

{% include note.html content="각 그래프 위에 마우스를 가져다 대면 챗봇명 및 Intent명과 해당 시점의 추론 횟수를 확인할 수 있습니다." %}

### 응답률
**응답률**탭에서는 다음과 같은 항목들을 확인할 수 있습니다. <br/>
 - 평균 응답률
 - 평균 추론율
 - Intent 추론율 Best
 - Intent 추론율 Worst

<br/>
**기준일자**는 해당 기간 데이터가 업데이트 된 일시를 뜻하며 Chatbot 개발자가 설정한 시간대(Timezone) 기준으로 보여집니다. <br/>

{% include image.html file="manage/dashboard_response_basic.png" max-width="900" caption="응답률 기준일자" %}

#### 평균 응답률

**평균 응답률**은 응답 건수를 전체 발화 건수로 나눈 값 입니다. 응답 건수는 챗봇이 사용자의 발화를 **Default Fallback**이 아닌 Intent로 분류한 건수를 뜻합니다. <br/>

#### 평균 추론율

**평균 추론율**은 추론율의 평균값 입니다. 추론율(Confidence)이란 챗봇이 어떠한 확률로 발화를 해당 의도로 분류했는 지를 뜻합니다. <br/>

{% include image.html file="manage/dashboard_response_avg.PNG" max-width="900" caption="평균 응답률 / 추론율" %}

#### 응답률

**응답률** 항목에서는 조회 기간에서 선택한 시간별/일별/월별 기준으로 응답률 추이를 그래프를 보여줍니다.

{% include image.html file="manage/dashboard_response_graph.PNG" max-width="900" caption="응답률 그래프" %}

{% include note.html content="각 그래프 위에 마우스를 가져다 대면 해당 시점의 응답률을 확인할 수 있습니다." %}

#### Intent 추론율 Best/Worst

**Intent 추론율 Best/Worst** 항목에서는 조회 기간동안 Intent별 평균 추론율 순위 및 추이를 그래프를 보여줍니다. 상/하위 10개의 Intent에 대한 추론을 확인할 수 있습니다.
그래프는 조회 기간에서 선택한 시간별/일별/월별 기준으로 변화량을 확인할 수 있습니다. <br/>

{% include image.html file="manage/dashboard_intent_confidence.png" max-width="900" caption="추론율 그래프" %}

{% include note.html content="각 그래프 위에 마우스를 가져다 대면 챗봇명 및 Intent명과 해당 시점의 추론율을 확인할 수 있습니다." %}
