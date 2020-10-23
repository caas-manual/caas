---
title: Front UI
tags: [Front UI,channel,advanced]
keywords: Basic Conversation
summary:  간단한 설정으로 Singlex Chatbot에서 제공하는 챗봇 UI를 사용할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: channel_front_ui.html
folder: groupChatbot
previous: {
    title: Native App(API), 
    url: channel_native_app.html
}
next: {
    title: Facebook,
    url: channel_facebook.html
}
---
## Front UI
Singlex Chatbot은 고객 웹사이트에 삽입할 수 있는 맞춤설정 가능한 챗봇 UI를 제공합니다.<br/>
고객 웹사이트에 삽입하여 적용을 하거나 별도의 URL로 제공되어 필요에 맞게 사용하실 수 있습니다.<br/>

Front UI를 웹사이트에 활용하는 과정을 간략히 표현하면 다음과 같습니다.
{% include image.html file="channel/front/front_ui_process.png" max-width="900" caption="Front UI Process" %}

 - 고객 사이트에서 Front UI 사용을 위해 인증 토큰 정보를 인증 서버로 요청합니다.
 - 인증 토큰 정보 요청 시에는 고객 계약정보를 전송합니다.
 - 올바른 인증 요청 정보가 확인되면 인증 서버에서 인증 토큰 정보를 발급합니다.
 - 인증 서버로 부터 받아온 인증 토큰 정보를 설정하여 Front UI를 호출합니다.
 - Front UI는 설정된 인증 토큰 정보를 기반으로 챗봇 서버와 통신합니다.

<br/>

### Front UI 사용 설정
{% include callout.html content="화면 위치 : [Settings] > [Chatbot Front UI]" type="default" %}
Chatbot Front UI 사용을 위한 설정 정보를 선택 한 후 “저장” 버튼을 클릭합니다. <br/>
설정한 정보에 맞게 Front UI 사용을 위한 기본 설정이 저장됩니다.

#### 기본 정보
General 탭에서는 Front UI의 기본 설정 및 사용할 수 있는 기능을 설정할 수 있습니다.<br/>

 - **Front UI URL** : Front UI 사용을 위해 제공되는 URL 정보
 - **Front UI Title** : Front UI 상단에 표시되는 챗봇 Title 정보
 - **Welcome Intent 사용여부** : Front UI 최초 실행 시 Welcome Intent를 자동 실행할지 여부 설정
 - **챗봇 피드백 사용여부** : 챗봇에 대한 사용자 피드백을 입력 받을지 여부 설정
 - **응답 피드백 사용여부** : 대화 응답에 대한 사용자 피드백을 입력 받을지 여부 설정
 - **대화 이력 조회 사용여부** : 사용자의 이전 대화 이력 조회 기능을 사용할 지 여부 설정
 <!-- - **Short-cut 사용여부** : 편의 기능 (지도, 검색) 기능을 사용할 지 여부 설정 -->
{% include image.html file="channel/front/front_ui.png" max-width="900" caption="Front UI" %}

#### Style
Style 탭에서는 Front UI의 디자인을 사용할 사이트에 맞는 색상 및 로고를 적용하실 수 있습니다.<br/>

 - **챗봇 로고 이미지** : Front UI 상단에 사용할 로고 이미지 URL 정보
 - **챗봇 아이콘 이미지** : Front UI 챗봇 응답에 표시되는 로고 이미지 URL 정보
 - **색상** : Front UI 챗봇의 각 항목의 색상을 원하는 색상으로 설정할 수 있습니다.

{% include image.html file="channel/front/front_ui_style.png" max-width="900" caption="Front UI Style" %} 

#### Custom CSS
Front UI의 스타일을 원하는 설정으로 변경할 수 있도록 CSS 코드를 직접 입력하는 기능을 제공합니다.<br/>
입력된 CSS 코드가 설정되어 실행됩니다.

#### Custom Javascript
Front UI에서 직접 자바스크립트 코드를 추가하여 원하는 이벤트를 실행할 수 있도록 기능을 제공합니다.<br/>
입력된 Javascript 코드를 실행할 수 있는 환경을 제공합니다.

#### Quick Link
Front UI의 화면 하단에 자주 사용하는 질문에 대한 빠른 응답 구성을 위한 링크 기능을 제공합니다.<br/>
최대 10개까지 구성이 가능하며 Text, Web Link, Intent 호출, 전화걸기 기능을 제공합니다.

{% include image.html file="channel/front/front_ui_quick.png" max-width="900" caption="Front UI Quick Link" %}
<br/>

### Front UI URL 직접 호출
Chatbot Front UI를 직접 접근 가능한 URL을 제공합니다.<br/>
접근 가능한 URL 정보는 Chatbot Front UI 메뉴에서 확인 가능합니다.
{% include image.html file="channel/front/front_ui_url.png" max-width="900" caption="Front UI URL" %}

URL 호출은 POST 호출만 가능합니다. <br/>

| Field | Information |
|--------|--------|
| URL | https://chatclient.ai.lgstation.com/챗봇ID/chat |
| METHOD | POST |

{% include note.html content="<br>Front UI 사용을 위해서는 인증 토큰 정보를 파라미터로 전송해야 합니다.<br>
인증 토큰 정보 발급은 하단 인증 토큰 받아오기 항목을 참조 바랍니다." %}

#### REQUEST Parameters 정보

| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| token | String | Yes | 챗봇 대화 호출을 위한 인증 토큰 정보 |
| languageCode | String | Yes | 챗봇 사용 언어 정보 (ko, en) |
| userId | String | No | 챗봇 사용자 구분값 정보 |

##### URL 호출 Html 샘플 코드

```html
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>Front UI 호출</title>
  <script>
    function openChatWindow() {
      
		var chatbotId = "9b317f98-919a-49a4";
		var languageCode = "ko";
		var token = "9b317f98-919a-49a49b317f98-919a-49a49b317f98-919a-49a4";
		var userId = "hong";

		var url = "https://chatclient.ai.lgstation.com/" + chatbotId + "/chat";

		var win = window.open("about:blank", "chatClientPop", "width=500,height=600");
		win.focus();
		
		var form = document.createElement("form");
		form.setAttribute("target", "chatClientPop");
		form.setAttribute("method", "POST");
		form.setAttribute("action", url);

		var param = null;

		obj = document.createElement("input");
		obj.setAttribute("type", "hidden");
		obj.setAttribute("name", "token");
		obj.setAttribute("value", token);
		form.appendChild(obj);

		obj = document.createElement("input");
		obj.setAttribute("type", "hidden");
		obj.setAttribute("name", "languageCode");
		obj.setAttribute("value", languageCode);
		form.appendChild(obj);
		
		obj = document.createElement("input");
		obj.setAttribute("type", "hidden");
		obj.setAttribute("name", "userId");
		obj.setAttribute("value", userId);
		form.appendChild(obj);

		document.body.appendChild(form);

		form.submit();
	  
    }
  </script>
</head>
<body>
  <input type="button" name="openChatWindow" value="Front UI 오픈">
</body>
</html>
``` 


### Front UI Embedding 코드 삽입
Chatbot Front UI를 임베딩 코드를 이용하여 사용할 사이트에 적용하여 사용할 수 있습니다.<br/>

{% include note.html content="<br>Front UI 사용을 위해서는 인증 토큰 정보를 파라미터로 전송해야 합니다.<br>
인증 토큰 정보 발급은 하단 인증 토큰 받아오기 항목을 참조 바랍니다." %}

#### REQUEST Parameters 정보

| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| token | String | Yes | 챗봇 대화 호출을 위한 인증 토큰 정보 |
| languageCode | String | Yes | 챗봇 사용 언어 정보 (ko, en) |
| userId | String | No | 챗봇 사용자 구분값 정보 |

##### URL 호출 Html 샘플 코드

```html
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>Front UI 호출</title>
  <script>

    var chatContainer = document.getElementById("caas-chatbot-container"),
	    launcher = document.getElementById("caas-chatbot-launcher"),
	    chatPannel = document.getElementById("caas-chatbot-chat"),
	    fullClose = document.getElementById("caas-chatbot-launcher-closeicon"),
	    fullscreenClose = document.getElementById("caas-chatbot-fullscreen-close");

	launcher.addEventListener("click", function(e){
	    e.preventDefault();
	    
	    if (launcher.classList.contains("active")) {
	    	launcher.classList.remove("active");
	    	chatPannel.classList.remove("show");
	    } else {
	    	launcher.classList.add("active");
	    	chatPannel.classList.add("show");
	    	
	    	if (!document.getElementById("caas-chatbot-chat-iframe").isLoaded) {
	    		document.getElementById("caas-chatbot-chat-iframe").isLoaded = true;
		    	openChatFrame();
	    	}
	    }
	}, false);
	
	fullscreenClose.addEventListener("click", function(e){
	    e.preventDefault();
	    launcher.classList.remove("active");
	    chatPannel.classList.remove("show");
	}, false);
	
	fullClose.addEventListener("click", function(e){
	    e.preventDefault();
	    chatContainer.innerHTML = ""
	}, false);

    function openChatFrame() {
      
		var chatbotId = "9b317f98-919a-49a4";
		var languageCode = "ko";
		var token = "9b317f98-919a-49a49b317f98-919a-49a49b317f98-919a-49a4";
		var userId = "hong";
		var url = "https://chatclient.ai.lgstation.com/" + chatbotId + "/chat";

		var form = document.createElement("form");
		form.setAttribute("target", "caas-chatbot-chat-iframe");
		form.setAttribute("method", "POST");
		form.setAttribute("action", url);

		var param = null;

		obj = document.createElement("input");
		obj.setAttribute("type", "hidden");
		obj.setAttribute("name", "languageCode");
	    obj.setAttribute("value", languageCode);
	    form.appendChild(obj);

		obj = document.createElement("input");
		obj.setAttribute("type", "hidden");
		obj.setAttribute("name", "token");
	    obj.setAttribute("value", token);
	    form.appendChild(obj);

	    if (userId) {
			obj = document.createElement("input");
			obj.setAttribute("type", "hidden");
			obj.setAttribute("name", "userId");
		    obj.setAttribute("value", userId);
		    form.appendChild(obj);
	
		    document.body.appendChild(form);
	    }

        form.submit();

	    setTimeout(function() { form.parentNode.removeChild(form); }, 1000);
	  
    }
  </script>
</head>
<body>
  <div id="caas-chatbot-container" class="position-right-bottom">
    <div class="caas-chatbot-chat" id="caas-chatbot-chat">
        <div class="caas-chatbot-fullscreen-close" id="caas-chatbot-fullscreen-close">
            <img src="https://chatclient-stg.ai.lgstation.com/assets/img/fold_close.png">
        </div>
        <iframe id="caas-chatbot-chat-iframe" name="caas-chatbot-chat-iframe" src="about:blank" allow="microphone; autoplay" allowusermedia="true" style="position: relative!important;height:100%!important;width: 100%!important;border: none!important;"></iframe>
    </div>
    <div id="caas-chatbot-talkpop" class="caas-chatbot-talkpop talk" style="display: none;">
        <span id="caas-chatbot-talkpop-close" class="caas-chatbot-talkpop-close"></span>
        <span id="caas-chatbot-talkpop-message" class="caas-chatbot-talkpop-message">message</span>
    </div>

    <div class="caas-chatbot-launcher" id="caas-chatbot-launcher">
        <div id="caas-chatbot-launcher-closeicon" class="caas-chatbot-launcher-closeicon"></div>
        <div id="caas-chatbot-btn-wrap" class="caas-chatbot-btn-wrap">
            <div class="caas-chatbot-launcher-close-icon">
                <img src="https://chatclient-stg.ai.lgstation.com/assets/img/foldx40_close.png">
            </div>
            <div class="caas-chatbot-launcher-open-icon">
                <img src="https://chatclient-stg.ai.lgstation.com/assets/img/foldx40_chat.png">
            </div>
        </div>
    </div>
  </div>
</body>
</html>
``` 
<br/>

### 인증 토큰 받아오기
Chatbot Front UI를 사용하기 위해서는 인증 토큰 정보가 필요합니다.<br/>
인증 토큰 정보는 AI 서비스 포탈의 계약번호와 서비스 인증키를 파라미터로 담아 POST로 요청합니다.<br/>
요청 성공 시, 응답은 JSON 객체로 전달되며, 전달 받은 인증 토큰 정보를 사용하여 Front UI를 사용할 수 있습니다.

{% include warning.html content="<br>인증 토큰 정보 호출 시에 계약 정보와 인증키 정보를 파라미터로 보내기 때문에 보안에 유의해야 하므로<br>
인증 토큰 정보를 받아오는 기능은 서버에서 호출하여 구현하기 바랍니다." %}

{% include image.html file="channel/front/front_ui_token.png" max-width="900" caption="인증 토큰 파라미터" %}

#### 인증 토큰 요청 정보

| Field | Information |
|--------|--------|
| URL | https://eapi.lgstation.com/auth/api/reg
| METHOD | POST |
| HEADER | "Content-Type" : "application/json;" |

#### REQUEST 정보

```json
{
	"id":"string",
	"password":"string"
}
```

| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| id | String | Yes | AI 서비스 포탈 계약 번호 |
| password | String | Yes | AI 서비스 포탈 서비스 인증키 |

#### RESPONSE 정보

```json
{
	"status":"string",
	"result":"string",
    "message":"string"
}
```

| KEY | TYPE | Required | Description |
|--------|--------|--------|--------|
| status | String | Yes | 응답 상태 코드 |
| result | String | Yes | 인증 토큰 정보 |
| message | String | Yes | 기타 메시지 |

##### 인증 토큰 요청 예시

 * 토큰 요청 예시 : REQUEST

```json
{
	"id":"SUBXXX1000000000000000",
	"password":"xYo6OgZ3PZ07yfnyunXijviJFI76dxnYhek987ytgVFREDFJK<LdaeYeylIxA=="
}
``` 

 * 토큰 응답 예시 : RESPONSE

```json
{
	"status": 200,
	"message": "",
	"result": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhaS1qd3QtZ2VuZXJhdGUiLCJhdWQiOlsiYXVkaWVuY2UxIiwiYXVkaWVuY2UyIl0sInBhc3N3b3JkIjoiXC90bmRZVXVvNk9nWjNQWjA3eWZYT1RwVm9pNVRJRmFuT1Q1dUoxYU00SXBZOEFPKzg1MHZoaDc2OUxlRWZtdDJBRVlTZmVCSHA0c2FzM0VCZXlsSXhBPT0iLCJpc3MiOiJ1cm46XC9cL2FwaWdlZS1lZGdlLUpXVC1wb2xpY3ktYWkiLCJpZCI6IlNVQlNDUjE2MDE5NTAwMTQ4NDYiLCJleHAiOjE2MDM0MTEzMjgsImlhdCI6MTYwMzMyNDkyOCwianRpIjoiYTAxYjg4MzktYTA1My00ZTg3LWE3YmUtYWE0YjFiMmQ2MGZiIn0.1Sn3UR2XRVxzRP_8XCVa00RbwpQBgIkDhDJVhVb8L0g"
}
``` 

<br/>

#### 인증 토큰 정보 받아오기 Java 예제

```java
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;


public class TokenSample {
    public static void main(String[] args){
        String id = "SUBXXX1000000000";// AI 서비스 포탈 계약 번호 (예시)
        String password = "xxxxYUDKHJFLxxxxxxAEYdddddylIxYYYYYYDDDDDDDDDDDDA=="; // AI 서비스 포탈 서비스 인증키 (예시)
       
        String apiURL = "https://eapi.lgstation.com/auth/api/reg";
            
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Content-Type", "application/json");

        String requestBody = "{\"id\":\""+id+"\", \"password\":\""+password+"\"}";                   

        String responseBody = post(apiURL, requestHeaders, requestBody);

        System.out.println(responseBody);
    }

    private static String post(String apiUrl, Map<String, String> requestHeaders, String requestBody) {
        HttpURLConnection con = connect(apiUrl);

        try {
            con.setRequestMethod("POST");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            con.setDoOutput(true);
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(requestBody.getBytes());
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                return readBody(con.getInputStream());
            } else {  // 에러 응답
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect(); // Connection을 재활용할 필요가 없는 프로세스일 경우
        }
    }

    private static HttpURLConnection connect(String apiUrl) {
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection) url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body) {
        InputStreamReader streamReader = new InputStreamReader(body, StandardCharsets.UTF_8);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
 
}
``` 
<br/>

#### 인증 토큰 정보 받아오기 Node.js 예제

```javascript
var request = require('request');
var id = 'SUBXXX1000000000';
var password = 'xxxxYUDKHJFLxxxxxxAEYdddddylIxYYYYYYDDDDDDDDDDDDA';
var api_url = 'https://eapi.lgstation.com/auth/api/reg';
var request_body = {
    "id": id,
    "password": password
};

request.post({
        url: api_url,
        body: JSON.stringify(request_body),
        headers: {
            'Content-Type': 'application/json'
        }
    },
    function (error, response, body) {
        console.log(response.statusCode);
        console.log(body);
    });
``` 
<br/>

#### 인증 토큰 정보 받아오기 Python 예제

```python
import os
import sys
import urllib.request
id = 'SUBXXX1000000000';
password = 'xxxxYUDKHJFLxxxxxxAEYdddddylIxYYYYYYDDDDDDDDDDDDA';
api_url = 'https://eapi.lgstation.com/auth/api/reg';
request_body = "{\"id\":\""+id+"\", \"password\":\""+password+"\"}";

request = urllib.request.Request(url)
request.add_header("Content-Type","application/json")
response = urllib.request.urlopen(request, data=body.encode("utf-8"))
rescode = response.getcode()
if(rescode==200):
    response_body = response.read()
    print(response_body.decode('utf-8'))
else:
    print("Error Code:" + rescode)
``` 
<br/>