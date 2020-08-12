---
title: API Node
tags: [intent, chatflow, advanced]
keywords: [intent, chatflow, advanced, 챗플로우, 노드, Node, API, 연계, 외부시스템]
summary: API Node를 사용하여 외부 시스템과 연계할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: intent_response_chatflow_api.html
folder: groupChatbot
previous: {
    title: Split Node,
    url: intent_response_chatflow_split.html
}
next: {
    title: Jump Node,
    url: intent_response_chatflow_jump.html
}
---

{% include warning.html content="API에 대한 기본적인 이해가 필요합니다. [APIs](api_basic.html) 페이지를 먼저 확인해주세요." %}

## API Node 란?

**API Node**란 **외부 시스템과 연계**해서 데이터를 주고 받을 수 있는 Node입니다. 날씨 정보를 가져올 수도 있고 내부 시스템의 기능을 사용할 수도 있습니다. APIs 메뉴에 등록된 API 목록을 불러와서 사용하게 됩니다. API는 RESTFul API만 지원합니다. APIs에 등록된 API가 없다면 API Node를 사용할 수 없습니다.

{% include image.html file="chatflow/node_api/01_chatflow_api_none.png" max-width="900" caption="API Node Popup - API가 존재하지 않을 때" %}

{% include note.html content="동일한 API를 여러 Chatflow에서 사용할 수 있으므로 API 정보는 APIs 메뉴에서 공통적으로 관리합니다." %}

## API Node Popup

{% include image.html file="chatflow/node_api/02_chatflow_api_node_popup.png" max-width="900" caption="API Node Popup" %}

APIs에 등록된 API 목록을 불러와 선택하면 [ 적용 ] 버튼이 활성화 됩니다. 적용 버튼을 눌러서 정상적으로 API가 동작함이 확인되면 API를 사용할 수 있습니다. 만약 API를 변경하게 되면 다시 적용 버튼을 눌러 확인해야 합니다.

//IMAGE추가 API NODE 정상 화면 |

만약 선택한 API가 오류가 난다면 사용할 수 없습니다. API 오류 여부는 APIs에 등록된 정보로 판단합니다. 해당 화면에서 테스트 했을 때 정상적으로 결과를 받았다면 API Node에서도 문제 없이 사용할 수 있습니다.

//IMAGE추가 API Node 오류화면 |

### 요청 Parameter Tab

요청 Parameter Tab에서 Request 정보를 세팅합니다. 기본적으로 APIs에 등록된 정보를 불러오며 각 API Node에서만 특별히 사용해야하는 값이 존재한다면 field를 추가해서 사용할 수 있습니다. GET 방식은 크게 Header, Query Parameter, Path Parameter를 세팅할 수 있으며 POST는 추가적으로 Body 정보를 세팅하게 됩니다. 각 영역에 대한 자세한 설명은 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[APIs](api_basic.html)</span> 설명 페이지를 참고해주세요.<br/>
각 Value 영역 중 (필수) 가 표시된 영역은 반드시 입력해줘야 하며 $paramName 형태의 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin-left:5px; margin-right: 3px;"></i>[Parameter Value](intent_response_chatflow_speak.html#답변-구성에-parameter-값-활용하기)</span>를 사용할 수도 있습니다.

//IMAGE추가 - VALUE 입력 형태 필수 확인 |

### 응답 Parameter Tab

요청을 했다면 응답이 돌아올 것입니다. 해당 응답 중 대화 내에서 사용해야하는 정보가 있을 경우 응답 Parameter Tab에서 정보를 받기 위한 설정을 합니다. 응답 Parameter Tab에서는 2가지 영역을 확인할 수 있습니다.

#### API Tree

API Tree는 응답 결과를 Tree 형태로 그린 영역 입니다. 해당 응답 결과는 응답 Parameter Tab에서 설정한 값이 아니라 APIs에서 세팅한 정보로 Request를 던졌을 때 받은 결과입니다. [+] 버튼이 존재한다면 하위 Level의 결과가 존재함을 의미합니다. [+] 버튼을 누르면 확장된 결과 Tree를 확인할 수 있습니다. 문서 형태의 Key에 마우스를 가져가면 실제 값이 보입니다. 이 값 역시 APIs에서 설정했던 Test 데이터를 기반으로 한 값입니다.

#### 출력 Parameter

다른 페이지에서 계속 설명했던 것과 같이 정보를 담는 껍데기는 Parameter 입니다. 그렇기 때문에 받은 정보를 사용하기 위해서는 우선 [Parameter 추가] 버튼을 클릭해서 정보를 받을 Parameter를 추가해줘야 합니다. Intent와 Chatflow Parameter 모두 선택할 수 있지만 보통 Intent Parameter는 담을 수 있는 정보가 제한되어 있고 추론에 영향을 미칠 수 있기 때문에 이러한 외부 정보를 담는 역할로는 Chatflow Parameter를 많이 사용합니다.

//IMAGE- Parameter 추가 , 추가된 모습 |

정보를 담을 Parameter를 추가하였다면 어떤 정보를 담을 건지를 선택해야 합니다. 우측 API Tree에서 Key를 Drag해서 Value 영역에 Drop 해주면 자동으로 JSON Path가 나타나는 것을 확인할 수 있습니다. 직접 사용자가 입력할 수도 있으나 Path가 정상적이지 않을 경우 오류가 발생할 수 있습니다.

<!-- ## API Node 활용하기

(날씨 문의) -->