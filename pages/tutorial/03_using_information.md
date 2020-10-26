---
title: 정보 추출하기
tags: [intent, entity, tutorial, basic]
keywords: [tutorial, intent, entity, parameter]
summary: 챗봇의 기본 구조를 이해할 수 있습니다.
sidebar: tutorial_sidebar
permalink: 03_using_information.html
folder: tutorial
next: {
    title: Chatflow Node 활용하기,
    url: 04_using_chatflow_node.html
}
---

앞선 모듈을 통해 LG CNS AI 챗봇 빌더 플랫폼에서 간단하게 대화하는 챗봇을 만드는 방법을 살펴 보았습니다.


하지만 앞선 방법으로는 챗봇이 정해진 반응을 답변 하는 것 외에는 할 수 있는 것이 별로 없습니다.

많은 기업에서 챗봇을 도입하는 목적이 영혼없는 반응을 만드는 챗봇은 아닐테니 좀 더 사용자의 말에서 필요한 정보를 추출하고,

추출한 정보를 기반으로 사용자가 이 대화를 통해 해결하고자 무언가를 해결해 주는 챗봇이면 더 좋은 서비스가 될 것 같습니다.

## Entity와 정보 추출

자연어 처리 기술에서 특정 유형의 정보를 가지는 단어를 인식하는 것을 **개체명인식 (Named Entity Recognition, NER)**이라고 합니다.

여기서 **Entity**란, 특정 유형의 정보를 의미하는데요, 용어는 좀 생소하지만 아래와 같은 예시를 보면 쉽게 이해하실 수 있습니다.

{% include image.html file="education\information_01.png" max-width="900" %}

여기서 날짜, 숫자, 피자종류, 국가, 도시와 같은 단어의 의미를 그룹핑한 유형을 Entity 라고 이해하시면 됩니다. 

- Entity와 해당 정보의 예

| Entity| 정보 |
|------|-----|
| `날짜` | `오늘, 내일, 모레, 10월 8일, …` |
| `숫자` | `1, 2, 10, 백, 천만, …` |
| `피자종류` | `불고기, 페퍼로니, 포테이토, …` |
| `국가` | `한국, 미국, 베트남, …` |
| `도시` | `서울, 부산, 뉴욕, 하노이, ...` |

챗봇은 이러한 NER 기술을 활용해 사용자의 발화로 부터 대화에 필요한 정보를 추출하게 됩니다. 챗봇을 통해 대화에서 필요한 정보를 추출하기 위해서는,

    1. 필요한 정보의 유형을 파악
    2. 도메인에 특화된 정보 유형(Entity) 정의
    3. 대화에서 추출한 정보를 담고 있을 변수(Parameter) 설정
    4. 정보를 추출하는 대화 시나리오 설계

의 작업이 필요합니다. 

지금부터는 더 똑똑한 대화를 진행하기 위한 정보 추출 설계 과정과 챗봇 빌더 상에서 구현하는 방법을 알아 보겠습니다.

알기 쉬운 설명을 위해 우리는 피자 주문을 도와주는 챗봇을 구축 과제의 개발자라고 가정하겠습니다.

### 1. 필요한 정보의 유형을 파악

가장 먼저 해야 할 일은 구축하고자 하는 업무 시나리오에서 업무 처리를 위해 필요한 정보를 파악하는 일 입니다.

피자 주문을 대신하는 챗봇은 어떤 정보들이 필요할까요? 어떤 피자를 주문할지, 몇 판이나 주문할지, 사이즈는 어떻게 선택할건지, 배달은 어디로 해야하는지 등이 필요할 겁니다.

먼저 이러한 정보들을  Entity로 규정하는 작업을 합니다.

- 피자 주문을 처리하려면 필요한 Entity의 예

| Entity| 정보 |
|------|-----|
| `피자 메뉴` | `불고기, 페퍼로니, 포테이토, …` |
| `피자 수량` | `1, 2, 3, …` |
| `피자 사이즈` | `레귤러, 라지, 패밀리, …` |
| `배송 주소` | `서울 강서구 마곡 중앙 10로, 서울 마포구 상암동, ….` |

### 2. 도메인에 특화된 정보 유형 (Entity) 정의 

위 표에서 피자 주문을 처리하는데 필요할 Entity 예시를 보면,

"피자 메뉴", "피자 사이즈" 처럼 "피자 주문"이라는 업무에 종속된 정보들도 있고,

1, 2, 3 같은 수량이나 주소처럼 어느 업무에서나 사용이 가능한 일반적인 정보 유형들도 있습니다.

챗봇을 만들 때 마다 이런 일반적인 유형의 정보를 챗봇 개발자가 직접 정의하면 여간 번거로운 일이 아니겠죠?

AI Chatbot에서는 이런 일반적인 유형의 정보는 별다른 개발자의 작업 없이 사용 할 수 있도록 템플릿을 제공하고 있습니다. 이러한 종류의 Entity를 ***System Entity***라고 합니다.

그렇다면 챗봇 개발자는 챗봇이 미리 알고 있지 않을 법한 도메인에 특화된 Entity만 챗봇에게 가르쳐 주면 될 것 같네요!

- AI Chatbot에서 제공하는 System Entity

| 구분| System Entity 목록 |
|------|-----|
| `일반` | `sys.any, sys.color, sys.url` |
| `이름` | `sys.person` |
| `언어` | `sys.language` |
| `숫자` | `sys.number` |
| `날짜/시간` | `sys.date, sys.date-time, sys.time` |

모든 사람들이 피자 주문을 할 때 "라지 사이즈 피자 주세요." 라고 말하기로 약속했다면 참 편하겠지만,

어떤 사람들은 "L 사이즈 피자 주세요." 라고 말할 수도, 다른 사람들은 "큰 사이즈 피자 주세요" 라고 말할 수도 있습니다.

그래서 도메인 Entity를 설계할 때는 이런 사람들이 말하는 유사한 말들까지 고려해야 합니다.



Entity는 특정 정보를 대표하는 ***대표어(Entry)***와 그 대표어로 인식될 수 있는 ***유사 표현들(Reference 또는 Synonym)***로 구성됩니다.

위의 예시를 들자면, "라지"라는 단어를 "L"이나 "큰"이라는 단어를 대표하는 대표어로 설정할 수 있겠네요.

{% include image.html file="education\information_02.png" max-width="900" %}

### 따라하기 영상 5 : Entity 만들기

이번 따라하기에서는 "영화 예매" 의도에서 추출할 정보 유형 중 도메인에 특화된 Entity를 신규로 등록해보는 실습을 해보겠습니다.

이번 따라하기 영상을 마치면, 실습환경 플랫폼에서 다음과 같은 화면 결과를 얻으실 수 있습니다.

{% include image.html file="education\information_03.png" max-width="900" %}

아래 영상을 클릭해서 시청해 주세요. 

{% include video.html file="information_01.mp4" type="mp4" %}

따라하기 영상에서 교육 강사가 작성하는 내용은 아래를 참고 하세요.

- 영화 예매 시나리오에 필요한 Entity 정의서

| Entity | 대표어(Value) | 동의어(Synonym) | 
|------|-----|-----|
| `MovieName` | `로마의 휴일` | `로마의 휴일, 로마영화, 로마휴일, 오드리 햅번 영화` |
| `MovieName` | `패왕별희 더 오리지널` | `패왕별희 더 오리지널, 패왕별희` |
| `Cinema` | `목동CGV` | `목동CGV, 목동영화관, 목동씨지비` |
| `Cinema` | `등촌CGV` | `등촌CGV, 등촌영화관, 등촌씨지비` |

이번 따라하기도 잘 따라 오셨나요? 따라하기가 제대로 진행되지 못했다면, 다음 실습이 잘 동작하지 않을 수 있습니다. 

따라하기 실습이 잘 되지 않는다면, 아래 힌트를 참고해서 따라해 주세요. (wink)

*** HINT ***

교육 강사가 작성한 Entity 정보를 다운로드한 파일 입니다. 아래 파일을 다운로드 받아, 아래 가이드 대로 업로드 해보세요.

* 다운로드 파일 : 
- <a href="images/json/Entity_MovieName.json" download>Entity_MovieName.json</a>
- <a href="images/json/Entity_Cinema.json" download>Entity_Cinema.json</a>

업로드 하시면, 기존에 직접 작업하던 Entity 상세 내역이 업로드 한 파일의 내용으로 갱신되니 본인의 작업을 유지하기 위해서는 작업하던 Entity명을 "MovieName"과 "Cinema"가 아닌 다른 이름으로 변경해 주세요. 

1) Entity 목록조회 화면에서 목록 위에 **업로드** 버튼을 클릭합니다. 

{% include image.html file="education\information_04.png" max-width="900" %}

2) Entity 업로드 화면에서 **파일 선택** 버튼을 클릭해 다운로드 한 "Entity_MovieName.json"과 "Entity_Cinema.json" 파일을 선택합니다.

{% include image.html file="education\information_05.png" max-width="900" %}

3) 선택한 파일 정보가 로드 되면 **저장** 버튼을 클릭합니다.

{% include image.html file="education\information_06.png" max-width="900" %}

4) 확인 창이 보여지면 **확인** 버튼을 클릭합니다.

{% include image.html file="education\information_07.png" max-width="900" %}

5) 성공했다는 메시지가 보여지는 걸 확인한 후 **취소** 버튼을 클릭해 다시 목록 조회 화면으로 돌아옵니다. 

{% include image.html file="education\information_08.png" max-width="900" %}

이렇게 업로드를 완료 한 후, 다시 따라하기 영상의 마지막 부분처럼 테스트 메신저 창에서 테스트해 보세요. 강사와 동일한 결과를 얻으 실 수 있습니다. 

### 3. 대화에서 추출한 정보를 담고 있을 변수 (Parameter) 설정

도메인에서 사용할 정보 유형을 모두 정의했다면, 이제 실제 대화에서 추출된 정보를 활용하기 위한 작업을 해 주어야 합니다.

***Intent Parameter***는 사용자의 발화에서 추출된 다양한 유형의 정보를 시나리오 전반에서 활용하기 위해 저장하는 변수 개념으로 Intent 하위 속성으로 관리 됩니다.

예를 들어, 사용자가 "피자 주문할래"라고 말하는 것과 "불고기 피자 주문할래"라고 말하는 것은 피자 메뉴에 대한 정보를 담고 있는지 여부에만 차이가 있을 뿐 "피자 주문"이라는 의도는 동일하기 때문이죠.

그래서 지금 부터는 "불고기" 라는 피자 메뉴 정보를 챗봇이 기억하기 위한 변수 저장소를 설정하는 방법을 함께 해보겠습니다.

### 따라하기 영상 6 : Parameter 만들기

이번 따라하기에서는 "영화 예매" 의도에서 추출할 정보된 정보를 담고 있을 변수(Parameter)를 등록해보는 실습을 해보겠습니다.

이번 따라하기 영상을 마치면, 실습환경 테스트 메신저에서 다음과 같은 화면 결과를 얻으실 수 있습니다.

{% include image.html file="education\information_09.png" max-width="900" %}

아래 썸네일을 클릭해 영상을 시청해 주세요. 

{% include video.html file="information_02.mp4" type="mp4" %}

따라하기 영상에서 교육 강사가 작성하는 내용은 아래를 참고 하세요.

- 영화 예매 시나리오에 필요한 Intent Parameter 정의서

| Parameter | Entity | Value | 
|------|-----|-----|
| `MovieName` | `@MovieName` | `$MovieName` |
| `Cinema` | `@Cinema` | `$Cinema` |
| `NumOfAdults` | `@sys.number` | `$NumOfAdults` |
| `MovieDate` | `@sys.date` | `$MovieDate` |

이번 따라하기도 잘 따라 오셨나요? 따라하기가 제대로 진행되지 못했다면, 다음 실습이 잘 동작하지 않을 수 있습니다. 

따라하기 실습이 잘 되지 않는다면, 아래 힌트를 참고해서 따라해 주세요. (wink)

*** HINT ***

교육 강사가 작성한 Intent 정보를 다운로드한 파일 입니다. 아래 파일을 다운로드 받아, 아래 가이드 대로 업로드 해보세요.

업로드 하시면, 기존에 직접 작업하던 Intent 상세 내역이 업로드 한 파일의 내용으로 갱신되니 본인의 작업을 유지하기 위해서는 작업하던 Intent명을 "영화 예매"가 아닌 다른 이름으로 변경해 주세요. 

* 다운로드 파일: <a href="images/json/intent_movie_reservation_3.json" download>intent_movie_reservation_3.json</a>


1) Intent 목록조회 화면에서 목록 위에 **업로드** 버튼을 클릭합니다. 

{% include image.html file="education\information_10.png" max-width="900" %}

2) Intent 업로드 화면에서 **파일 선택** 버튼을 클릭해 다운로드 한 "intent_movie_reservation_3" 파일을 선택합니다. (이미지에서는 Intent_영화 예매.json을 선택합니다.)
{% include image.html file="education\information_11.png" max-width="900" %}

3) 선택한 파일 정보가 로드 되면 **저장** 버튼을 클릭합니다.

{% include image.html file="education\information_12.png" max-width="900" %}

4) 확인 창이 보여지면 **확인** 버튼을 클릭합니다.

{% include image.html file="education\information_13.png" max-width="900" %}

5) 성공했다는 메시지가 보여지는 걸 확인한 후 **취소** 버튼을 클릭해 다시 목록 조회 화면으로 돌아옵니다. 

{% include image.html file="education\information_14.png" max-width="900" %}

이렇게 업로드를 완료 한 후, 다시 따라하기 영상의 마지막 부분처럼 테스트 메신저 창에서 테스트해 보세요. 강사와 동일한 결과를 얻으 실 수 있습니다. 

### 4. 정보를 추출하는 대화 시나리오 설계

앞선 과정을 통해 Intent Parameter를 설정하고 사용자의 발화에서 정보를 추출하는 방법을 따라하기까지 마쳤습니다.

사용자의 발화 한 번으로 시나리오에서 원하는 모든 정보를 추출할 수 있다면 좋겠지만, 아무리 예문을 잘 등록한다고 할지라도 사용자의 언어 사용 방식이 모두 다르기 때문에 쉽지 않습니다.

AI Chatbot에서는 이러한 상황을 가정하고, ***Chatflow의 Slot node*** 를 활용해 시나리오에서 필요한 정보를 사용자로부터 끌어낼 수 있는 대화 설계 방법을 제공하고 있습니다.


Slot node는 시나리오에서 필요한 정보를 얻기 위해 사용자에게 다시 질문을 하는 기능을 하는 Node입니다.

Slot node에는 원하는 Intent Parameter를 얻기 위한 질문을 설정할 수 있으며 질문을 통해 얻은 답을 해당 Parameter의 값으로 저장하게 됩니다.

만약 사용자의 발화로 부터 이미 추출된 정보가 있는 Parameter에 대해서는 별도의 질문을 하지 않고 다른 필요한 정보에 대해 질문을 하게 됩니다.

질문을 하고 그 답을 얻는 과정 또는 상태를 Slot Filling이라고 합니다. Slot Node는 이름처럼 Slot-Filling을 위한 Node라고 생각하면 됩니다.

Slot Filling 상태에서 사용자로부터 원하는 정보를 얻지 못했을 경우에는 재질문을 하게 됩니다. 여기서 정보의 범위란, 각 parameter에 셋팅한 정보의 유형, 즉 Entity가 됩니다.

{% include image.html file="education\information_15.png" max-width="900" %}

Slot Node는 기본적으로 필요한 Parameter에 값이 없으면 작성된 지속적으로 반복 질문을 하게 됩니다. 여기에 자연스러운 대화 흐름, Parameter의 중요도 등을 고려해 다음과 같은 부가 기능을 제공합니다.

 * 무조건 물어보기: Parameter 값이 미리 채워져 있더라도 순서가 되면 챗봇이 질문을 한다.
 * 한번만 물어보기: 질문을 통해 Parameter 값이 채워지지 못했더라도 되묻지 않고 다음으로 넘어간다.

{% include image.html file="education\information_16.png" max-width="900" %}

Case 1)  모든 파라미터가 초기 상태. 순서대로 질문

Case 2)  모든 파라미터가 이미 채워져 Slot Node의 질문을 모두 통과하고 다음 Node(Speak Node)로 넘어간 상태

Case 3)  피자 종류 정보 존재 > 바로 피자사이즈 질문 > 사용자의 답변에 [피자사이즈] Entity로 분석될 정보가 없어 재질의

Case 4)  Case 3 상황에서 “무조건 물어보기” 옵션으로 인해 피자종류 질문

Case 5)  Case 3 상황에서 “한번만 물어보기” 실행으로 피자 사이즈 Paramater 값을 채우기 위한 재질의 없이 다음 질문으로 넘어감

### 따라하기 영상 7 : 정보 추출하기 (feat. Slot node)

이번 따라하기에서는 "영화 예매" 의도를 가진 사용자의 발화로 부터 필요한 정보가 덜 추출 되었을 경우, 필요한 정보를 유도하는 대화 시나리오를 작성해보는 실습을 해보겠습니다.

이번 따라하기 영상을 마치면, 실습환경 플랫폼과 테스트 메신저에서 다음과 같은 화면 결과를 얻으실 수 있습니다.

{% include image.html file="education\information_17.png" max-width="900" %}

아래 썸네일을 클릭해 영상을 시청해 주세요. 

{% include video.html file="information_03.mp4" type="mp4" %}

- Slot Node 내 작성하는 질문지

| 필수 Parameter | Prompt |
|------|-----|
| `MovieName` | `어떤 영화를 예매하시겠어요?` |

- Speak Node 내 Response 작성 내용

| | Text |
|------|-----|
| `1` | `영화 $MovieName 저도 좋아해요.` |

Slot Node를 생성하고 강사의 시연과 같이 테스트 메신저에서 테스트 한 결과 화면을 캡쳐해서 제출 PPT에 붙여 넣어 주세요. 이 실습 잘 동작하지 않는다면 다음 실습을 진행할 수 없습니다.

잘 작동하지 않는다면, 아래 힌트를 참고해서 따라해 주세요.

*** HINT ***

교육 강사가 작성한 Chatflow 정보를 다운로드한 파일 입니다. 아래 파일을 다운로드 받아, 아래 가이드 대로 업로드 해보세요.

* 다운로드 파일: <a href="images/json/chatflow_movie_reservation_2.json" download>chatflow_movie_reservation_2.json</a>

1) Chatflow 편집 캔버스 하단에 있는 **업로드** 버튼을 클릭합니다.

{% include image.html file="education\information_18.png" max-width="900" %}

2) Chatflow 업로드 팝업 창에서 **파일 선택** 버튼을 클릭해 다운로드 한 chatflow_movie_reservation_2" 파일을 선택합니다. (이미지에서는 Chatflow_영화 예매(영상7_Slot_Node설정).json을 선택합니다.)

{% include image.html file="education\information_19.png" max-width="900" %}

3) 선택한 파일명이 로드 되면 **업로드** 버튼을 클릭해 파일을 적용 합니다.

{% include image.html file="education\information_20.png" max-width="900" %}

4) 캔버스에 변경사항이 아래와 같이 반영되었다면,**저장** 버튼을 눌러 Chatflow 업로드 내용을 저장합니다.

{% include image.html file="education\information_21.png" max-width="900" %}

이렇게 업로드를 완료 한 후, 다시 따라하기 영상의 마지막 부분처럼 테스트 메신저 창에서 테스트해 보세요. 강사와 동일한 결과를 얻으 실 수 있습니다. 
