---
title: General
tags: [settings, basic]
keywords: General Setting
summary: Chatbot의 General 정보 설정 방법을 알아봅니다.
sidebar: chatbot_doc_sidebar
permalink: chatbot_setting.html
folder: groupChatbot
previous: {
    title: APIs, 
    url: api_basic.html
}
next: {
    title: Language,
    url: chatbot_setting_language.html
}
---

## General 정보 변경
 {% include callout.html content="화면 위치 : [Settings] > [Chatbot Info.] > General 탭 선택" type="default" %}

Chatbot Info. 화면 접근은 **Admin** 권한을 가진 Chatbot 개발자만 가능합니다.<br/>
General 탭에서는 Chatbot의 기본 정보를 변경하거나 Chatbot을 다운로드 또는 업로드할 수 있습니다.<br/> 

### General 정보 저장
Chatbot명이나 Description을 수정한 후 **저장** 버튼을 클릭하여 General 정보를 저장합니다.

{% include image.html file="chatbot_info\01_chatbot_info_general_save.png" max-width="900" caption="Chatbot Info General 저장" %}

### Chatbot 다운로드
Chatbot의 Intents, Entities, APIs를 한 번에 zip 파일로 다운받을 수 있는 기능입니다. 
현재 Chatbot의 Intents, Entities, APIs를 그대로 보관해두고 싶거나 똑같은 Chatbot을 하나 더 만들고 싶을 때 업로드 기능과 함께 사용할 수 있습니다. 

{% include image.html file="chatbot_info\02_chatbot_download.png" max-width="900" caption="Chatbot Download" %}

**다운로드** 버튼을 누르면 zip 파일이 PC의 기본 다운로드 경로에 저장됩니다. 
zip 파일 명칭은 Chatbot명과 동일하고, 파일을 열어보면 각각에 해당하는 json 파일들이 Intents/Entities/APIs 카테고리별로 구성되어 있습니다.
{% include image.html file="chatbot_info\03_chatbot_download_zip.png" max-width="900" caption="Chatbot Download Zip 파일 확인" %}
{% include image.html file="chatbot_info\04_chatbot_download_zip_inner.png" max-width="900" caption="Chatbot Download Zip 내 카테고리별 파일 구성" %}

### Chatbot 업로드
Chatbot 다운로드에서 다운받은 zip 파일을 업로드하면 파일 내 내용으로 Chatbot을 업데이트 할 수 있습니다. 
{% include warning.html content="이미 등록된 항목에 대해서는 업로드한 내용으로 수정됩니다." %}

**업로드** 버튼을 클릭하면 Chatbot 업로드 화면으로 이동합니다.
{% include image.html file="chatbot_info\05_chatbot_upload.png" max-width="900" caption="Chatbot Upload" %}

파일 선택 버튼을 클릭하여 업로드할 zip 파일을 선택합니다.
{% include image.html file="chatbot_info\06_chatbot_upload_file_choose.png" max-width="900" caption="Chatbot Upload Zip 파일 선택" %}

정상적인 zip 파일을 선택했다면 화면에 카테고리별 파일 정보가 나타나고 저장 버튼을 클릭하여 업로드를 마칠 수 있습니다.
{% include image.html file="chatbot_info\07_chatbot_upload_display_files.png" max-width="900" caption="Chatbot Upload 카테고리별 화면 display" %}

### Chatbot 삭제
{% include image.html file="create_chatbot\06_chatbot_info_delete.png" max-width="900" caption="Chatbot 삭제" %}

***"Chatbot 삭제"***기능은 매우 조심해야 하는 기능입니다. 등록되어 있는 모든 학습데이터와 대응되는 답변 시나리오가 삭제됩니다. ***매우 매우 조심하셔야 합니다!***
