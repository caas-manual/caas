---
title: Chatflow Node 활용하기
tags: [intent, chatflow, tutorial, basic]
keywords: [tutorial, chatflow, response, api, node]
summary: 챗봇의 기본 구조를 이해할 수 있습니다.
sidebar: tutorial_sidebar
permalink: 04_using_chatflow_node.html
folder: tutorial
---

앞서 사용한 Listen, Speak, Slot Node 외에도 Chatflow에는 다양한 Node를 활용해 대화를 보다 자연스럽게, 보다 똑똑하게 설계 할 수 있습니다.

이번 모듈에서는 다양한 Node의 기능들을 간략하게 소개하고, 그 중에서 가장 활용도가 높은 Function Node와 API Node를 활용하는 따라하기 영상을 진행하겠습니다.

## 다양한 Node 소개

Chatflow의 Node는 대화의 시작을 알리는 One&Only ***Listen Node*** 를 제외하고 기능 관점에서 크게 2가지 타입으로 나눌 수 있습니다.

- Chatflow Node 구분

* 사용자에게 답변을 하는 Node : Speak Node, Slot Node
* 내부적으로 시나리오 로직을 처리하는 Node(Hidden Node) : Api Node, Split Node, Function Node, Jump Node

사용자에게 답변을 하는 Speak Node와 Slot Node는 원하는 값을 기다리는  Slot Filling 상태 설정 유무에 따라 기능에 약간의 차이가 있지만,

어떤 목적으로든 사용자에게 답변을 하는 기능을 합니다.

앞선 모듈의 따라하기에서는 주로 Text로 답변 또는 질문이 나가도록 설정했지만, 텍스트 외에 이미지, 버튼, 카드뉴스 등 다양한 형태의 답변이 나가도록 설정이 가능합니다.

{% include image.html file="education\chatflow_01.png" max-width="900" %}

***Hidden Node***는 대화를 하는 사용자는 눈치 챌 수 없지만, 각자의 기능을 하며 대화를 보다 똑똑하게 발전시킵니다.

각 Hidden Node를 간략히 살펴 보겠습니다. 

1) Api Node는 외부 API와 연계하는 Node로 챗봇 빌더 외부에서 필요한 정보를 가져오거나 Legacy 시스템을 REST 방식으로 연계할 수 있도록 도와줍니다.

API Node를 활용하는 방법에 대해서는 다음 따라하기에서 함께 해보도록 하겠습니다.

2) 같은 의도 내에서 추출되는 정보에 따라 혹은 특정 상황에 따라 시나리오가 달라져야 하는 경우가 있을 수 있습니다.

예를 들면, 피자 주문을 처리하는 챗봇이 Slot node를 통해 사용자가 주문하고자 하는 사이즈를 물어보려 하는데

특정 피자 메뉴는 한가지 사이즈만 제공되서 굳이 사이즈 확인이 필요 없는 경우에 사이즈 질문은 굳이 하지 않도록 설정하고 싶을 수 있습니다.

{% include image.html file="education\chatflow_02.png" max-width="900" %}

Split Node는 이런 상황에서 조건에 따라 대화 흐름을 분기하도록 처리해 줍니다.

조건에 따라 다음 node를 선택적으로 따라가도록 설정해서 대화 흐름을 좀 더 유연하게 설정하는 기능을 합니다.

- Split Node 설정 예시

{% include image.html file="education\chatflow_03.png" max-width="900" %}

3) Function Node는 개발언어가 익숙한 챗봇 개발자를 위해 Javascript를 직접 작성해 대화 흐름을 처리하도록 지원합니다.

Intent Parameter명을 직접 불러와 코딩으로 편집이 가능하고, 복잡하거나 시스템적인 조건에 값에 따라 시나리오를 설계 하고 싶을 때, 화면에서 UI로 처리하는 한계를 극복할 수 있도록 도와줍니다.

- Function Node 설정 예시

{% include image.html file="education\chatflow_04.png" max-width="900" %}

Function Node를 활용하는 방법도 이어지는 따라하기 영상에서 같이 실습해 보겠습니다.

4) 마지막으로 Jump Node는 다른 Chatflow로 시나리오를 연결하는 기능을 제공합니다.

업무 흐름 상 다른 시나리오로의 전환이 필요하거나 공통의 대화 흐름을 별도의 Chatflow로 만들어 연결할 수 있습니다.

{% include image.html file="education\chatflow_05.png" max-width="900" %}

- Jump Node 설정 예시

{% include image.html file="education\chatflow_06.png" max-width="900" %}

## API Node와 Function Node를 활용한 대화 만들어 보기

이 따라하기에는 제공파일이 존재합니다. 아래 파일을 사전에 다운로드 받아 주세요.

★제공파일 : <a href="images/json/daily_box_office_api.json" download>daily_box_office_api.json</a>

따라하기 과정 중 API 목록조회 화면에서 API 업로드를 하는 시점에 영상을 잠깐 멈추고 다운로드 받은 파일을 선택해 업로드 해 주세요.

### 따라하기 영상 8 : 다른 Node 활용하기 1

이번 따라하기에서는 "영화 예매" 의도에 대한 대화 시나리오에서 외부 API를 활용하기 위해 API를 등록해보고, API Node를 살펴보는 실습을 해보겠습니다.

시나리오 안에서 사용할 "일별 박스오피스 순위" 오픈 API는 영화진흥위원회에서 제공하며, <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>
[영화진흥위원회 ](https://www.kobis.or.kr/kobisopenapi/homepg/apiservice/searchServiceInfo.do)</span>오픈API 링크를 클릭해 API 명세서를 확인 할 수 있습니다. 

이번 따라하기 영상을 마치면, 실습환경 플랫폼에서 다음과 같은 화면 결과를 얻으실 수 있습니다. 

{% include image.html file="education\chatflow_07.png" max-width="900" %}

아래 썸네일을 클릭해 영상을 시청해 주세요.

{% include video.html file="chatflow_01.mp4" type="mp4" %}

따라하기 영상에서 교육 강사가 작성하는 내용은 아래를 참고 하세요.

- API Node 내 요청 Parameter Tab의 Query Parameter

| Name | Description | Value | 
|------|-----|-----|
| `key` | `발급받은키` | `430156241533f1d058c603178cc3ca0e` |
| `targetDt` | `조회하고자 하는 날짜 (YYYYMMDD)` | `20200921` |

### 따라하기 영상 9 : 다른 Node 활용하기 2

이번 따라하기에서는 "영화 예매" 의도에 대한 대화 시나리오에서 외부 API를 활용하기 위해 Chatflow parameter를 등록해보고, Function Node와 API Node를 연계해 대화를 구성하는 실습을 해보겠습니다.

따라하기를 마치면, 실습환경 플랫폼과 테스트 메신저에서 다음과 같은 화면 결과를 얻으실 수 있습니다.

{% include image.html file="education\chatflow_08.png" max-width="900" %}

아래 썸네일을 클릭해 영상을 시청해 주세요.

{% include video.html file="chatflow_02.mp4" type="mp4" %}

 따라하기 영상에서 교육 강사가 작성하는 내용은 아래를 참고 하세요.

- Function Node1 내에 작성하는 코드

# 어제 날짜를 구하는 Javascript 코드

var date = new Date();
 
var year = date.getFullYear();
var month = date.getMonth()+1; // 0~11
var day = date.getDate()-1; // yesterday
 
if(month < 10) {
    month = "0" + month.toString();
} else {
    month = month.toString();
}
if(day < 10) {
    day = "0" + day.toString();
} else {
    day = day.toString();
}
 
어제날짜 = (year + month + day).toString(); // YYYYMMDD

- API Node 내 요청 Parameter Tab의 Query Parameter 변경 사항 

| Name | Description | Value | 
|------|-----|-----|
| `key` | `발급받은키` | `430156241533f1d058c603178cc3ca0e` |
| `targetDt` | `조회하고자 하는 날짜 (YYYYMMDD)` | `${어제날짜}` |

- API Node 내 응답 Parameter Tab의 출력 Parameter

* 어제박스오피스1위 : $.boxOfficeResult.dailyBoxOfficeList.[0].movieNm

- Speak Node 내 Responsee 작성 내용

1. 	영화 $MovieName 저도 좋아해요!

어제 (${어제날짜}) 박스오피스 1위는 ${어제박스오피스1위} 이었다고 하네요~

API Node와 Function Node를 생성하고 강사의 시연과 같이 테스트 챗봇에서 테스트 해보세요.

잘 작동하지 않는다면, 아래 Hint를 참고해서 따라해 주세요. 

*** HINT ***

교육 강사가 작성한 Chatflow 정보를 다운로드한 파일 입니다. 아래 파일을 다운로드 받아, 아래 가이드 대로 업로드 해보세요.

* 다운로드 파일 : <a href="images/json/chatflow_movie_reservation_4.json" download>chatflow_movie_reservation_4.json</a>

1) Chatflow 편집 캔버스 하단에 있는 **업로드** 버튼을 클릭합니다. 

{% include image.html file="education\chatflow_09.png" max-width="900" %}

2) Chatflow 업로드 팝업 창에서 **파일 선택** 버튼을 클릭해 다운로드 한 "chatflow_movie_reservation_4" 파일을 선택합니다. (이미지에서는 Chatflow_영화 예매(영상9_다른Node설정).json을 선택합니다.)

{% include image.html file="education\chatflow_10.png" max-width="900" %}

3)  선택한 파일명이 로드 되면 **업로드** 버튼을 클릭해 파일을 적용 합니다.

{% include image.html file="education\chatflow_11.png" max-width="900" %}

4) 캔버스에 변경사항이 아래와 같이 반영되었다면, **저장** 버튼을 눌러 Chatflow 업로드 내용을 저장합니다.

{% include image.html file="education\chatflow_11.png" max-width="900" %}

이렇게 업로드를 완료 한 후, 다시 따라하기 영상의 마지막 부분처럼 테스트 메신저 창에서 테스트해 보세요. 강사와 동일한 결과를 얻으 실 수 있습니다.

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           