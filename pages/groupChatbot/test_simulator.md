---
title: Simulator
tags: [test, basic, simulator]
keywords: Basic Conversation
summary: 시뮬레이터를 활용하여 Chatbot(챗봇)이 어떻게 동작하는지 확인할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: test_simulator.html
folder: groupChatbot
previous: {
    title: Fulfillment, 
    url: chatbot_setting_fulfillment.html
}
next: {
    title: Bulk Test,
    url: test_bulk.html
}
---

## Simulator
{% include callout.html content="화면 위치 : 화면의 가장 상단 우측의 아이콘 " type="default" %}

시뮬레이터(Simulator)에서는 웰컴 메세지부터 시작하여 실제로 Chatbot이 어떻게 대답하는지 확인하실 수 있습니다.

시뮬레이터에서는 현재 만들어진 Chatflow(챗플로우)가 제대로 동작하는지 테스트할 수 있습니다. 

해당 메뉴에서는 다음과 같은 내용을 이용할 수 있습니다.<br/>
 - [시뮬레이터 패널 구성](test_simulator.html#시뮬레이터-패널-구성)
 - [일반 모드](test_simulator.html#일반-모드)  
 - [Debug 모드](test_simulator.html#debug-모드)
 

## Simulator 패널 구성

{% include image.html file="simulator/00_simulator_intro_0.PNG" max-width="900" caption="시뮬레이터 패널의 구성" %}

시뮬레이터 패널 상단에는 모드 전환 버튼과 초기화 버튼이 존재합니다.

- **접기버튼** : 시뮬레이터 팝업창을 접을 수 있습니다.
- **시스템 파라미터 추가 버튼** : 시스템 파라미터를 추가할 수 있습니다. 
- **초기화 버튼** : 대화 내용을 초기화 시킵니다. Chatbot을 변경하거나 로그아웃하시면 자동으로 대화가 초기화되지만 그외의 경우에는 모든 대화내용이 유지됩니다. 대화 내용이 길어지면 초기화 시키는 것을 권장합니다.
- **모드 전환 버튼** : 테스트의 결과를 크게 일반 모드와 Debug 모드, 총 2가지 모드로 확인할 수 있습니다. 

<br/>
시뮬레이터 상단 좌측의 **+ Parameters** 버튼을 클릭 시 시뮬레이터 패널 좌측에 Parameters 창이 팝업됩니다. Parameters 창의 **Parameters 추가** 버튼을 클릭하면 하단의 테이블에 행이 추가됩니다.
Parameters에서 설정되는 파라미터들은 외부 API등과의 연계에 사용될 수 있는 사용자 측의 커스텀 파라미터입니다. (* System Entity(시스템 엔티티)와는 상관없습니다.)

{% include image.html file="simulator/00_simulator_intro_0_parameter_btn.PNG" max-width="900" caption="Parameters 추가" %}


## 일반 모드

<!-- 일반 모드 시뮬레이터 사진 -->
{% include image.html file="simulator/01_simulator_intro_1_normal_click.PNG" max-width="900" caption="Simulator - 일반모드 및 NLU Intent Analysis 팝업창" %}

일반 모드에서는 실제로 Chatbot이 내뱉는 답변을 확인할 수 있습니다. 시뮬레이터의 Debug 모드의 여부와 상관없이 Chatbot의 답변을 클릭하면 시뮬레이터 좌측에 NLU Intent Analysis 창이 팝업되면서 답변이 어떤 노드를 통하여 뱉어진 답변인지 확인할 수 있습니다. NLU Intent Analysis 팝업창에 노출되는 정보는 다음과 같습니다.

| 구분 | 설명 |
|------|------|
| Intent Name | 사용자의 발화와 매칭된 Intent의 이름을 보여줍니다. |
| Intent Type | 설정한 Chatbot의 타입(Dialogflow 또는 Chatflow)을 보여줍니다. |
| Node Name | 마지막 답변 또는 클릭된 노드의 이름을 보여줍니다. |
| Node ID | 마지막 답변 또는 클릭된 노드의 ID를 보여줍니다. |
| Context | Intent Type이 Dialogflow인 경우, 매칭된 Intent에 설정한 Contexts명을 보여줍니다. |
| Parameters | 마지막 답변 또는 클릭된 노드에서 정보를 받고자하는 파라미터를 보여줍니다. |


NLU Intent Analysis 팝업 창 상단 우측 **[Intent 상세]** 버튼을 클릭하면 해당 노드가 존재하는 Intent의 상세 화면으로 이동합니다.

NLU Intent Analysis 팝업 창 상단 우측 **[Chatflow 상세]** 버튼을 클릭하면 해당 노드가 존재하는 Chatflow의 상세 화면으로 이동합니다.

NLU Intent Analysis 팝업 창 최하단 **[Diagnostic Info]** 버튼을 클릭하면 Diagnostic Info 팝업 창이 생성되며 입력 문장에 대해 판별한 정보를 JSON 형태로 확인할 수 있습니다. 팝업 창 우측 하단의 **복사** 버튼을 클릭하면 내용을 클립보드로 복사할 수 있습니다.

{% include image.html file="simulator/01_simulator_intro_1_normal_diagnostic.PNG" max-width="900" caption="Diagnostic Info 팝업창" %}

## Debug 모드

Debug 모드는 Chatflow의 정확성이나 논리적인 오류(버그)를 찾아내는데 용이한 모드입니다. 해당 모드에서는 입력한 말에 대하여 어떤 노드를 타서 무슨 이유로 해당 답변이 나왔는지 전체 과정을 확인할 수 있습니다.

<!-- Debug 모드 시뮬레이터 사진 -->
{% include image.html file="simulator/01_simulator_intro_2_debug_flow.PNG" max-width="900" caption="Debug 모드" %}

먼저 각 노드 별로 다음과 같은 추가 정보를 확인 수 있습니다.

| 노드 종류 | 추가 정보 |
|------|------|
| Listen | 실행되는 Chatflow 명을 보여줍니다. |
| Speak | 해당 메세지가 어떤 조건에 의해 발생했는지 보여줍니다. |
| Slot | 무조건 물어보기 선택 여부 및 받은 파라미터 값을 보여줍니다. |
| Split | 어떤 조건이 선택되었는지 보여줍니다. |
| Carousel | 답변 받기를 선택했다면 무조건 물어보기 선택 여부 및 받은 파라미터 값을 보여줍니다. |
| Api | API명 및 URL을 보여줍니다. |
| Function | Function 노드 내부에서 값이 변경된 파라미터를 보여줍니다. |
| JUMP | JUMP 노드 내부에서 값이 변경된 파라미터를 보여줍니다. |

직접 만든 Chatflow 이외에 기본 설정에서 세팅한 정보에 따라 출력되는 답변에 대한 추가적인 정보 역시 쉽게 확인할 수 있습니다.

| 기본 설정 답변 종류| 추가 정보 |
|------|------|
| Default Fallback | 해당 메세지가 발생한 각종 이유를 확인할 수 있습니다. |
| Follow-up Intent | 설정한 Follow-up Intent의 깊이(depth) 레벨을 확인할 수 있습니다. | 
| 에러 메세지 | 봇이 Chatflow 타입인 경우 에러인 노드가 발생하면 Debug 모드 클릭 시 디버그 메세지를 통해 해당 노드에 대한 정보를 얻을 수 있습니다. |

### Default Fallback

 Default Fallback 메세지는 Intent에 연결된 Chatflow를 찾지 못했을 경우에 노출됩니다. 디버깅 모드 클릭 시 디버그 메세지를 통해 추론한 Intent에 대한 정보를 얻을 수 있습니다. 
 
{% include image.html file="simulator/04_simulator_defaultfallback.PNG" max-width="900" caption="Default Fallback Case" %}


### Follow-up Intent

Follow-up으로 설정된 Intent인 경우 Chatflow 명 좌측에 꺽쇠 아이콘이 표시되며, Follow-up Intent의 깊이 레벨만큼 아이콘의 개수를 확인할 수 있습니다.

{% include image.html file="simulator/02_simulator_dialogflow_followup.PNG" max-width="900" caption="Follow-up Intent 표시" %}


### 에러 메세지

Chatflow를 구성한 노드 중 에러가 발생한 경우, 해당 노드에 대해서 일반 모드에서는 에러 메세지를 표시해주며 디버깅 모드 클릭 시 디버그 메세지를 통해 에러에 대한 정보를 얻을 수 있습니다.

{% include image.html file="simulator/05_simulator_err_node.PNG" max-width="900" caption="노드에 에러가 발생한 Case" %}



이와 같이 시뮬레이터 패널을 잘 활용한다면 보다 쉽게 자연스러운 대화를 만들 수 있을 것입니다.<br/>

{% include note.html content="시뮬레이터 패널은 필요에 따라 언제든지 접고 필 수 있습니다." %}

{% include image.html file="simulator/06_simulator_open_close.PNG" max-width="900" caption="시뮬레이터 패널 여닫기" %}



<!-- #### Multi Intent 제외 설정
본 속성을 체크하는 경우 해당 Intent는 확률이 낮거나 여러 의도로 파악되더라도 버튼으로 되물어보지 않게 됩니다.
{% include image.html file="dapTalk/intent/intent_multi01.PNG" max-width="900" caption="Multi Intent 제외 설정 전" %}
{% include image.html file="dapTalk/intent/intent_multi02.PNG" max-width="900" caption="Multi Intent 제외 설정 후" %}  -->

