---
title: Native App(API)
tags: [API,channel,advanced]
keywords: Basic Conversation
summary:  챗봇서비스의 API를 활용하여 직접 만든 대화채널에 연결할 수 있습니다.
sidebar: chatbot_doc_sidebar
permalink: channel_native_app.html
folder: groupChatbot
previous: {
    title: Bulk Test, 
    url: test_bulk.html
}
next: {
    title: Front UI,
    url: channel_front_ui.html
}
---
## Native App(API)
채널에서 챗봇 서비스와 연계하기 위해 제공되는 API들과 각 이벤트시에 처리되고 활용되는 데이터 항목에 대해 설명합니다.

### 대화 처리 API
대화 채널에서 주고 받는 대화를 처리하는 API. 자연어에 대한 질의를 처리하고 그 결과를 구조화된 데이터로 반환하는 API입니다.

#### 기본 정보

| Field | Information |
|--------|--------|
| URL | https://eapi.singlex.com/chatbot/챗봇ID/gateway |
| METHOD | POST |
| HEADER | "Content-Type" : "application/json;" |
| HEADER | "Authorization" : "Bearer " + 인증 token 값 |
| HEADER | "X-CHATBOT-SESSION" : 대화 세션 아이디 |

{% include note.html content="<br>대화 처리 API 호출 시 응답 받은 Response Header에 있는 X-CHATBOT-SESSION 항목의 value값을 
다음 대화 처리 API 호출 시 <br>Request Header에 설정하여 보내면 동일 세션으로 대화를 이어갈 수 있습니다.<br>
Request Header에 X-CHATBOT-SESSION 값을 설정하지 않을 경우 새로운 대화로 인식됩니다." %}

#### PATH Parameters 정보

| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| chatbotId | String | Yes | 챗봇 아이디 |


#### REQUEST 정보

```json
{
  "query": {JSON},
  "payload": {JSON},
  "parameters": {JSON},
  "tags": {JSON},
  "requestSentimentYn": "string"
}
```

| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| query | JSON | Yes | 대화 질의 정보 |
| payload | JSON | No | chatflow로 전달되는 파라미터 정보 (전달할 파라미터는 key, value 형태로 전달해야 합니다.) |
| parameters | JSON | No | Dialogflow event에 전달되는 파라미터 정보 (전달할 파라미터는 key, value 형태로 전달해야 합니다.) |
| tags | JSON | No | 로그성 정보 (key, value 형태로 전달해야 합니다.) |
| requestSentimentYn | String | No | 감성분석 사용 여부 (챗봇이 감성분석 사용 설정이 되어 있어야 합니다.) |

##### REQUEST Object 정보

 * query Object

```json
{
  "text": "string",
  "event": "string",
  "languageCode": "string"
}
``` 

| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| text | String | Yes | 사용자 대화 문장 |
| event | String | No | 사용자 이벤트명 (text와 event 둘 중 하나는 필수로 있어야 합니다.) |
| languageCode | String | Yes | 언어 코드 |

#### RESPONSE 정보

```json
{
	"chatbotId": "string",
	"requestId": "string",
	"query": {JSON},
	"queryResult": {JSON},
	"tags": {JSON}
}
```

| KEY | TYPE | Required | Description |
|--------|--------|--------|--------|
| chatbotId | String | Yes | 챗봇 아이디 |
| requestId | String | Yes | 챗봇 대화 아이디 ( 이전 대화 조회 및 피드백 시 사용 ) |
| query | JSON | Yes | 대화 질의 정보 |
| queryResult | JSON | Yes | 대화 응답 |
| tags | JSON | No | 로그성 정보 (key, value 형태로 request로 보낸 정보) |

##### RESPONSE Object 정보

 * query Object

```json
{
  "text": "string",
  "event": "string",
  "languageCode": "string"
}
``` 
 
| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| text | String | Yes | 사용자 대화 문장 |
| event | String | No | 사용자 이벤트명 (text와 event 둘 중 하나는 필수로 있어야 합니다.) |
| languageCode | String | Yes | 언어 코드 |

 * queryResult Object

```json
{
  "parameters":JSON,
  "text":"string",
  "messages":[JSON],
  "fulfillmentMessages":[JSON],
  "customPayload":JSON,
  "intent":JSON,
  "sentiment":number,
  "slotNode":"string"
}
```
 
| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| parameters | JSON | No | 파라미터 정보 |
| text | String | No | 대화에 대한 text 응답 (Intent의 답변 유형이 Dialogflow형인 경우) |
| message | JSON Array | No | 대화에 대한 응답이 Chatflow형인 경우 응답 메세지 |
| fulfillmentMessages | JSON Array | Yes | 대화에 대한 응답 메세지 |
| customPayload | JSON | No | 고객의 Webhook 호출의 경우 반환된 응답 메세지 |
| intent | JSON | Yes | 대화에 연결된 intent 정보 |
| sentiment | number | No | 감성분석 결과 -1.0 (부정적 감정)과 1.0 (긍정적 감정) 사이의 값 |
| slotNode | String | Yes | 대화에 대한 응답이 slat Node인지 여부 |

 * queryResult.messages Object

```json
{
  "nodeType":"string",
  "message":"string",
  "imageUrl":"string",
  "panelType":"string",
  "response":"string",
  "buttons":[JSON],
  "card":[JSON],
  "quickReply":[JSON]
}
```
 
| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| nodeType | String | No | 노드 타입 |
| message | String | No | 메세지 |
| imageUrl | String | No | 이미지 URL |
| panelType | String | Yes | 패널 타입 (basic, carousel, custom, error) |
| response | String | No | 응답 메세지 |
| buttons | JSON Array | No | 버튼 object 정보 |
| card | JSON Array | No | card object 정보 |
| quickReply | JSON Array | No | quickReply object 정보 |


 * queryResult.messages.buttons Object

```json
{
  "order":"string",
  "label":"string",
  "value":"string",
  "type":"string",
  "parameters":[JSON]
}
```
 
| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| order | String | Yes | 버튼 순서 |
| label | String | Yes | 채널 화면에서 보여질 버튼 명칭 |
| value | String | Yes | 채널에서 옵션에 따라 처리할 정보 |
| type | String | Yes | 버튼 타입 |
| parameters | JSON Array | No | 버튼 파라미터 정보 |

 * 버튼 타입의 유형에는 아래와 같습니다.
 
| Type | 설명 |
|--------|--------|
| Text | 일반적인 선택지입니다. Value에는 일반 텍스트가 들어갑니다. |
| Web Link | 웹을 연결할 때 사용합니다. Value에 연결할 웹 URL 정보를 설정합니다. |
| Intent 호출	 | 다른 Intent를 직접적으로 호출합니다. |
| 내부 App 실행 | 모바일에서 내부 App을 연결할 때 사용합니다. |
| 외부 App 실행 | 모바일에서 외부 App을 연결할 때 사용합니다. |
| 전화걸기 | 일반적으로 모바일 폰에서 바로 전화를 연결합니다.  Value에 전화 번호를 설정합니다. |

 * queryResult.messages.card Object

```json
{
  "order":"string",
  "title":"string",
  "subTitle":"string",
  "imageUrl":"string",
  "buttons":[JSON]
}
```
 
| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| order | String | Yes | 순서 정보 |
| title | String | Yes | 카드 Title 정보 |
| subTitle | String | No | 카드 추가 설명 정보 |
| imageUrl | String | Yes | 이미지 URL 정보 |
| buttons | JSON Array | No | 버튼 object 정보 |

 * queryResult.messages.quickReply Object

```json
{
  "order":"string",
  "label":"string",
  "value":"string",
  "type":"string",
  "parameters":[JSON]
}
```
 
| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| order | String | Yes | 버튼 순서 |
| label | String | Yes | 채널 화면에서 보여질 퀵 버튼 명칭 |
| value | String | Yes | 채널에서 옵션에 따라 처리할 정보 |
| type | String | Yes | 퀵 버튼 타입 |
| parameters | JSON Array | No | 퀵 버튼 파라미터 정보 |

 * queryResult.intent Object

```json
{
  "id":"string",
  "name":"string",
  "confidence":number
}
```
 
| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| id | String | Yes | Intent 아이디 |
| name | String | Yes | Intent 이름 |
| confidence | number | Yes | Intent 매칭 신뢰성. 0.0 ~ 1.0 사이의 값 |

##### ERROR CODE 

 * ERROR RESPONSE

```json
{
  "code": "string",
  "message": "string"
}
``` 
 
| Code | Message |
|--------|--------------------------|
| C001 | Invalid Input Value |
| C002 | Method is not allowed. |
| C003 | Entity not found. |
| C004 | Server error |
| C005 | Invalid type or value |
| C006 | Access is denied. |
| C007 | Connection timeout |
| M001 | Chatbot is not available. |
| M002 | Chatbot is duplicated. |
| M003 | Chatbot input is invalid. |
| M004 | Language is not supported. |
| M005 | Language supported by this chatbot is not found. |
| M006 | You must enter either text or event name. |
| M007 | Input Value length must not exceed 256 characters |
| M008 | Today is not included in the contract period. |
| M009 | Contract startDate or endDate is not found. |
| M010 | Contract status of this chatbot is invalid. |
| M011 | Contract status is not defined. |
| M012 | Please try again in a few minutes. |

##### 대화 API 예시 

 * 대화 API 예시1 : REQUEST

```json
{
  "query": {
    "text": "안녕",
    "languageCode":"ko"
  }
}
``` 

 * 대화 API 예시1 : RESPONSE

```json
{
    "chatbotId": "ecf40c54-1c44-484d-8e8b-2e4a1844e03d",
    "query": {
        "text": "안녕",
        "event": "",
        "languageCode": "ko"
    },
    "queryResult": {
        "parameters": {},
        "text": "안녕하세요!",
        "messages": [],
        "fulfillmentMessages": [
            {
                "text": {
                    "text": [
                        "안녕하세요!"
                    ]
                }
            }
        ],
        "customPayload": {},
        "intent": {
            "id": "9994865e-42e5-448b-acbf-30d28cf19ab4",
            "name": "Default Welcome Intent",
            "confidence": 1.0
        },
        "slotNode": "N"
    },
    "requestId": "a14cc29a-5978-44b1-91ab-81a4b27395f4",
    "tags": {}
}
``` 

 * 대화 API 예시2 : REQUEST

```json
{
  "query": {
    "text": "매장정보",
    "languageCode":"ko"
  },
  "tags" : {
   	 "userId": "hong"
  }
}
``` 

 * 대화 API 예시2 : RESPONSE

```json
{
    "chatbotId": "5870d2ce-132c-4d65-849a-ef75d9346b0e",
    "query": {
        "text": "매장정보",
        "event": "",
        "languageCode": "ko"
    },
    "queryResult": {
        "parameters": {},
        "text": "",
        "messages": [
            {
                "nodeType": null,
                "message": "",
                "imageUrl": "",
                "panelType": "carousel",
                "response": null,
                "buttons": [],
                "card": [
                    {
                        "order": "0",
                        "title": "스타벅스",
                        "subTitle": "스타벅스 발산역점",
                        "imageUrl": "https://i.ytimg.com/vi/18Kt-TOkWFE/maxresdefault.jpg",
                        "buttons": [
                            {
                                "order": "0",
                                "label": "매장 설명",
                                "value": "f98c4aff-0c7c-4eb1-bd90-b900c5252bf8",
                                "type": "callIntent",
                                "parameters": []
                            },
                            {
                                "order": "1",
                                "label": "메뉴 보기",
                                "value": "90bb7bbb-5756-4456-8c85-5608ffc29344",
                                "type": "callIntent",
                                "parameters": []
                            }
                        ]
                    },
                    {
                        "order": "1",
                        "title": "공차",
                        "subTitle": "공차 지구점",
                        "imageUrl": "https://newsimg.sedaily.com/2019/04/12/1VHU6BT448_3.jpg",
                        "buttons": [
                            {
                                "order": "0",
                                "label": "매장 설명",
                                "value": "ac207117-92c5-4c1e-8f87-3727cbe973fd",
                                "type": "callIntent",
                                "parameters": []
                            },
                            {
                                "order": "1",
                                "label": "메뉴 보기",
                                "value": "a334a321-ccee-416f-be83-8dda8f6f859e",
                                "type": "callIntent",
                                "parameters": []
                            }
                        ]
                    },
                    {
                        "order": "2",
                        "title": "해피마루",
                        "subTitle": "LG CNS 해피마루",
                        "imageUrl": "https://img1.daumcdn.net/thumb/R800x0/350CE3F503652D931",
                        "buttons": [
                            {
                                "order": "0",
                                "label": "매장 설명",
                                "value": "3a9fd54e-2f01-416b-8ad4-de1ca80c9ac3",
                                "type": "callIntent",
                                "parameters": []
                            },
                            {
                                "order": "1",
                                "label": "메뉴 준비중",
                                "value": "e4e42365-3501-4a59-97a2-e38574a48a6c",
                                "type": "callIntent",
                                "parameters": []
                            }
                        ]
                    }
                ],
                "quickReply": []
            }
        ],
        "fulfillmentMessages": [
            {
                "text": {
                    "text": [
                        ""
                    ]
                }
            },
            {
                "card": {
                    "imageUri": "https://i.ytimg.com/vi/18Kt-TOkWFE/maxresdefault.jpg",
                    "subtitle": "스타벅스 발산역점",
                    "title": "스타벅스"
                }
            },
            {
                "card": {
                    "imageUri": "https://newsimg.sedaily.com/2019/04/12/1VHU6BT448_3.jpg",
                    "subtitle": "공차 지구점",
                    "title": "공차"
                }
            },
            {
                "card": {
                    "imageUri": "https://img1.daumcdn.net/thumb/R800x0/350CE3F503652D931",
                    "subtitle": "LG CNS 해피마루",
                    "title": "해피마루"
                }
            }
        ],
        "customPayload": {},
        "intent": {
            "id": "bd4df229-b6cf-4487-9200-96b1f514a854",
            "name": "[매장]_carousel",
            "confidence": 0.82189095
        },
        "slotNode": "N"
    },
    "requestId": "5c8d53d8-e7ae-419a-9c34-68426e193769",
    "tags": {
        "userId": "hong"
    }
}
``` 



### 이전 대화 조회 API 
대화 채널에서 이전 대화 목록을 조회하는 API입니다.

#### 기본 정보

| Field | Information |
|--------|--------|
| URL | https://eapi.singlex.com/history/챗봇ID/history
| METHOD | POST |
| HEADER | "Content-Type" : "application/json;" |
| HEADER | "Authorization" : "Bearer " + 인증 token 값 |

#### PATH Parameters 정보

| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| chatbotId | String | Yes | 챗봇 아이디 |


#### REQUEST 정보

```json
{
  "userId": "string",
  "languageCode": "string",
  "requestId": "string"
}
```

| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| userId | String | Yes | 사용자 아이디 |
| languageCode | String | Yes | 언어 코드 |
| requestId | String | Yes | 챗봇 대화 아이디 |

#### RESPONSE 정보

```json
[
  {
    "userId": "string",
    "requestId": "string",
    "chatDate": "string",
    "response": JSON,
    "feedbackYn": "string",
    "positiveYn": "string",
    "feedbackContent": "string
  }
]
```

| KEY | TYPE | Required | Description |
|--------|--------|--------|--------|
| userId | String | Yes | 사용자 아이디 |
| requestId | String | Yes | 챗봇 대화 아이디 |
| chatDate | String | Yes | 대화 일시 |
| response | JSON | Yes | 대화 응답 메세지 (대화 처리 API의 응답과 동일) |
| feedbackYn | String | Yes | 대화 피드백 여부 |
| positiveYn | String | No | 피드백 긍정, 부정 여부 |
| feedbackContent | String | No | 피드백 내용 |

##### 이전 대화 조회 API 예시 

 * 이전 대화 조회 API 예시 : REQUEST

```json
{
  "userId": "gildong",
  "requestId": "68772a19-09f9-4cda-a68b-44cea01231",
  "languageCode":"ko"
}
``` 

 * 이전 대화 조회 API 예시 : RESPONSE

```json
[
    {
        "requestId": "0b8c80b2-addc-4e04-b685-02995f821544",
        "userId": "gildong",
        "chatDate": "2020-08-30T00:43:14Z",
        "feedbackYn": "Y",
        "positiveYn": "N",
        "feedbackContent": "부정확한 답변입니다.",
        "response": {
            "chatbotId": "5870d2ce-132c-4d65-849a-ef75d9346b0e",
            "requestId": "0b8c80b2-addc-4e04-b685-02995f821544",
            "query": {
                "text": "안녕",
                "event": "",
                "languageCode": "ko"
            },
            "queryResult": {
                "fulfillmentMessages": [
                    {
                        "text": {
                            "text": [
                                "안녕? Alice 잘되요"
                            ]
                        }
                    }
                ],
                "sentiment": 0.0,
                "messages": [
                    {
                        "quickReply": [],
                        "buttons": [],
                        "imageUrl": "",
                        "message": "안녕? Alice 잘되요",
                        "panelType": "basic",
                        "card": []
                    }
                ],
                "text": "",
                "customPayload": {},
                "intent": {
                    "confidence": 1.0,
                    "name": "01.Alice 검증 - 인사",
                    "id": "1d3a9304-de9f-4199-a970-49d2aa713d7c"
                },
                "slotNode": "N",
                "parameters": {}
            },
            "channelId": "default",
            "tags": {
                "userId": "gildong"
            }
        }
    },
	  {
        "requestId": "449c88f3-3ba5-41b2-a9b5-64c2adcbd0dc",
        "userId": "gildong",
        "chatDate": "2020-08-30T00:44:13Z",
        "response": {
            "chatbotId": "5870d2ce-132c-4d65-849a-ef75d9346b0e",
            "requestId": "449c88f3-3ba5-41b2-a9b5-64c2adcbd0dc",
            "query": {
                "text": "아메리카노",
                "event": "",
                "languageCode": "ko"
            },
            "queryResult": {
                "fulfillmentMessages": [
                    {
                        "text": {
                            "text": [
                                "죄송해요. 다시 들려 주실래요?"
                            ]
                        }
                    }
                ],
                "sentiment": 0.0,
                "messages": [],
                "text": "죄송해요. 다시 들려 주실래요?",
                "customPayload": {},
                "intent": {
                    "confidence": 1.0,
                    "name": "Default Fallback Intent",
                    "id": "442c83b5-fcbc-4001-a6c8-78edc34dba67"
                },
                "slotNode": "N",
                "parameters": {}
            },
            "channelId": "default",
            "tags": {
                "userId": "gildong"
            }
        }
    }
]
```


### 사용자 피드백 API 
대화 채널에서 챗봇 대화에 대해서 사용자 평가를 처리하는 API. 대화에 대한 피드백과 챗봇에 대한 피드백을 입력할 수 있습니다.

#### 기본 정보

| Field | Information |
|--------|--------|
| URL | https://eapi.singlex.com/feedback/챗봇ID/feedback
| METHOD | POST |
| HEADER | "Content-Type" : "application/json;" |
| HEADER | "Authorization" : "Bearer " + 인증 token 값 |

#### PATH Parameters 정보

| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| chatbotId | String | Yes | 챗봇 아이디 |


#### REQUEST 정보

```json
{
  "singleFeedbackYn": "string",
  "feedbackScore": "string",
  "requestId": "string",
  "userId": "string",
  "feedbackContent": "string"
}
```

| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| singleFeedbackYn | String | Yes | 대화 또는 챗봇의 피드백 여부 설정 (대화 피드백:Y, 챗봇 피드백:N) |
| feedbackScore | String | Yes | 피드백 점수 ( 대화 긍정:5, 대화 부정:1, 챗봇 점수:1~5 사이 값)  |
| requestId | String | No | 챗봇 대화 아이디 |
| userId | String | No | 사용자 아이디 |
| feedbackContent | String | No | 피드백 내용 |


#### RESPONSE 정보

```json
{
  "status": number,
  "message": "string"
}

```

| KEY | TYPE | Required | Description |
|--------|--------|--------|--------|
| status | number | Yes | 응답 상태 정보 |
| message | String | Yes | 응답 메세지 정보 (SUCCESS, FAIL) |

##### 사용자 피드백 API 예시

 * 대화 피드백 API 예시 : REQUEST

```json
{
  "singleFeedbackYn": "Y",
  "feedbackScore": "1",   // 부정, 긍정일 경우 5
  "requestId": "449c88f3-3ba5-41b2-a9b5-64c28376dd",
  "userId": "gildong",
  "feedbackContent":"내용이 부정확합니다."  // 부정인 경우 내용 입력. 긍정은 내용 없이 호출
}
``` 

 * 대화 피드백 API 예시 : RESPONSE

```json
{
  "status": 200,
  "message": "SUCCESS"
}
```

 * 챗봇 피드백 API 예시 : REQUEST

```json
{
  "singleFeedbackYn": "N",
  "feedbackScore": "5",   // 1~5 사이 값
  "feedbackContent":"매우 만족합니다."
}
``` 

 * 챗봇 피드백 API 예시 : RESPONSE

```json
{
  "status": 200,
  "message": "SUCCESS"
}
```


### Push 미확인 메시지 건수 조회 API
Push 수신 후 사용자가 확인하지 않은 메시지 건수를 조회하는 API.

#### 기본 정보

| Field | Information |
|--------|--------|
| URL | https://eapi.singlex.com/chatbot/push/unreadMessageCount
| METHOD | GET |
| HEADER | "Authorization" : "Bearer " + 인증 token 값 |

#### Query Parameters 정보

| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| chatbotId | String | Yes | 챗봇 아이디 |
| languageCode | String | Yes | 챗봇 언어 코드 (Ex. ko, en) |
| userId | String | Yes | 암호화된 사용자 아이디 ([※ 사용자 아이디 암호화 API 참고](#사용자-아이디-암호화-api)) |

#### RESPONSE 정보

```json
{
  "count": number
}
```

| KEY | TYPE | Required | Description |
|--------|--------|--------|--------|
| count | number | Yes | 미확인 메시지 건수 |

##### Push 미확인 메시지 건수 조회 API 예시

 * "honggildong" 사용자 Push 미확인 메시지 건수 조회 API 예시 : REQUEST

```
https://eapi.singlex.com/chatbot/push/unreadMessageCount?chatbotId=5e7b3cb8-e3ee-49b7-9af5-be5ac58a28df&languageCode=ko&userId=R6XTkqJn9N5p28iyGjRBVw%3D%3D
``` 

 * "honggildong" 사용자 Push 미확인 메시지 건수 조회 API 예시 : RESPONSE

```json
{
  "count": 3
}
``` 


### 사용자 아이디 암호화 API
사용자 아이디 문자열을 암호화하는 API.

{% include note.html content="<br>2024-10-01 사용자 아이디 암호화 API URL 변경합니다.<br>- 변경 전 : https://eapi.singlex.com/chatbot/encrypt<br>- 변경 후 : https://chatbotapi.ai.lgcns.com/chatbot/encrypt" %}

#### 기본 정보

| Field | Information |
|--------|--------|
| URL | https://chatbotapi.ai.lgcns.com/chatbot/encrypt
| METHOD | GET |

#### Query Parameters 정보

| KEY | TYPE | Required | VALUE |
|--------|--------|--------|--------|
| userId | String | Yes | 사용자 아이디 |

#### RESPONSE 정보

```json
{
  "status": number,
  "message": "string"
}
```

| KEY | TYPE | Required | Description |
|--------|--------|--------|--------|
| status | number | Yes | 응답 상태 정보 |
| message | String | Yes | 암호화된 사용자 아이디 |

##### 사용자 아이디 암호화 API 예시

 * "honggildong" 사용자 아이디 암호화 API 예시 : REQUEST

```
https://chatbotapi.ai.lgcns.com/chatbot/encrypt?userId=honggildong
``` 

 * "honggildong" 사용자 아이디 암호화 API 예시 : RESPONSE

```json
{
  "status": 200,
  "message": "R6XTkqJn9N5p28iyGjRBVw=="
}
``` 
