---
title: APIs
tags: [API, basic]
keywords: Basic Conversation
summary: Chatflow 설계에 사용할 외부 API를 등록 및 수정하는 페이지입니다.
sidebar: chatbot_doc_sidebar
permalink: api_basic.html
folder: groupChatbot
previous: {
    title: System Entity, 
    url: entity_system.html
}
next: {
    title: General,
    url: chatbot_setting.html
}
---

## API 이해하기
 {% include callout.html content="위치 : [APIs]" type="default" %}
 Chatbot(챗봇) 설계에 사용할, 사용자 등록 API를 관리하는 메뉴입니다. 
  <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[API란?](http://terms.naver.com/entry.nhn?docId=1179553&cid=40942&categoryId=32837)</span>

해당 메뉴에서는 다음과 같은 내용을 이용할 수 있습니다.<br/>
 - [API 등록/수정](api_basic.html#api-등록수정)
 - [API 등록 예시](api_basic.html#api-등록-예시)
 - [API 조회](api_basic.html#api-조회)
 - [API 업로드/다운로드](api_basic.html#api-업로드다운로드)

### API 등록/수정
신규 API를 등록을 요청 하고 수정할 수 있는 기능입니다.<br/>
(방화벽 해제가 필요없는 경우는 바로 사용 가능합니다)

하단 우측 'API 신규' 버튼을 클릭하여 API를 등록하기위한 화면을 엽니다.<br/>
(API 수정을 위해서는 API 상세 조회 화면 우측 하단 **저장** 버튼을 클릭하면 됩니다. API 수정 절차는 API 등록 절차와 같습니다)
<!-- 목록의 'API 신규' 버튼 -->
{% include image.html file="api/00_api_basic_create.PNG" max-width="900" caption="API 신규 등록 버튼" %}

API 등록 요청 화면 입니다.
<!-- API 상세화면 : API method는 POST로 한 것으로 캡처 -->
{% include image.html file="api/01_api_basic_intro.PNG" max-width="900" caption="API 등록 화면" %}

- ① API의 이름을 입력하는 란입니다.<br/>
- ② API의 설명을 입력합니다.<br/>
- ③ API의 [메서드](api_basic.html#api-메서드--request-url)를 선택합니다. (GET 또는 POST)<br/>
- ④ 요청할 API의 URL을 입력하는 란입니다.<br/>
- ⑤ 입력한 API URL로 보내는 요청의 [Header](api_basic.html#header-와-content-type) 정보를 설정하는 란입니다.<br/>
&nbsp;&nbsp;&nbsp;&nbsp; [Content-Type](api_basic.html#header-와-content-type) 은 고정값이며 현재 JSON 형태만 지원합니다.<br/>
&nbsp;&nbsp;&nbsp;&nbsp; 추가 Header 정보를 테이블 우측의 '+' 버튼으로 추가할 수 있습니다.<br/>
- ⑥ API URL로 보내는 요청의 Query Parameter 정보를 설정하는 란입니다.<br/>
&nbsp;&nbsp;&nbsp;&nbsp; API에서 요구하는 파라미터를 추가하려면 테이블 우측의 '+' 버튼을 클릭하여 추가합니다.<br/>
- ⑦ API URL에 포함 되는 Path Parameter 정보를 설정하는 란입니다.<br/>
&nbsp;&nbsp;&nbsp;&nbsp; API URL에서 요구하는 파라미터를 추가하려면 테이블 우측의 '+' 버튼을 클릭하여 추가합니다.<br/>
- ⑧ API 호출 후 사용 되는 값을 성정 하는 Body 부분 입니다. <br/>
&nbsp;&nbsp;&nbsp;&nbsp; API 메서드가 POST일 경우만 셋팅 가능 하며 추가하려면 테이블 우측의 '+' 버튼을 클릭하여 추가 하거나, Editor로 직접 입력 선택 후 JSON 형식으로 텍스트를 추가합니다.<br/>
 
#### API 메서드 / Request URL
메서드는 클라이언트와 Chatbot 서버 사이에 이루어지는 요청(Request)과 응답(Response) 데이터를 전송하는 방식입니다. 
  <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[http와 메소드](http://terms.naver.com/entry.nhn?docId=2271985&cid=51207&categoryId=51207)</span>
 - 메서드 : GET, POST 메소드를 선택합니다. 
 - Request URL : 등록 요청할 API의 URL을 입력합니다. <br/>
    예시 ) GET, http://api.openweathermap.org/data/2.5/weather   
<!-- API Method 탭 캡처 -->
{% include image.html file="api/02_api_basic_method.PNG" max-width="900" caption="API메서드" %} 
    
#### Header 와 Content Type 
Header에는 여러가지 정보를 담을 수 있습니다.
Content-Type도 그중 하나로써, 서버로 보내는 정보의 유형을 의미합니다.<br/>
현재 JSON만 지원하고 있습니다.
<!-- 현재 JSON만 지원하며 추후 XML도 지원할 예정입니다. -->   
<!-- Header 캡처 -->
{% include image.html file="api/03_api_basic_header.PNG" max-width="900" caption="Header와 Content-Type" %} 

#### Query Parameter
Chatbot 서버 측에서, API에 전송할 parameter명과 값을 설정 및 입력합니다.<br/>
Query parameter 추가시 Query parameter 입력 테이블 우측의 **+** 버튼을 클릭합니다. 
<!-- Query Parameter 캡처 -->
{% include image.html file="api/04_api_basic_query_parameter.PNG" max-width="900" caption="Query Parameter 예시" %} 

parameter 입력 후, 화면 제일 하단의 **테스트** 버튼을 클릭해, Response API에서 API 적용 실행 결과를 확인할 수 있습니다.

#### Path Parameter
API 호출시 URL에 전송할 parameter명과 값을 설정 및 입력합니다.<br/>
Path parameter 추가시 Path parameter 입력 테이블 우측의 **+** 버튼을 클릭합니다. 
<!-- Path Parameter 캡처 -->
{% include image.html file="api/05_api_basic_path_parameter.PNG" max-width="900" caption="Path Parameter 예시" %} 

parameter 입력 후, 화면 제일 하단의 **테스트** 버튼을 클릭해, Response API에서 API 적용 실행 결과를 확인할 수 있습니다.

#### Body
API 호출 후 사용 되는 값을 Body 부분에 입력 합니다.<br/>
Body에 내용 추가시 Body 입력 테이블 우측의 **+** 버튼을 클릭 하여 추가 하거나,  **JSON으로 작성** 을 토글한 후 직접 입력 합니다.  
<!-- POST 방식 선택,  Body의 에디터 버전 캡처 -->
{% include image.html file="api/06_api_basic_body1.PNG" max-width="900" caption="Body 추가 버튼 예시" %} 
<!-- POST 방식 선택,  Body의 JSON 버전 캡처 -->
{% include image.html file="api/07_api_basic_body2.PNG" max-width="900" caption="Body 직접입력  예시" %}

parameter 입력 후, 화면 제일 하단의 **테스트** 버튼을 클릭해, Response API에서 API 적용 실행 결과를 확인할 수 있습니다.

<!-- ** 수정 필요 : JSON으로 보여지고 tree는 API 노드에서 확인 가능함을 보여주기 -->
#### Response API
먼저 API를 저장한 뒤 [방화벽 차단 해제 신청](api_basic.html#방화벽-차단-해제-신청) 과정을 거친 다음에 테스트 실행 결과를 확인할 수 있습니다.<br/>
등록한 API가 제대로 실행되었을 경우, Response API에서 JSON 형태의 데이터가 조회됩니다.<br/>
API 적용 결과 조회된 데이터를 JSON형태로 조회해서 보여줍니다. 실패시 디버그 메세지 또는 아무런 데이터가 조회되지 않습니다.
<!-- API 테스트 결과 화면(JSON) -->
{% include image.html file="api/08_api_basic_response_json_2.PNG" max-width="900" caption="Response API 예시" %}
  
#### 저장
API 정보 정상 입력 후 **저장** 버튼을 클릭해, API 등록 정보를 저장합니다. 

#### 취소
{% include callout.html content="위치 : [APIs] - [API클릭] - [취소]" type="default" %}
API 상세화면의 우측 하단에 **취소**  버튼이 존재합니다.  **취소**  클릭시, API 목록화면으로 이동하고, 작성하던 정보는 삭제됩니다. 

#### 방화벽 차단 해제 신청
API를 등록한 뒤 사용하기 위해서는 먼저 방화벽 차단 해제가 완료되어야 합니다. API를 생성하고 저장하면 아래의 그림과 같이 화면 우측 하단에 '방화벽 차단 해제' 버튼이 생긴 것을 확인할 수 있습니다. 해제를 하려면 '방화벽 차단 해제' 버튼을 클릭합니다.<br/>
{% include image.html file="api/11_api_firewall_1.PNG" max-width="900" caption="API 방화벽 차단 해제 신청" %}

만일 같은 챗봇 내에서 동일한 API 또는 url가 이미 해제 신청 중일시, '방화벽 차단 해제' 버튼을 클릭하면 아래와 같은 알림 메세지 팝업이 나타납니다.
{% include image.html file="api/11_api_firewall_6.PNG" max-width="900" caption="동일 API 해제 신청 중인 경우 알림 메세지" %}

방화벽 차단 해제를 취소하고 싶다면 '방화벽 차단 해제 취소' 버튼을 클릭하면 됩니다.
{% include image.html file="api/11_api_firewall_5.PNG" max-width="900" caption="API 방화벽 차단 해제 취소" %}

방화벽 차단 해제가 되었다면 API의 상세화면에서 아래와 같이 버튼이 '방화벽 차단 해제 완료' 표시가 되면서 비활성화 됩니다.
{% include image.html file="api/11_api_firewall_4.PNG" max-width="900" caption="API 방화벽 차단 해제 완료" %}


## API 등록 예시
실제 API를 등록하고 사용하기 위해서는 사용하고자 하는 API의 사이트에서 API key 발급 및 파라미터들을 확인해야 합니다.<br/>
예시로 보이는 API는 날씨 오픈 API이며 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[여기에서](https://openweathermap.org/)</span> 확인 가능합니다.<br/>

{% include image.html file="api/00_api_basic_example_weatherAPI_1.png" max-width="900" caption="오픈 API 목록" %}<br/>

위 그림 상단의 API 카테고리로 들어가면 사용할 수 있는 API들의 목록을 볼 수 있습니다. 'API doc'로 가면 API를 사용하기 위한 상세 스펙을 확인할 수 있고 'Subscribe'로 들어가면 API 구독 및 API key를 발급받을 수 있습니다.

### API key 발급
{% include image.html file="api/00_api_basic_example_weatherAPI_2.png" max-width="900" caption="오픈 API 구독" %}<br/>
'Subscribe' 버튼을 누르고 들어가면 사용하고자 하는 요금에 맞는 것을 선택하여 구독하고 API Key를 받을 수 있습니다. 예시에서는 요금 Free로 선택하여 API key를 발급받았습니다.<br/>

{% include image.html file="api/00_api_basic_example_weatherAPI_3.png" max-width="900" caption="API key 발급" %}<br/>
key 발급 과정을 거치고 나서 화면 우측 상단의 계정명 > My API Keys로 들어가면 지금까지 발급 받은 API key 목록을 확인할 수 있습니다.<br/>

### API 상세 스펙 확인
{% include image.html file="api/00_api_basic_example_weatherAPI_4.png" max-width="900" caption="API 상세 스펙 확인" %}<br/>
API 목록에서 'API doc' 버튼을 누르고 들어가면 API를 사용하기 위해 필요한 파라미터들을 소개하고 있습니다. 
위 그림은 제공하는 기능 중 city name으로 날씨 데이터를 조회하는 예시입니다.<br/>
그림 하단의 API call은 해당 오픈 API의 url 사용 예시를 보여줍니다. 'api.openweathermap.org/data/2.5/weather?'뒤에 붙은 파라미터 'q'의 값으로 city name을 넣고 'appid'의 값으로 발급받은 API key를 넣습니다.<br/>
해당 문서의 Parameters에서는 원하는 조건에 필요한 파라미터들을 확인할 수 있고 본 챗봇 서비스에서는 Query Parameter에 등록하여 사용할 수 있습니다.
메소드의 경우 예시 url 구성 방식을 통해 GET 방식을 사용하는 것을 확인할 수 있습니다.

{% include image.html file="api/00_api_basic_example_weatherAPI.png" max-width="900" caption="API 등록 화면 예시 - 날씨 API" %}
날씨 오픈 API의 문서를 참고하여 API를 등록한 예시입니다.<br/>


## API 조회 
APIs 메뉴에 들어가면 등록한 API의 목록을 확인할 수 있습니다. 해당 목록에서는 등록한 API 이름으로 검색이 가능합니다.
<!-- API 목록 화면 -->
{% include image.html file="api/09_api_basic_list.PNG" max-width="900" caption="API 조회" %}  


## API 업로드/다운로드

Chatbot은 편의 기능의 일종으로 업로드/다운로드 기능을 제공하고 있습니다. 해당 기능은 JSON파일로 지원됩니다.<br/>

### 업로드
{% include callout.html content="화면 위치 : [APIs] > [업로드]" type="default" %}

API 목록 조회화면 우측에 **업로드** 버튼이 존재합니다. 업로드 형식에 맞추어 작성한 JSON파일을 올려주시면 자동으로 API가 생성됩니다. 업로드 파일은 다음과 같은 제약사항이 존재합니다.
 - JSON 파일만 가능합니다.
 - 동시에 여러개의 파일을 업로드할 수 있습니다.
 - 최대 파일 수 : 50, 파일 당 최대 3MB까지 업로드할 수 있습니다.
 - 파일명은 최대 50자까지 허용합니다.

<!-- 업로드 화면 -->
{% include image.html file="api/10_api_basic_upload.PNG" max-width="900" caption="API 업로드" %} 

#### 업로드 형식
입력하고자 하는 정보는 JSON 형식으로 작성이 되어야하며, 필수값에 해당하는 정보가 없거나 형식이 맞지 않으면 파일은 업로드에 실패하게 됩니다. 실제 업로드 파일은 다음과 같은 형식으로 쓰게 됩니다.

```
{%raw%}
{
  "botId" : "Chatbot Id",
  "id" : "API Id",
  "name" : "API명",
  "description" : "API 설명",
  "method" : "GET/POST",
  "url" : "입력 url",
  "contentType" : "application/json",
  "param" : [ {
    "id" : "Parameter id",
    "type" : "파라미터 타입(H(Header), P(Query), X(Path), B(Body))",
    "isRequired" : 필수 여부(true/false),
    "description" : "파라미터 설명",
    "name" : "파라미터 name",
    "value" : "파라미터 value",
    "editable" : 편집 가능 여부(true/false)
  } ]
}
{%endraw%}
```

### 다운로드
생성한 API를 JSON 파일로 다운로드 받으실 수 있습니다. Chatbot 별 전체 API 다운로드 기능과 API 별 단건 다운로드 기능을 제공하고 있습니다.

#### 단건 다운로드
{% include callout.html content="버튼 위치 : [APIs] > 특정 API 선택 > [다운로드]" type="default" %}

API 상세화면의 우측 하단에 **다운로드**  버튼이 존재하며 API 등록 이후에 생성됩니다. 단건 다운로드 시 하나의 API에 관한 정보가 JSON 파일로 저장됩니다.

#### 다건 다운로드
{% include callout.html content="버튼 위치 : [APIs] > [전체 다운로드]" type="default" %}

API 목록 조회화면 우측에 **전체다운로드** 버튼이 존재합니다. 전체 다운로드 시 Chatbot 전체 API가 JSON 파일로 저장되며 zip 파일로 압축되어 제공됩니다.
