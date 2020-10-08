---
title: Chatflow 기본
tags: [intent, chatflow, basic]
keywords: [intent, chatflow, basic, 챗플로우, 기본, 업로드, 다운로드]
summary: Intent 답변유형 중 두 번 째, Chatflow를 이해하고 기본적인 Chatflow Design Panel을 사용하는 방법을 익힙니다.
sidebar: chatbot_doc_sidebar
permalink: intent_response_chatflow.html
folder: groupChatbot
previous: {
    title: Intent 답변유형 - Dialogflow, 
    url: intent_response_dialogflow.html
}
next: {
    title: Listen Node,
    url: intent_response_chatflow_listen.html
}
---

## Chatflow
{% include callout.html content="화면 위치 : [Intents] > 특정 Intent의 Chatflow> 선택 또는 Chatflow Type Intent 선택 > [Chatflow> 버튼]" type="default" %}

Intent 답변 유형 중 두 번 째 **Chatflow**에 대해 알아보겠습니다. **Chatflow(챗플로우)**란, Singlex Chatbot Platform에서 제공하는 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>*[DM(Dialog Manager)](index.html#chatbot-용어-알기)*</span>을 지칭하는 단어입니다.<br/><br/> 
사람과 사람간의 대화에는 이야기 흐름이 있습니다. 처음에 인사를 하고 안부를 묻고 둘 사이의 관심사 등에 대해서 서로 이야기를 진행해 나가듯이 대화 과정에서 하나하나의 이야기 단위들이 (인사, 날씨문의, 취미 등) 모여 대화의 흐름을 구성하게 됩니다. 각 의도마다 제각각의 흐름이 만들어질 수 있습니다. 이런 하나하나의 흐름을 Chatflow라 부르고 Chatflow를 간단하게 만들 수 있는 도구로 Chatflow Design Panel을 제공하고 있습니다.

### Chatflow 용어 이해

본격적으로 Chatflow를 만들기 앞서, 설명의 용이성을 위해 Chatflow와 관련되어 사용되는 용어에 대해 간단히 정리하겠습니다.

| 용어 | 설명 |
|-------------|-------------|
| **Chatflow Design Panel** | 대화의 흐름을 Flow Chart 형태로 그릴 수 있는 도구입니다. |
| **Node(노드)** | Chatflow를 구성하는 단위. 답변을 구성하는 Node와 비지니스 로직을 처리할 수 있는 기능성 Node가 존재합니다. |
| **Chatflow Parameter** |  원하는 데이터를 담고 조작하기 위한 껍데기.<br/> Intent 화면에서 등록하는 Parameter와 유사합니다. 단, Chatflow 내에서만 사용됩니다. |

#### Chatflow Design Panel

Chatflow 화면 진입시 다음과 같은 화면이 보입니다.

{% include image.html file="chatflow/basic/01_chatflow_basic_init.png" max-width="900" caption="Chatflow Design Panel" %}

첫 진입시 Listen Node, Speak Node라고 적힌 두 개의 Node가 그려져있는 것을 확인할 수 있습니다. 이 두 개의 Node가 올려진 격자무늬 영역을 Design Panel이라 부릅니다. [자세한 사용법](intent_response_chatflow.html#chatflow-design-panel-사용법)은 아래에서 확인할 수 있습니다.

#### Chatflow Node

Chatflow Node에는 여러가지 종류가 있습니다. 각 Node별로 기능이 다르기 때문에 각 Node가 어떤 역할을 하는지 알아야할 필요가 있습니다.

| Node 종류 | 기능 |
|------|------|
| **[Listen Node](intent_response_chatflow_listen.html)** | 현재 대화의 시작점을 표시합니다. Intent당 1개만 존재하며 임의로 삭제/추가할 수 없습니다. |
| **[Speak Node](intent_response_chatflow_speak.html)** | 사용자의 발화에 대한 답변을 구성합니다. 텍스트, 이미지, 버튼, 카드 등 다양한 UI로 구성할 수 있습니다. |
| **[Slot Node](intent_response_chatflow_slot.html)** | 추가적인 정보를 얻기 위해 사용자에게 답변을 요청합니다. Speak Node와 동일하게 다양한 UI로 구성할 수 있습니다. |
| **[Split Node](intent_response_chatflow_split.html)** | 조건에 따라 대화를 분기시킵니다. 다양한 조건을 설정할 수 있습니다. |
| **[Jump Node](intent_response_chatflow_jump.html)** | 서로 다른 흐름을 연결합니다. 즉, 다른 Intent의 답변을 추가적으로 내보낼 수 있도록 자연스럽게 연결합니다. |
| **[API Node](intent_response_chatflow_api.html)** | 외부 시스템을 연계하여 데이터를 받아옵니다. |
| **[Function Node](intent_response_chatflow_function.html)** | 더 풍부한 데이터 처리를 위하여 Javascript를 지원합니다. |

{% include tip.html content="Node 종류 부분을 클릭하시면 각 Node에 대한 상세 사용법 설명 페이지로 넘어갑니다." %}

각 노드의 역할을 그룹 지어보면 다음과 같이 나눌 수 있습니다.

| 구분 | 설명 | Node 종류 |
|------|------|------|
| 시작 | 현재 대화흐름의 시작점을 표시 | Listen Node |
| 답변 | 사용자가 볼 수 있는 답변을 구성 | Speak Node, Slot Node |
| 대기 | 사용자의 대답을 요구하고 기다림 | Slot Node |
| 기능 | 내부적으로 데이터를 판단/조작하는 등 비지니스 로직을 처리 | Split Node, Jump Node, API Node, Function Node |


#### Chatflow Parameter

**Chatflow Parameter**는 Intent 화면 내에서 등록하는 [Parameter](연결필요)와 유사한 기능을 합니다. 단, 등록되는 모든 Parameter가 sys.any type으로, 담을 수 있는 정보에 제한이 없으며 현재 Chatflow 내에서만 사용됩니다. 주로 API를 통해 받아온 데이터를 담아서 처리하거나 현재 Chatflow 내에서만 관리해야할 정보를 담아두는데 사용합니다. 자세한 사용법은 각 Node 별 설명 페이지에서 확인할 수 있습니다. 대표적인 사용법 이해를 위해 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[Speak Node](intent_response_chatflow_speak.html#parameter-사용하기)</span> 설명 페이지를 참조하세요.

##### Chatflow Parameter 등록하기

Chatflow Design Panel 우측 상단 ***[+ Parameter 추가]*** 버튼을 선택 하면 Chatflow Parameter를 등록할 수 있습니다. 또한 현재 Intent Parameters Tab에서 Intent Parameter 정보 역시 확인할 수 있습니다.

{% include image.html file="chatflow/basic/02_chatflow_basic_parameter.png" max-width="900" caption="Parameter 추가 Popup Chatflow Parameter Tab(상), Intent Parameter Tab(하)" %}

Chatflow Parameter 등록 시 총 3가지 정보를 확인/수정할 수 있습니다.

| Key | 수정가능 | 필수 | 설명 |
|------|------|------|--------|
| Parameter | Y | Y | Parameter 명을 설정합니다. |
| Value | N | - | Parameter에 담긴 데이터를 사용하기 위한 형태입니다. 자동으로 완성됩니다. |
| Default Value | Y | N | 해당 Parameter에 담길 첫 데이터를 설정합니다. 설정하지 않으면 빈 값으로 인식합니다. |

Parameter명을 정의할 때에는 다음과 같은 제약사항이 존재합니다.

- 현재 Intent 내에 등록된 모든 종류의 Parameter는 이름이 중복될 수 없습니다.
- sys는 Parameter명으로 사용할 수 없습니다.
- 한글, 영문, _ , 숫자만 입력할 수 있습니다.
- 최대 30자까지 입력할 수 있습니다.
<br/>
Chatflow Parameter 테이블 최우측, [+] 버튼을 누르면 등록할 Parameter를 추가할 수 있습니다.

#### Chatflow System Parameter

Intent 답변을 Chatflow로 구성할 때의 장점 중 하나는 Chatflow만이 파악 가능한 System Parameter를 사용할 수 있다는 것입니다. Chatflow System Parameter 종류는 다음과 같습니다.

| Parameter명 | 설명 | 정보유형 | 
|------------|--------|
| **sys.message** | 사용자 발화문이 원형 그대로 담겨 있습니다. | 텍스트 |
| **sys.chatbotName** | 현재 챗봇명이 담겨 있습니다. | 텍스트 |
| **sys.channelName** | 사용자가 진입한 Channel명이 담겨 있습니다. | KAKAOTALK, FACEBOOK, DEFAULT 중 1 |
| **sys.sessionId** | 현재 대화 Session의 ID가 담겨 있습니다. | 텍스트 |
| **sys.userId** | 현재 대화 중인 사용자의 ID가 담겨 있습니다. | 텍스트 |
| **sys.languageCode** | 현재 대화 중인 사용자의 언어권이 담겨 있습니다. | ko, en 등 |
| **sys.sentiment** | 감정분석 결과가 담겨있습니다. | · -1 ~ 1. 소수점 첫째자리까지 사용<br/>· -1에 가까울 수록 부정, 1에 가까울 수록 긍정.<br/><span class="preference">※ 단, **감정분석 서비스 미사용**시 **0.0**으로 고정</span> | 

### Chatflow Design Panel 사용법

Singlex Chatbot Platform에서는 대화의 흐름을 Flow Chart 형태로 그릴 수 있도록 **Chatflow Design Panel**을 지원하고 있습니다. Chatflow Design Panel을 통해 코딩을 할 줄 몰라도 마우스 클릭과 드래그만으로 풍부한 대화를 만들어낼 수 있습니다. 모든 흐름은 Node를 기준으로 만들어 집니다.

#### Node 추가

Chatflow Design Panel 상단 Node 종류로 구분된 버튼이 존재합니다. 추가를 원하는 Node 버튼을 클릭하면 신규 Node가 생성됩니다.

{% include image.html file="chatflow/basic/03_chatflow_basic_node_append.png" max-width="900" caption="Node 추가 버튼" %}

#### Node 연결

대화의 흐름을 만들기 위해서는 여러 기능을 하는 Node를 원하는 순서로 연결해야 합니다. Node 양쪽 작은 Circle이 연결점이 됩니다. Node간 연결점을 드래그해서 연결할 수 있습니다. 이때 왼쪽이 Node의 시작, 오른쪽이 Node의 끝으로 서로 다른 Node의 시작과 끝을 연결해주어야 합니다. Split Node를 제외한 나머지 Node는 하나의 연결만 허용합니다.

{% include image.html file="chatflow/basic/04_chatflow_basic_node_trans_line.png" max-width="900" caption="Node 연결 방법" %}

#### Node 선택/삭제/복사

{% include image.html file="chatflow/basic/05_chatflow_basic_node_select.png" max-width="900" caption="Node 단일 선택(좌), Node명 변경(중), Node 다중 선택(우)" %}

Node 박스를 클릭하면 해당 Node가 선택된 상태가 됩니다. 혹은 Design Panel 내에서 영역을 드래그하면 해당 영역 내의 Node를 다중 선택할 수 있습니다. 단일 Node 선택 시 다양한 Icon을 확인할 수 있습니다. 각 Icon의 역할은 다음과 같습니다.

<table>
    <thead>
        <tr class="header">
            <th>아이콘</th>
            <th>기능</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="prefaceAudienceLabel">{% include inline_image.html file="chatflow/icon/lg-chatflow-copy.svg" %}</td>
            <td>선택된 Node를 복사</td>
        </tr>
        <tr>
            <td class="prefaceAudienceLabel">{% include inline_image.html file="chatflow/icon/lg-chatflow-del.svg" %}</td>
            <td>선택된 Node를 삭제</td>
        </tr>
        <tr>
            <td class="prefaceAudienceLabel">{% include inline_image.html file="chatflow/icon/lg-chatflow-write.svg" width=15 %}</td>
            <td>선택된 Node의 이름을 변경</td>
        </tr>
    </tbody>
</table>

Node 선택 상태에서는 Node의 이름을 변경할 수 있습니다. 선택을 해제하거나 {% include inline_image.html file="chatflow/icon/lg-chatflow-text-write.svg" width=15 %} 버튼 클릭, 또는 Enter를 누르면 Node명 변경이 완료됩니다. Node 명은 최대 30자까지 입력할 수 있습니다.

#### Node 내용 편집

단일 Node를 선택해서 더블 클릭하면 Node의 상세 내용을 편집할 수 있는 Popup이 뜹니다. 각각의 Popup에서 설정할 수 있는 내용은 각 Node별 상세 설명 Page를 확인하세요.

#### Keyboard Shortcut

Chatflow를 그릴 때 작업 효율성을 높이기 위해 Keyboard 단축키를 제공하고 있습니다.

| shortcut | 설명 |
|----------|-----|
| Node 선택 - `Delete` | 선택한 Node를 삭제 |
| Node 선택 - `Ctrl + c` | 선택한 Node와 연결선은 복사 |
| `Ctrl + v` | 복사한 Node 붙여넣기 |
| `Ctrl + z` | Node 삭제, 생성 등의 작업을 이전 상태로 되돌림. 최대 10회. |

### Chatflow 업로드/다운로드

Chatflow를 좀 더 쉽게 만들 수 있도록 현재 화면에 그려진 Chatflow를 파일로 다운로드해서 다른 Chatflow에 업로드할 수 있는 기능을 제공하고 있습니다. 본 기능은 다음과 같은 상황에서 유용하게 사용할 수 있습니다.

- 현재 그린 Chatflow 정보 임시 Backup 할 때
- Chatflow 구성을 동일하게 사용할 다른 Chatflow로 복사 할 때
- 다른 Chatbot에 Chatflow 정보를 그대로 옮길 때

#### Chatflow 다운로드

Chatflow Design Panel 하단에 다운로드 버튼을 클릭하면 현재 그려진 Chatflow의 정보를 json 파일로 내려받습니다. 즉, 저장하지 않아도 현재 그러진 정보를 전부 옮길 수 있습니다.<br/>
json 파일 정보는 다음과 같습니다.

##### 다운로드 정보

| Key | Type | 필수여부 | 설명 |
|------|-----|------|-----|
| `nodeList` | `Array` | Y | 현재 그려진 전체 Node 목록과 세부 내용을 포함합니다. |
| `parameterList` | `Array` | N | 현재 Chatflow에 등록된 모든 Parameter 정보를 포함합니다. |

- nodeList

| Key | Type | 필수여부 | 설명 |
|------|-----|------|-----|
| `nodeId` | `String` | Y | Node의 Id. 연결 정보 등을 구분하기 위함. |
| `nodeType` | `String` | Y | Node의 종류. 허용값 : speak, slot, split, api, jump, function |
| `name` | `String` | Y | Node명. 존재하지 않을 시 nodeType으로 자동 생성 |
| `startNode` | `Boolean` | Y | Listen Node 다음에 연결되는 node 여부. 즉, 시작 바로 직후 Node 여부를 의미. |
| `jumpIntentName` | `String` | N | Jump Node 전용 |
| `nodeItemList` | `Array` | N | Node별 상세 내용 |
| `positionInfo` | `String` | Y | Node의 위치 표시. 정상적이지 않을 경우 Node를 그릴 수 없습니다. |
| `relationInfo` | `String` | N | Node간 연결 정보. 존재 하지 않을 경우 다음 Node가 연결되지 않은 것으로 봅니다. |

- parameterList

| Key | Type | 필수여부 | 설명 |
|------|-----|------|-----|
| `paramId` | `String` | Y | Parameter의 Id값. Node 내에서 활용될 때 확인 |
| `name` | `String` | Y | Parameter명. 허용되지 않는 문자는 자동 삭제. |
| `defaultValue` | `String` | N | Parameter의 기본 값 |

{% include warning.html content="다운로드 받은 내용을 임의로 수정하여 업로드하면 데이터가 누락될 수 있습니다." %}

#### Chatflow 업로드

Chatflow Design Panel 하단 업로드 버튼을 클릭하면 파일 업로드 Popup이 열립니다.

{% include image.html file="chatflow/basic/06_chatflow_basic_update.png" max-width="900" caption="Chatflow Upload Popup" %}


다운로드 받은 파일을 선택하여 업로드 하면 파일 내의 정보를 토대로 Chatflow를 그리게 됩니다. 단, 현재 그려진 Chatflow 정보는 모두 삭제됩니다. 파일 내에 비정상적인 정보가 존재할 경우 Node, Parameter가 등록되지 않을 수 있으며 확인 후 수정이 가능한 영역은 비정상 영역으로 표시됩니다.

#### 비정상 Node 확인

Node 위에 {% include inline_image.html file="chatflow/icon/lg-chatflow-help.svg" width=15 %} 아이콘이 존재하면 해당 Node 상세 내용 중 비정상적인 내용이 존재함을 의미합니다. 해당 Icon이 Chatflow Design Panel에서 보이면 그 Chatflow는 저장할 수 없습니다. 반드시 Node 상세 내용을 확인하고 수정 후 저장해주세요.

{% include image.html file="chatflow/basic/07_chatflow_basic_invalid_node.png" max-width="900" caption="비정상 Node 확인" %}

