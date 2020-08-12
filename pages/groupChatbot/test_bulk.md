---
title: Bulk Test
tags: [test, basic, bulk Test]
keywords: Basic Conversation
summary: 사용자 발화 및 Intent(인텐트) 매핑 정보를 다량으로 입력하여 정확도 결과를 확인하기 위한 테스트입니다.
sidebar: chatbot_doc_sidebar
permalink: test_bulk.html
folder: groupChatbot
previous: {
    title: Simulator, 
    url: test_simulator.html
}
next: {
    title: Native App(API),
    url: channel_native_app.html
}
---

## Bulk Test
 {% include callout.html content="화면 위치 : [Bulk Test]" type="default" %}
**Bulk Test**는 사용자 발화에 따른 Intent 매핑 정보를 다량으로 입력하여 매핑 결과를 확인하기 위한 테스트입니다.<br/>

해당 메뉴에서는 다음과 같은 내용을 이용할 수 있습니다.<br/>
 - [Bulk Test 조회](test_bulk.html#bulk-test-조회) 
 - [Bulk Test 업로드/다운로드](test_bulk.html#bulk-test-업로드다운로드)
 

## Bulk Test 조회 
Bulk Test 메뉴에 들어가면 업로드한 테스트들의 목록을 확인할 수 있습니다. 해당 목록에서는 업로드 기간, 상태, 테스트명으로 검색이 가능합니다.
<!-- 테스트 목록 화면 -->
{% include image.html file="test_bulkTest/00_bulktest_intro.PNG" max-width="900" caption="Bulk Test 목록 조회 초기화면" %}  

## Bulk Test 업로드/다운로드

Chatbot(챗봇)은 편의 기능의 일종으로 업로드/다운로드 기능을 제공하고 있습니다. 해당 기능은 JSON파일로 지원됩니다.<br/>

### 업로드
{% include callout.html content="화면 위치 : [Bulk Test] > [업로드]" type="default" %}

Bulk Test 목록 조회화면 하단 우측에 **업로드** 버튼이 존재합니다. 업로드 형식에 맞추어 작성한 JSON파일을 올려주시면 자동으로 API가 생성됩니다. 업로드 파일은 다음과 같은 제약사항이 존재합니다.
 - CSV파일만 가능합니다. (메모장 등을 사용하여 UTF-8 파일 형태로 저장하시기 바랍니다.)
 - 최대 파일 수 : 5, 파일 당 최대 3MB까지 업로드할 수 있습니다.
 - 파일명은 최대 50자까지 허용합니다.
 - 정답 Intent가 없는 문장은 성능 지표 계산에서 제외됩니다.
 - A컬럼에 테스트를 원하는 예문, B컬럼에 정답 Intent를 등록해주세요.
 -  컬럼은 콤마(,)로 구분됩니다.
 -  선택된 언어 기준으로 수행됩니다.
<!-- 업로드 화면 -->
{% include image.html file="test_bulkTest/01_bulktest_upload1.PNG" max-width="900" caption="Bulk Test 업로드" %} 

#### 업로드 형식
입력하고자 하는 정보는 테스트를 원하는 예문, 그리고 매칭이 예상되는 정답 Intent명 두 가지로, UTF-8형식으로 인코딩한 CSV파일을 업로드하면 됩니다.

필수값에 해당하는 정보가 없거나 형식이 맞지 않으면 파일은 업로드에 실패하게 됩니다.

{% include warning.html content="정보 구분을 위한 콤마(,)간 띄워쓰기는 불가합니다." %}

#### 테스트 파일 만들기 예시
<!-- 입력 데이터 변환 전 (변환1) -->
{% include image.html file="test_bulkTest/05_bulktest_sample_before.PNG" max-width="900" caption="UTF-8 변환 전" %}  
<!-- 입력 데이터 변환 뒤 (변환2) -->
{% include image.html file="test_bulkTest/06_bulktest_sample_after.PNG" max-width="900" caption="UTF-8 변환 후" %}  

#### 테스트 결과 예시
<!-- 테스트 데이터 결과 (결과) -->
{% include image.html file="test_bulkTest/07_bulktest_test_result.PNG" max-width="900" caption="다운로드한 테스트 결과" %}  

### 다운로드
업로드한 Bulk Test의 결과를 CSV 파일로 다운로드 받으실 수 있습니다. 업로드된 테스트 건 별로 다운로드 기능을 제공하고 있습니다.

{% include callout.html content="버튼 위치 : [Bulk Test] > [다운로드]" type="default" %}

<!-- bulk test 목록 화면 -->
{% include image.html file="test_bulkTest/04_bulktest_result.PNG" max-width="900" caption="Bulk Test 조회" %}  

Bulk Test 목록 조회화면의 각 결과의 우측에 **다운로드**  버튼이 존재하며 업로드 성공 이후에 생성됩니다. 단건 다운로드 시 하나의 Bulk Test에 관한 정보가 CSV 파일로 저장됩니다.

