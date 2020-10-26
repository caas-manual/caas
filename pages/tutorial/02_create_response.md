---
title: 답변 만들기
tags: [intent, chatflow, tutorial, basic]
keywords: [tutorial, intent, response, 답변]
summary: 챗봇의 기본 구조를 이해할 수 있습니다.
sidebar: tutorial_sidebar
permalink: 02_create_response.html
folder: tutorial
next: {
    title: 정보 추출하기,
    url: 03_using_information.html
}
---

자, 이제 챗봇이 알아들은 말에 대해 어떻게 답변할지를 설정하는 가장 간단한 방법부터 소개해 드리겠습니다.

AI Chatbot 플랫폼은 이번 업그레이드와 함께 구글의 DialogFlow 기술을 수용하게 되었습니다.

기존 LG CNS 챗봇 플랫폼의 대화 설계 방식인 Chatflow 방식과 구글의 DialogFlow 방식을 각각 나눠 따라하기 실습을 진행하겠습니다.

## DialogFlow형 답변 설정하기

기존에 Google의 DialogFlow 기반으로 챗봇을 개발해 보신 분이라면, DialogFlow의 구조는 익숙하질 거라고 생각합니다.

간단하게 소개드리면, DialogFlow형 답변을 설정할 때는 Response / Context / Fulfillment 설정이 가능합니다.

***Response***는 해당 Intent에 대한 답변을 설정하는 영역입니다. 해당 영역에 기본 텍스트 답변 외에 이미지, 오디오 등을 답변으로 세팅하는 것도 가능합니다.

Response 영역에 답변은 반드시 설정할 필요는 없지만, 이번 과정의 따라하기 실습에서는 간단한 텍스트 답변을 이 Response 영역에 설정해 챗봇의 동작을 테스트 해보려고 합니다.

***Context***는 대화의 맥락을 설정하는 영역입니다. Context로 연결된 Intent는 해당 Intent의 대화 중에 새로운 Intent 추론을 하게 될 경우가중치를 부여 받게 됩니다. 더 자세한 내용은 이 Documentation 페이지를 참고해 주세요. 

***Fulfillment***는 사용하겠다고 설정하는 경우, Response에 정의한 응답이 아닌 Fulfillment에 연결한 Webhook을 활용해 답변을 하게 됩니다. 더 자세한 내용은 이 Documentation 페이지를 참고해 주세요.

### 따라하기 영상 3 : Dialogflow형 답변 설정하기

이번 따라하기에서는 "영화 예매" 의도를 발화한 사용자에게 챗봇이 어떻게 답변을 할지를 Google DialogFlow형 답변 방식으로 설정하는 실습을 해보겠습니다.

이번 따라하기 영상을 마치면, 실습환경 플랫폼과 테스트 메신저에서 다음과 같은 화면 결과를 얻으실 수 있습니다. 

{% include image.html file="education\response_01.png" max-width="900" %}

아래 썸네일을 클릭해 영상을 시청해 주세요. 

{% include video.html file="response_01.mp4" type="mp4" %}

DialogFlow형 답변 설정하기 잘 따라 오셨나요? 

실습이 잘 되지 않는다면, 아래 Hint를 참고해서 따라해 주세요. 

*** HINT ***

교육 강사가 작성한 Intent 정보를 다운로드한 파일 입니다. 아래 파일을 다운로드 받아, 아래 가이드 대로 업로드 해보세요.

업로드 하시면, 기존에 직접 작업하던 Intent 상세 내역이 업로드 한 파일의 내용으로 갱신되니 본인의 작업을 유지하기 위해서는 작업하던 Intent명을 "영화 예매"가 아닌 다른 이름으로 변경해 주세요. 

* 다운로드 파일: <a href="images/json/intent_movie_reservation_2.json" download>intent_movie_reservation_2.json</a>

1) Intent 목록조회 화면에서 목록 위에 **업로드** 버튼을 클릭합니다. 

{% include image.html file="education\response_02.png" max-width="900" %}

2) Intent 업로드 화면에서 **파일선택** 버튼을 클릭해 다운로드 한 "intent_movie_reservation_2.json" 파일을 선택합니다.(이미지에서는 Intent_영화_예매.json을 선택합니다.)

{% include image.html file="education\response_03.png" max-width="900" %}

3) 선택한 파일 정보가 로드 되면 **저장** 버튼을 클릭합니다.

{% include image.html file="education\response_04.png" max-width="900" %}

4) 확인 창이 보여지면 **확인** 버튼을 클릭합니다.

{% include image.html file="education\response_05.png" max-width="900" %}

5) 성공했다는 메시지가 보여지는 걸 확인한 후 **취소** 버튼을 클릭해 다시 목록 조회 화면으로 돌아옵니다. 

{% include image.html file="education\response_06.png" max-width="900" %}

이렇게 업로드를 완료 한 후, 다시 따라하기 영상의 마지막 부분처럼 테스트 메신저 창에서 테스트해 보세요. 강사와 동일한 결과를 얻으 실 수 있습니다.

## Chatflow형 답변 설정하기

**Chatflow**는 LG CNS AI Chatbot에서 제공하는 Dialog Manager 기능을 말합니다.

Chatflow는 Chat을 Flow형태를 구현한다는 의미로 캔버스와 같이 생긴 Chatflow Design Panel 상에서 UI 기반으로 대화흐름 설계가 가능합니다.

Chatflow는 **Node**라는 기능의 단위로 구성되는데요, 이 Node는 기능에 따라 아래와 같이 각기 다른 이름을 가지고 있습니다. 각 Node에 대한 자세한 설명은 마지막 Chatflow Node 활용 모듈에서 살펴보도록 하겠습니다.

{% include image.html file="education\response_07.png" max-width="900" %}
 
### 따라하기 영상 4 : Chatflow형 답변 설정하기

이번 따라하기에서는 "영화 예매" 의도를 발화한 사용자에게 챗봇이 어떻게 답변을 할지를 Chatflow형 답변 방식으로 설정하는 실습을 해보겠습니다.

이번 따라하기 영상을 마치면, 실습환경 플랫폼과 테스트 메신저에서 다음과 같은 화면 결과를 얻으실 수 있습니다. 

{% include image.html file="education\response_08.png" max-width="900" %}

아래 썸네일을 클릭해 영상을 시청해 주세요. 

{% include video.html file="response_02.mp4" type="mp4" %}

Chatflow형 답변 설정하기 잘 따라 오셨나요? 

실습이 잘 되지 않는다면, 아래 Hint를 참고해서 따라해 주세요. 

*** HINT ***

교육 강사가 작성한 Chatflow 정보를 다운로드한 파일 입니다. 아래 파일을 다운로드 받아, 아래 가이드 대로 업로드 해보세요.

* 다운로드 파일: <a href="images/json/chatflow_movie_reservation_1.json" download>chatflow_movie_reservation_1.json</a>

1) Chatflow 편집 캔버스 하단에 있는 **업로드** 버튼을 클릭합니다. 

{% include image.html file="education\response_09.png" max-width="900" %}

2) Chatflow 업로드 팝업 창에서  **파일 선택** 버튼을 클릭해 다운로드 한 "chatflow_movie_reservation_1" 파일을 선택합니다. (이미지에서는 Chatflow_영화 예매(영상4_Chatflow_답변설정).json을 선택합니다.)

{% include image.html file="education\response_10.png" max-width="900" %}

3) 선택한 파일명이 로드 되면 **업로드** 버튼을 클릭해 파일을 적용 합니다.

{% include image.html file="education\response_11.png" max-width="900" %}

4) 캔버스에 변경사항이 아래와 같이 반영되었다면, **저장** 버튼을 눌러 Chatflow 업로드 내용을 저장합니다.

{% include image.html file="education\response_12.png" max-width="900" %}

이렇게 업로드를 완료 한 후, 다시 따라하기 영상의 마지막 부분처럼 테스트 메신저 창에서 테스트해 보세요. 강사와 동일한 결과를 얻으 실 수 있습니다.