---
title: Intent 이해하기
tags: [intent, basic]
keywords: Basic Conversation
summary: Intent를 통하여 입력 문장을 어떤 의도로 분류할 것인가를 설정할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: intent_basic.html
folder: groupChatbot
previous: {
    title: 챗봇 생성, 
    url: basic_create_chatbot.html
}
next: {
    title: Intent 답변유형 - Dialogflow,
    url: intent_response_dialogflow.html
}
---

## 의도 추론(Intent)
 {% include callout.html content="화면 위치 : [Intents]" type="default" %}
**의도 추론(이하 Intent)**란, 입력 문장이 어떤 의도인지 분류하기 위한 기준입니다.<br/>

해당 메뉴에서는 다음과 같은 내용을 설정할 수 있습니다.<br/> 
 - [Events](intent_basic.html#events)
 - [Training Phrases](intent_basic.html#training-phrases)
 - [Parameter](intent_basic.html#parameter)
 - [Intent 기본정보](intent_basic.html#intent-기본정보)

### Events

**Event(이벤트)**는 일반적으로 Intent는 최종 사용자 표현이 Intent 사용자 입력 예문과 일치할 때 일치됩니다. 하지만 이벤트를 사용하여 Intent를 트리거할 수도 있습니다. 다양한 방법으로 Event를 호출할 수 있습니다.

Event를 입력하면 아래 화면과 같이 태그 형태로 입력되며, Event를 입력할 때에는 다음과 같은 제약사항이 존재합니다.

- Event 명에는 띄워쓰기를 허용하지 않는다.
- Event 명에는 한글은 허용하지 않는다.
- Event 명에는 -와 _를 제외한 특수문를 허용하지 않는다.
- Event 명은 한 Intent 내에서 유일해야 한다.
- 최대 50자까지 허용한다.

{% include image.html file="intent/intent_basic_events.png" max-width="900" caption="Events 추가" %}

### Training Phrases

**Training Phrases(사용자 입력 예문)**은 입력 문장 중 해당 Intent로 구분되길 원하는 문장을 의미합니다. 챗봇은 입력 문장과 동일하거나 가장 비슷한 예문을 가지고 있는 Intent를 찾게 됩니다. 예를 들어 사용자가 '안녕'이라는 말을 했을 때 봇이 '인사'로 알아듣길 원한다면 '인사' Intent에 '안녕'이라는 사용자 입력 예문을 추가하시면 됩니다.<br/>

{% include image.html file="intent/intent_basic_training_phrases.png" max-width="900" caption="사용자 입력 예문 추가" %}

*사용자예문입력*란에 추가하길 원하는 예문을 입력한 뒤 *Enter*를 누르면 예문이 추가됩니다. 추가된 예문은 *전체 등록 예문*에서 확인이 가능하며 등록된 총 예문 개수가 표시됩니다. <br/>

#### 예문에서 정보 추출

{% include note.html content="본 내용은 [엔티티 관리](entity.html) 페이지를 확인하신 후 다시 본다면 이해도를 높일 수 있습니다." %}

입력 문장에서 특정 정보를 얻고자 할 때에는 등록한 예문에 [Parameter](intent.html#parameter)를 추가할 수 있습니다. 즉, 지정한 부분에 적힌 정보를 변수에 담아서 사용할 수 있게 됩니다. 예를 들어 '간식 먹을래?'라는 문장을 입력받았을 때 ***'간식'***이라는 부분에 다양한 음식 종류를 받고 사용하고 싶은 경우 해당 기능을 활용할 수 있습니다.<br/>

지금부터 어떻게 예문에서 정보를 추출할 수 있는지 알아보겠습니다.

{% include image.html file="intent/intent_basic_parameter_add1.png" max-width="900" caption="예문에 Parameter 추가 01" %}

먼저, 입력한 예문에서 추출하고 싶은 영역을 *드래그* 하면 위 그림과 같이 Entity를 선택할 수 있는 창이 뜹니다. <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin:0px 5px"></i>[Entity](entity.html)</span>에 관한 자세한 내용은 다음 페이지에서 계속됩니다.

{% include image.html file="intent/intent_basic_parameter_add2.png" max-width="900" caption="예문에 Parameter 추가 02" %}

특정 Entity를 선택하면 창은 닫히고 예문 아래 Parameter가 추가됩니다. Intent를 저장하면 Parameter를 지정한 영역의 색이 바뀌는 것을 확인할 수 있습니다.<br/>

이렇게 예문을 등록했을때 어떻게 정보가 추출되는지 확인하고 싶다면 우측에 있는 <span style="color:#2c3238;"><i class="fa fa-external-link-square" aria-hidden="true" style="margin: 0px 5px"></i>[테스트 패널](demo_n_test_panel.html#테스트-패널)</span>을 활용할 수 있습니다. NLU Intent 테스트 패널에 등록한 예문과 동일한 패턴의 문장을 입력합니다.

{% include image.html file="intent/intent_basic_nlutest.png" max-width="900" caption="문장에서 추출되는 정보 확인" %}

위의 테스트를 통해 '치킨 먹을래?'라는 문장의 ***치킨***가 지정한 Parameter인 'Food' Parameter에 value로 담긴 것을 확인할 수 있습니다. 또한 '햄버거 먹을래?'라는 문장의 ***'햄버거'*** 역시 해당 Parameter의 value로 추출됩니다. 그러나 마지막 테스트인 '뭐라도 먹을래?'라는 문장에서 ***'뭐라도'***는 value로 뽑아내지 않고 있습니다. 이는 Parameter를 지정할 때 선택하였던 Entity인 'Food'에 '뭐라도'라는 문구가 들어있지 않기 때문입니다. 만약 '먹고 싶어' 앞에 모든 문구를 추출하고 싶다면 Entity를 선택할 때 **sys.any** 라는 Entity를 선택하면 됩니다.

#### 멀티입력

예문에서 동일한 키워드에 동일한 Entity 정보를 담고 싶으면 멀티 입력 방법을 사용할 수 있습니다. Training Phrases 섹션 오른쪽에 있는 멀티입력 텍스트를 클릭하면 아래 화면과 같이 멀티입력 설정이 가능한 영역이 나타납니다. 

{% include image.html file="intent/intent_basic_multi.png" max-width="900" caption="Intent Training Phrases 멀티 입력 버튼 클릭" %}

예문에 포함된 키워드에 추가 / 삭제 하고 싶은 Entity 를 매핑 시키면 됩니다. 키워드 , 엔티티가 하나라도 입력되어 있지 않으면 멀티 입력 추가 / 삭제는 적용되지 않습니다.

먼저, 이렇게 4개의 사용자 예문에 등록된 ***간식***이라는 키워드를 입력하고, Entity 선택 팝업에서 ***Food*** Entity를 선택, 추가 / 삭제 드롭다운 리스트에서 추가를 선택하고 적용 버튼을 클릭하면 멀티로 추가하는 것을 확인 할 수 있습니다.

{% include image.html file="intent/intent_basic_multi_2.png" max-width="900" caption="Intent Training Phrases 멀티 입력 추가" %}

다음으로, 4개의 사용자 예문에 등록된 ***간식***이라는 키워드를 입력하고, Entity 선택 팝업에서 ***Food*** Entity를 선택, 추가 / 삭제 드롭다운 리스트에서 삭제를 선택하고 적용 버튼을 클릭하면 전체 예문에서 ***간식***이라는 키워드에 ***Food*** Entity가 매핑된 Parameter가 삭제되는 것을 확인 할 수 있습니다.

{% include image.html file="intent/intent_basic_multi_3.png" max-width="900" caption="Intent Training Phrases 멀티 입력 삭제" %}

### Parameter

**Parameter(파라미터)**란 사용자와의 대화에서 뽑아내는 정보를 담아내는 껍데기입니다. 일종의 변수와도 같은 개념으로 대화흐름 속에서 특정 값을 전달하기위해 사용됩니다. Parameter에는 2가지 필수 정보가 존재합니다. **Parameter 명**과 **Entity** 입니다. Parameter 명은 변수 명, Entity는 변수 타입과 같은 종류로 볼 수 있습니다.<br/> 
Parameter 등록 방법으로는 크게 2가지가 있습니다.

- [예문에 직접 지정](intent.html#예문에서-정보-추출)
- Intent 내에서 추가

첫 번째 경우는 앞서 사용자 입력 예문에서 설명한 것과 같습니다.<br/> 
두 번째 경우는 대화 흐름 속에서 사용될 예정인 Parameter를 Intent 페이지 최하단에서 추가하는 방법입니다.

#### Parameter 추가

{% include image.html file="intent/intent_basic_parameter_1.png" max-width="900" caption="추출되는 Parameter" %}
Intent 페이지 중간 'Parameters' 영역 우측 [Parameter추가] 버튼 누르면 Parameter를 추가할 수 있는 팝업이 뜨게 됩니다.

{% include image.html file="intent/intent_basic_parameter_2.png" max-width="900" caption="Parameter 추가 팝업" %}

팝업 내에서 Parameter 명을 입력하고 Entity를 선택하게 됩니다. Parameter 명을 입력할 때에는 다음과 같은 제약사항이 존재합니다.

- Parameter 명에는 띄워쓰기를 허용하지 않는다.
- Parameter 명에는 한글은 허용하지 않는다.
- Parameter 명에는 _를 제외한 특수문를 허용하지 않는다.
- Parameter 명은 한 Intent 내에서 유일해야 한다.
- 최대 30자까지 허용한다.

제약사항을 지켜 두 필수값을 입력한 다음 [추가] 버튼을 누르면 해당 Intent에 Parameter가 추가됩니다.

{% include image.html file="intent/intent_basic_parameter_3.png" max-width="900" caption="추가된 Parameter" %}

해당 Intent에 추가되어 있는 전체 Parameter는 '추출되는 Parameter'에서 확인할 수 있습니다. 이때 사용개수는 해당 Parameter가 예문에서 지정되어 사용 중인 개수를 의미합니다. 예문에서 한 군데라도 사용중이라면 삭제가 불가능합니다.

#### Parameter 수정
등록한 Parameter에 대하여 일부 정보를 수정을 할 수 있습니다. 

{% include image.html file="intent/intent_basic_parameter_4.png" max-width="900" caption="Parameter 이름 변경" %}

먼저 **Parameter명**을 변경하고 싶다면 위와 같이 추가되어 있는 위치에서 바로 변경이 가능합니다. 추가적으로 예문에 바로 밑에 위치한 Parameter명을 수정할 경우 Parameters에 있는 Parameter의 Parameter 명이 수정됩니다. <br/>

**Entity** 를 변경하기 위해서는 Entity명 오른쪽에 있는 버튼을 클릭하시면 아래의 화면과 Entity를 선택할 수 있는 팝업이 나타납니다. 팝업에서 변경하고싶은 Entity를 선택하여 변경하면 됩니다.<br/>

{% include image.html file="intent/intent_basic_parameter_5.png" max-width="900" caption="Parameter Entity 변경" %}

**필수**는 Intent Type이 Dialogflow형 일 경우에만 나타납니다. 매개변수가 있어아만 Intent(인텐트)가 완성되는 경우 이 체크박스를 선택하세요. 

**Value**는 대부분의 경우 **$parameter명**과 같은 매개변수 참조로 설정되며, 이는 런타임에 추출되는 값의 자리표시자로 사용됩니다. 그러나 이 필드를 사용하여 대체 값을 선택 할수도 있습니다.
{% include image.html file="intent/intent_basic_parameter_6.png" max-width="900" caption="Parameter Value 팝업" %}

**List**는 값이 List로 반환되어야 하는 경우 이 체크박스를 선택하세요. 만약, 동일 parameter가 한 문장에 여러개가 매핑될 경우, 자동으로 List가 체크됩니다.
{% include image.html file="intent/intent_basic_parameter_7.png" max-width="900" caption="Parameter List 체크" %}

**Prompt**는 Intent Type이 Dialogflow형 일 경우에만 나타납니다. Prompt는 매개변수가 제공되지 않은 경우 에이전트가 최종 사용자에게 묻는질문입니다. 이 필드는 **필수** 필드가 선택된 경우에만 사용됩니다. 
{% include image.html file="intent/intent_basic_parameter_8.png" max-width="900" caption="Parameter 필수 체크시 Prompt 설정" %}
{% include image.html file="intent/intent_basic_parameter_9.png" max-width="900" caption="Prompt 설정 팝업" %}

**Default**는 최종 사용자가 매개변수 값을 제공하지 않을 경우 매개변수에 사용되는 기본값입니다.

### Intent 기본정보

특정 Intent에 대하여 다음과 같은 속성을 지정할 수 있습니다.
- [우선순위](intent_basic.html#우선순위)
- [카테고리 설정](intent_basic.html#카테고리-설정)
- [ML 사용안함](intent_basic.html#ml-사용안함)
- [Intent Type 설정](intent_basic.html#intent-type-설정)

#### 우선순위

각 Intent(인텐트)에 우선순위를 설정할 수 있으며 이는 Intent(인텐트) 매칭 방법에 영향을 줍니다.<br/>

Intent(인텐트) 우선순위를 설정하려면 다음 단계를 따르면 됩니다.<br/>
 1. Intent(인텐트) 이름 왼쪽의 색상 점을 클릭합니다.<br/>
 2. 드롭다운 메뉴에서 우선순위를 선택합니다.<br/>

{% include image.html file="intent/intent_basic_priority.png" max-width="900" caption="우선순위 드롭다운 메뉴" %}

대부분의 경우 **보통** 우선순위를 사용하는 것이 가장 좋습니다. 두 Intent(인텐트) 간에 잠재적인 일치 충돌이 있는 경우 학습 문구를 개선하여 충돌을 해결하는 것이 가장 좋습니다. 학습 문구와의 충돌을 제거할 수 없는 경우 우선순위를 사용하여 Intent(인텐트) 중 선호하는 하나를 우선적으로 사용할 수 있습니다.<br/>

우선순위가 **무시**인 경우 런타임 감지 Intent(인텐트) 요청에서 Intent(인텐트)가 무시됩니다.<br/>

API를 사용할 경우 우선순위는 정수로 제공됩니다. 숫자가 클수록 우선순위가 높습니다. 우선순위가 설정되지 않거나 0이면 값이 500,000으로 변환됩니다. 다음 표는 정수 우선순위와 콘솔의 이름이 지정된 우선순위 간의 관계를 보여줍니다.<br/>

| 콘솔 우선순위 이름 | 콘솔에서 설정된 정수 우선순위 | 이름이 지정된 우선순위에 매핑되는 정수 우선순위(p) 범위|
|-------------|-------------|-------------|
| **Highest** | -1 | 	p < 0 |
| **High** | 250,000 | 0 < p ≤ 250,000 |
| **Normal** | 500,000 | 	p = 0 또는 250,000 < p ≤ 500,000 |
| **Low** | 750,000 | 500,000 < p ≤ 750,000 |
| **Ignore** |	1,000,000 | 	p > 750,000 |

#### 카테고리 설정

각 Intent(인텐트)에 카테고리를 설정할 수 있습니다.

카테고리 이름 오른쪽의 화살표 버튼을 클릭하면 현재 등록되어있는 아래의 화면과 같이 카테고리 목록을 확인 할 수 있습니다. <br/>

현재 등록되어있는 카테고리 목록에서 **카테고리**를 변경하고 싶다면 카테고리 목록에서 설정하고 싶은 카테고리를 클릭 하면 됩니다. <br/>

{% include image.html file="intent/intent_basic_category.png" max-width="900" caption="카테고리 드롭다운 메뉴" %}

추가적으로 새로운 카테고리를 추가하거나 수정하고 싶다면 화살표 버튼 오른쪽에 이미지 버튼을 클릭하면 아래 화면과 같이 카테고리 신규/수정 팝업이 나타납니다. <br/>

해당 팝업 내에서 카테고리 추가, 삭제, 수정이 가능하며, 카테고리명은 중복이 불가하며 최대20자까지 가능합니다.

{% include image.html file="intent/intent_basic_category_popup.png" max-width="900" caption="카테고리 신규/수정 팝업" %}

#### ML 사용안함
Intent(인텐트) 일치는 일반적으로 **문법 일치 및 ML 일치**를 모두 포함하며, ML 일치를 사용 중지하고 문법 일치만 사용하도록 Intent(인텐트)를 구성할 수 있습니다.

거의 완성된 학습 문구의 제공이 가능한 Intent(인텐트)의 과도한 트리거를 방지하거나 줄이기 위하여 이 설정을 해야 할 수 있습니다.

{% include tip.html content="문법 일치에는 유연성이 있으므로 이 설정은 일치검색을 적용하지 않습니다." %}

{% include image.html file="intent/intent_basic_ml_before.png" max-width="900" caption="ML 사용안함 설정 전" %}
{% include image.html file="intent/intent_basic_ml_after.png" max-width="900" caption="ML 사용안함 설정 후" %} 

#### Intent Type 설정
Intent Type은 Dialogflow형과 chatflow형 두 Type중에 한가지를 선택 가능합니다. 기본 값은 Dialogflow형으로 되어있습니다.<br/>

Dialogflow형은 구글 Dialogflow와 동일한 방식으로 Intent 답변을 설정합니다.<br/>

Chatflow형은 답변을 Chatflow에서 시각화하여 설정합니다.<br/>

{% include image.html file="intent/intent_basic_dialogflow.png" max-width="900" caption="Dialogflow Type 설정" %}
{% include image.html file="intent/intent_basic_chatflow.png" max-width="900" caption="Chatflow Type 설정" %} 

Intent Type을 변경할 경우, 일부 데이터가 초기화 될 수 있으므로 아래 화면과 같이 팝업이 나타나며 확인 버튼을 클릭하면 Type이 변경됩니다.

{% include image.html file="intent/intent_basic_type_popup.png" max-width="900" caption="Intent Type 변경 팝업" %} 


## Intent 업로드/다운로드

챗봇은 편의 기능의 일종으로 Intent 업로드/다운로드 기능을 제공하고 있습니다. 해당 기능은 CSV파일로 지원됩니다.

### 업로드
{% include callout.html content="화면 위치 : [Intents] > [업로드]" type="default" %}
업로드 형식에 맞추어 작성한 JSON 파일을 올려주시면 자동으로 Intent가 생성됩니다. 업로드 파일은 다음과 같은 제약사항이 존재합니다.
 - JSON 파일만 가능합니다.
 - 동시에 여러개의파일을 업로드 할 수 있습니다.
 - 최대 파일수 : 50, 파일 당 최대 3MB까지 업로드 할 수 있습니다.
 - 파일명은 최대 50자까지 허용합니다.
{% include image.html file="intent/intent_basic_upload_3.png" max-width="900" caption="Intent 업로드 버튼" %}
{% include image.html file="intent/intent_basic_upload.png" max-width="900" caption="Intent 업로드 화면" %}

파일 선택 버튼을 클릭하면 업로드 파일을 선택 할 수 있으며, 동시에 여러개의 파일을 선택하여 등록 할 수 있습니다.

{% include image.html file="intent/intent_basic_upload_2.png" max-width="900" caption="Intent 업로드 등록 후" %}


### 다운로드
생성한 Intent를 JSON 파일로 다운로드 받으실 수 있습니다. 챗봇 별 전체 Intent 다운로드 기능과 Intent 별 단건 다운로드 기능을 제공하고 있습니다.

#### 단건 다운로드
{% include callout.html content="버튼 위치 : [Intents] > 특정 Intent 선택 > [다운로드]" type="default" %}

단건 다운로드 시 하나의 Intent에 관한 정보가 JSON 파일로 저장됩니다.

{% include image.html file="intent/intent_basic_download_2.png" max-width="900" caption="Intent 다운로드 버튼" %}

#### 다건 다운로드
{% include callout.html content="버튼 위치 : [Intents] >[전체다운로드]" type="default" %}

다건 다운로드 시 챗봇 전체 Intent가 JSON 파일로 저장되며 zip 파일로 압축되어 제공됩니다.

{% include image.html file="intent/intent_basic_download.png" max-width="900" caption="Intent 전체다운로드 버튼" %}

{% include warning.html content="유니코드가 깨질 수 있기 때문에 압축을 풀때는 알집 8버전 이상, 혹은 다른 압축해제 프로그램 사용을 권장 합니다." %}