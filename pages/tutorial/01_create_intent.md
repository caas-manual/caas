---
title: Intent 생성하기
tags: [intent, tutorial, basic]
keywords: [tutorial, intent]
summary: 챗봇의 기본 구조를 이해할 수 있습니다.
sidebar: tutorial_sidebar
permalink: 01_create_intent.html
folder: tutorial
next: {
    title: 답변 만들기,
    url: 02_create_response.html
}
---

챗봇을 사용하는 기본적인 내용은 튜토리얼의 ***1. Intent 생성하기***와 ***2. Chatflow 생성하기***를 통해 학습할 수 있습니다. 

챗봇은 대화하는 프로그램입니다. 즉, 챗봇이 어떤 말을 알아들을 것인지, 이 챗봇의 역할이 뭔지를 정의하고, 알아들은 말에 대해 어떻게 답변할지를 정의하면 하나의 대화, 챗봇이 완성되는 거겠죠?

{% include image.html file="education\intent_01.png" max-width="900" %}

## 의도추론 이란?
**의도(Intent)**는 챗봇이 어떤 말을 알아 들을지 ***사용자의 발화를 분류하는 기준***을 의미합니다. 

챗봇은 챗봇 개발자가 정의한 Intent를 기준으로 자신에게 말을 건 사용자에게 어떻게 반응할지를 정하게 됩니다.

챗봇 개발자는 Intent를 정의할 때, Intent별로 사용자가 할법한 말, 예문을 챗봇에게 알려줘야 합니다. 예를 들어, "영화예매"를 하고 싶어 하는 사용자는 "저 영화 보려구요."와 같은 말을 할거야 라는 식으로 말이죠.

이렇게 정의한 Intent를 기준으로 사용자가 말을 걸면 해당 발화를 NLU 기술을 통해 특정 Intent로 분류하는 과정을 ***챗봇의 의도추론***이라고 합니다.

{% include image.html file="education\intent_02.png" max-width="900" %}

아무리 뛰어난 NLU 기술의 의도분류 프로그램을 사용한다고 할지라도 애매하게 의도를 정의한다면 챗봇의 성능은 떨어질 수 밖에 없습니다. 그 만큼 Intent 정의 및 예문 등록이 중요한 작업임을 기억해 주세요!


이렇게 정의한 Intent를 기준으로 사용자가 말을 걸면 해당 발화를 NLU 기술을 통해 특정 Intent로 분류하는 과정을 챗봇의 의도추론이라고 합니다.

## Intent 생성 따라하기

{% include callout.html content="따라하기는 AI 서비스 포탈 환경에서 진행됩니다. AI 서비스 포탈에 로그인 해주세요." type="default" %}

### 따라하기 영상 1 : AI 서비스 포탈 들어가기

이번 따라하기에서는 실습환경에 로그인 해서 챗봇 플랫폼까지 접속하는 방법을 가이드 해드립니다. 

혹시 따라하기 영상1을 따라하는 도중 문제가 있으신 분은 교육 강사에게 꼭! 문의해 주세요.

아래 영상을 클릭해서 시청해 주세요. 

{% include video.html file="intent_01.mp4" type="mp4" max-width="900"%}

### 따라하기 영상 2 : Intent 만들기

이번 따라하기에서는 "영화 예매" 의도를 생성하고 예문을 등록하는 실습을 해보도록 하겠습니다. 

이번 따라하기 영상을 마치면, 실습환경 플랫폼과 테스트 메신저에서 다음과 같은 화면 결과를 얻으실 수 있습니다. 

{% include image.html file="education\intent_03.png" max-width="900" %}

아래 영상을 클릭해서 시청해 주세요. 

{% include video.html file="intent_02.mp4" type="mp4" %}


Intent 생성 따라하기 잘 따라 오셨나요? 

따라하기 실습이 잘 되지 않는다면, 아래 Hint를 참고해서 따라해 주세요.

*** HINT ***

교육 강사가 작성한 Intent 정보를 다운로드한 파일 입니다. 아래 파일을 다운로드 받아, 아래 가이드 대로 업로드 해보세요.

업로드 하시면, 기존에 직접 작업하던 Intent 상세 내역이 업로드 한 파일의 내용으로 갱신되니 본인의 작업을 유지하기 위해서는 작업하던 Intent명을 "영화 예매"가 아닌 다른 이름으로 변경해 주세요. 

* 다운로드 파일: <a href="images/json/intent_movie_reservation_1.json" download>intent_movie_reservation_1.json</a>

1) Intent 목록조회 화면에서 목록 위에 **업로드** 버튼을 클릭합니다.

{% include image.html file="education\intent_04.png" max-width="900" %}

2) Intent 업로드 화면에서 **파일선택** 버튼을 클릭해 다운로드 한 "intent_movie_reservation_1.json" 파일을 선택합니다. (이미지에서는 Intent_영화_예매.json을 선택합니다.)

{% include image.html file="education\intent_05.png" max-width="900" %}

3) 선택한 파일 정보가 로드 되면 **저장** 버튼을 클릭합니다.

{% include image.html file="education\intent_06.png" max-width="900" %}

4) 확인 창이 보여지면 **확인** 버튼을 클릭합니다.

{% include image.html file="education\intent_07.png" max-width="900" %}

5) 성공했다는 메시지가 보여지는 걸 확인한 후 **취소** 버튼을 클릭해 다시 목록 조회 화면으로 돌아옵니다. 

{% include image.html file="education\intent_08.png" max-width="900" %}

이렇게 업로드를 완료 한 후, 다시 따라하기 영상의 마지막 부분처럼 테스트 메신저 창에서 테스트해 보세요. 동일한 결과를 얻으실 수 있습니다. 