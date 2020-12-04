---
title: 사용자 권한 관리
tags: [manage, basic]
keywords: User Roles
summary: Chatbot별 사용자 권한을 관리합니다.
sidebar: chatbot_doc_sidebar
permalink: manage_user_roles.html
folder: groupChatbot
previous: {
    title: Alarm, 
    url: manage_alarm.html
}
---

## 권한 종류
Chatbot 개발자가 가질 수 있는 권한은 **Admin** 또는 **Developer**입니다. <br/>
권한은 Chatbot별로 설정되며, 어떤 권한을 가지고 있느냐에 따라 Chatbot에서 사용할 수 있는 메뉴가 달라집니다. <br/>
권한별 메뉴 접근 가능 여부는 아래 표와 같습니다. 

| 메뉴명 | Admin 권한 | Developer 권한 |
|-------------|-------------|-------------|
| Create New Chatbot | 가능 | **불가능** |
| My Chatbots | 가능 | 가능 |
| Intents | 가능 | 가능 |
| Entities | 가능 | 가능 |
| APIs | 가능 | 가능 |
| History | 가능 | 가능 |
| Training | 가능 | 가능 |
| Bulk Test | 가능 | 가능 |
| Dashboard | 가능 | 가능 |
| Chatbot Info. | 가능 | **불가능** |
| User Roles | 가능 | **불가능** |


## 사용자 권한 관리하기
{% include callout.html content="화면 위치 : [Settings] > [User Roles]" type="default" %}

상단 표에서 확인했듯이 User Roles 화면 접근은 **Admin** 권한을 가진 Chatbot 개발자만 가능합니다. <br/> 
해당 화면에서는 선택된 Chatbot에 권한이 있는 사용자들을 조회하거나 Developer 권한을 가진 사용자에게 Chatbot 사용 권한을 부여 혹은 회수할 수 있습니다.

### 권한 조회
원하는 조회 조건을 입력한 후 검색 버튼을 클릭하여 현재 Chatbot의 사용자 권한을 조회합니다.

{% include image.html file="user_roles\01_user_roles.png" max-width="900" caption="User Roles 조회" %}

### 권한 추가
User 추가 버튼을 클릭하면 관리 계정 추가 팝업이 오픈되며, 해당 화면에서 원하는 사용자에게 권한을 부여할 수 있습니다. 

{% include note.html content="단, 권한 추가는 Developer 권한을 가진 사용자에 대해서만 가능합니다." %}

{% include image.html file="user_roles\02_user_roles_add_popup.png" max-width="900" caption="Chatbot 사용자 권한 추가 팝업" %}
{% include image.html file="user_roles\03_user_roles_add_popup_check.png" max-width="900" caption="Chatbot 사용자 권한 추가 저장" %}

### 권한 삭제
권한을 회수하고 싶은 사용자를 선택하여 권한을 삭제할 수 있습니다.

{% include note.html content="단, 권한 삭제는 Developer 권한을 가진 사용자에 대해서만 가능합니다." %}

{% include image.html file="user_roles\04_user_roles_delete.png" max-width="900" caption="Chatbot 사용자 권한 삭제" %}
