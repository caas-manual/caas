---
title: 날씨 API 세팅
tags: [API, intent, entity, weather]
keywords: Basic Conversation
summary: 날씨 조회 API를 세팅하는 방법을 가이드하는 페이지입니다.
sidebar: chatbot_doc_sidebar
permalink: weather_api_use.html
folder: groupChatbot
previous: {
    title: Contents, 
    url: contents_basic.html
}
next: {
    title: General,
    url: chatbot_setting.html
}
---

## 날씨 조회 API
 Chatbot(챗봇)을 생성한 뒤, 날씨 조회 API를 사용하기 위해 등록 및 설정하는 방법을 가이드하는 페이지입니다.
 
 날씨 조회 API가 제공하는 기능은 아래와 같습니다.
 1. 로그인 시 시뮬레이터에서 오늘의 날씨 정보 제공
 2. 검색한 지역의 날씨 조회 (ex) 서울 날씨

 날씨 API를 사용하기 위해 Intent 및 Entity, API를 세팅할 필요가 있습니다. 순서는 다음과 같습니다.
 1. API 업로드 및 방화벽 해제 신청, 완료
 2. Entity 업로드
 3. Intent 업로드
 4. Intent 업로드
 
 API 및 각 파일을 업로드하려면 아래의 파일을 다운받으실 수 있습니다.<br/>
<!-- * 다운로드 파일: <a href="zipFile/weatherInfo.zip" download>weatherInfo.zip</a> -->

## 날씨 API 등록
 1. 폴더 안의 api.zip 압축 풀기
 2. api 폴더 내의 json 파일 확인
  - ① 근무지 날씨 조회.json<br/>
  - ② 국내 날씨 조회.json<br/>
  - ③ 세계 도시 조회.json<br/>
  ① 근무지 날씨 조회 API는 챗봇 사용자의 근무지 위치에서의 날씨 정보를 조회합니다. ② 국내 날씨 조회는 사용자가 챗봇에 검색한 국내 지역의 날씨를 조회합니다. (ex) 서울 날씨
 3. 챗봇 사이드 메뉴의 APIs에서 API 파일들을 업로드할 수 있습니다. 자세한 방법은 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[API의 업로드](api_basic.html#업로드)</span>에서 참조하실 수 있습니다.
 4. 방화벽 차단 해제
 챗플로우에서 API를 사용하기 위해서는 방화벽 차단 해제를 반드시 해줘야 합니다. 자세한 방법은 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[방화벽 차단 해제 신청](api_basic.html#방화벽-차단-해제-신청)에서 참조하실 수 있습니다.


## Entity 업로드
 1. 폴더 안의 emtity.zip 압축 풀기
 2. entity 폴더 내의 json 파일 확인
  - ① cityName.json<br/>
  - ② countryName.json<br/>
  - ③ local1.json<br/>
  - ④ local2.json<br/>
 3. 챗봇 사이드 메뉴의 Entities에서 Entity 파일들을 업로드할 수 있습니다. 자세한 방법은 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[Entity의 업로드](entity_basic.html#업로드)</span>에서 참조하실 수 있습니다.

## Intent 업로드
 1. 폴더 안의 intent.zip 압축 풀기
 2. intent 폴더 내의 json 파일 확인
  - ① 공통-근무지 날씨 조회.json<br/>
  - ② 공통-날씨 조회.json<br/>
  - ③ 공통-세계 도시 조회.json<br/>
 3. 챗봇 사이드 메뉴의 Intents에서 Intent 파일들을 업로드할 수 있습니다. 자세한 방법은 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[Intent의 업로드](intent_basic.html#업로드)</span>에서 참조하실 수 있습니다.
 4. Chatflow(챗플로우)의 API 노드 설정
 업로드한 Intent들의 Chatflow 화면으로 들어가려면 Intents 메뉴의 답변 유형에서 'Chatflow'로 검색한 뒤 Intent 목록의 우측에 있는 'Chatflow>' 버튼을 클릭하여 진입할 수 있습니다.<br/>
 Chatflow 화면으로 들어가면 API 노드 설정을 해줘야 하며 자세한 기능들은 [API Node](intent_response_chatflow_api.html)에서 확인하실 수 있습니다.

#### 근무지 날씨 조회
아래의 그림과 같이 **근무지 날씨 조회** API 노드를 클릭합니다.
<!-- 근무지 API 챗플로우 -->
{% include image.html file="weatherApi/01_weather_emp_1.PNG" max-width="900" caption="근무자 날씨 조회 챗플로우" %}

API 선택 박스에서 **근무지 날씨 조회**를 선택하여 적용합니다.
<!-- API 노드 전1 -->
{% include image.html file="weatherApi/01_weather_emp_2.PNG" max-width="900" caption="근무자 날씨 조회 API 선택" %} 

요청 Parameter탭에서 Query Parmater에 'chatbotId'와 'userId'에 빨간색 박스로 표시된 입력란에 아래 그림과 같이 입력합니다. (챗봇아이디, $userId)
<!-- API 노드 전2 -->
{% include image.html file="weatherApi/01_weather_emp_3.PNG" max-width="900" caption="요청 Parameter 설정" %}
{% include note.html content="챗봇 아이디 설정은 사이드 메뉴의 [Settings] > Chatbot Info. > Bot ID 에서 확인할 수 있습니다" %} 

응답 Parameter탭으로 넘어가서 출력 Paramerter의 우측의 **Parameter 추가**버튼을 클릭하면 추가할 수 있는 파라미터 목록을 확인할 수 있습니다.<br/>
목록에서 확인할 수 있는 파라미터들은 다음과 같습니다. 파라미터들은 **userId**, **오늘강수**, **오늘하늘**, **지역명**, **내일날짜**, **모레날짜**를 **제외**하고 추가해줍니다.
- userId
- 내일날짜
- 내일최고
- 내일최저
- 내일하늘
- 모레날짜
- 모레최고
- 모레최저
- 모레하늘
- 오늘강수
- 오늘날씨목록
- 오늘하늘
- 지역1
- 지역2
- 지역명
- 최고온도
- 최저온도
- 현재온도
<!-- API 노드 후1 -->
{% include image.html file="weatherApi/01_weather_emp_4.PNG" max-width="900" caption="응답 Parameter - Parameter 추가" %} 

파라미터들을 추가해 줬으면 좌측의 API Tree에서 아래의 그림과 같이 필요한 파라미터를 마우스로 드래그하여 출력 Paramter의 해당 입력란에 넣어줍니다. 매칭할 파라미터들은 다음과 같습니다.

| API Tree | 출력 Paramter | 
|--------|-------|
| local1 | 지역1 |
| local2 | 지역2 |
| t1h | 현재온도 |
| tmx | 최고온도 |
| tmn | 최저온도 |
| tmx1 | 내일최고 |
| tmn1 | 내일최저 |
| tmx2 | 모레최고 |
| tmn2 | 모레최저 |
| weatherList | 오늘날씨목록 |
| weatherList1 | 내일하늘 |
| weatherList2 | 모레하늘 |

<!-- API 노드 후2 -->
{% include image.html file="weatherApi/01_weather_emp_5.PNG" max-width="900" caption="응답 Parameter - API tree와 출력 Parameter 매칭1" %}
<!-- API 노드 후3 : 변경되어서 수정 필요-->
{% include image.html file="weatherApi/01_weather_emp_6_1.PNG" max-width="900" caption="응답 Parameter - API tree와 출력 Parameter 매칭2" %} 

#### 국내 날씨 조회
아래의 그림과 같이 **국내 날씨 조회** API 노드를 클릭합니다.
 <!-- 국내 날씨 API 챗플로우 -->
{% include image.html file="weatherApi/03_weather_nation_1.PNG" max-width="900" caption="국내 날씨 조회 챗플로우" %} 

API 선택 박스에서 **국내 날씨 조회**를 선택하여 적용합니다.
<!-- API 노드 전1 -->
{% include image.html file="weatherApi/03_weather_nation_2.PNG" max-width="900" caption="국내 날씨 조회 API 선택" %} 

요청 Parameter탭에서 Query Parmater에 'date'와 'localQuery'에 빨간색 박스로 표시된 입력란에 아래 그림과 같이 입력합니다. ($date, $localQuery)
<!-- API 노드 전2 -->
{% include image.html file="weatherApi/03_weather_nation_3.PNG" max-width="900" caption="요청 Parameter 설정" %} 

응답 Parameter탭으로 넘어가서 출력 Paramerter의 우측의 **Parameter 추가**버튼을 클릭하면 추가할 수 있는 파라미터 목록을 확인할 수 있습니다.<br/>
목록에서 확인할 수 있는 파라미터들은 다음과 같습니다. 파라미터들은 **userId**, **오늘강수**, **오늘하늘**, **지역명**, **내일날짜**, **모레날짜**를 **제외**하고 추가해줍니다. (근무지 날씨 조회 API와 동일하게 세팅합니다)

- localQuery
- 내일날짜
- 내일최고
- 내일최저
- 내일하늘
- 모레날짜
- 모레최고
- 모레최저
- 모레하늘
- 오늘강수
- 오늘날씨목록
- 오늘하늘
- 지역1
- 지역2
- 지역명
- 최고온도
- 최저온도
- 현재온도

<!-- API 노드 후1 -->
{% include image.html file="weatherApi/03_weather_nation_4.PNG" max-width="900" caption="응답 Parameter - API tree와 출력 Parameter 매칭1" %} 

파라미터들을 추가해 줬으면 좌측의 API Tree에서 아래의 그림과 같이 필요한 파라미터를 마우스로 드래그하여 출력 Paramter의 해당 입력란에 넣어줍니다. 매칭할 파라미터들은 다음과 같습니다.

| API Tree | 출력 Paramter | 
|--------|-------|
| local1 | 지역1 |
| local2 | 지역2 |
| t1h | 현재온도 |
| tmx | 최고온도 |
| tmn | 최저온도 |
| tmx1 | 내일최고 |
| tmn1 | 내일최저 |
| tmx2 | 모레최고 |
| tmn2 | 모레최저 |
| weatherList | 오늘날씨목록 |
| weatherList1 | 내일하늘 |
| weatherList2 | 모레하늘 |

#### 세계 도시 조회
아래의 그림과 같이 **세계 도시 조회** API 노드를 클릭합니다.
 <!-- 세계 도시 API 챗플로우 -->
{% include image.html file="weatherApi/02_weather_world_1.PNG" max-width="900" caption="세계 도시 조회 챗플로우" %} 

API 선택 박스에서 **세계 도시 조회**를 선택하여 적용합니다.
<!-- API 노드 전1 -->
{% include image.html file="weatherApi/02_weather_world_2.PNG" max-width="900" caption="세계 도시 조회 API 선택" %} 

요청 Parameter탭에서 Query Parmater에 'cityName'와 'countryName'에 빨간색 박스로 표시된 입력란에 아래 그림과 같이 입력합니다. ($cityName, $countryName)
<!-- API 노드 전2 -->
{% include image.html file="weatherApi/02_weather_world_3.PNG" max-width="900" caption="요청 Parameter 설정" %} 

응답 Parameter탭으로 넘어가서 출력 Paramerter의 우측의 **Parameter 추가**버튼을 클릭하면 추가할 수 있는 파라미터 목록을 확인할 수 있습니다.<br/>
목록에서 확인할 수 있는 파라미터들은 다음과 같습니다. 파라미터는 **도시ID**만 추가해줍니다.
- countryName
- cityName 
- 나라
- 도시
- 도시ID
- 장소이름
<!-- API 노드 후1 -->
{% include image.html file="weatherApi/02_weather_world_5.PNG" max-width="900" caption="응답 Parameter - API tree와 출력 Parameter 매칭1" %} 

파라미터들을 추가해 줬으면 좌측의 API Tree에서 아래의 그림과 같이 필요한 파라미터를 마우스로 드래그하여 출력 Paramter의 해당 입력란에 넣어줍니다. 매칭할 파라미터들은 다음과 같습니다.

| API Tree | 출력 Paramter | 
|--------|-------|
| cityId | 도시ID |

<!-- API 노드 후2 -->
{% include image.html file="weatherApi/02_weather_world_4.PNG" max-width="900" caption="응답 Parameter - API tree와 출력 Parameter 매칭2" %} 