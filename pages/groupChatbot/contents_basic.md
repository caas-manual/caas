---
title: Contents
tags: [contents, basic]
keywords: Basic Conversation
summary: Chatflow 답변에 사용할 이미지를 관리하는 페이지입니다.
sidebar: chatbot_doc_sidebar
permalink: contents_basic.html
folder: groupChatbot
previous: {
    title: APIs, 
    url: api_basic.html
}
next: {
    title: General,
    url: chatbot_setting.html
}
---

## Contents 이해하기
 {% include callout.html content="화면 위치 : [Answer Management] > [Contents]" type="default" %}
 Chatflow의 Speak Node 답변에 사용할 이미지를 관리하는 메뉴입니다. 

해당 메뉴에서는 다음과 같은 내용을 이용할 수 있습니다.<br/>
 - [폴더 만들기](contents_basic.html#폴더-만들기)
 - [이미지 파일 업로드](contents_basic.html#이미지-파일-업로드)
 - [폴더/파일 삭제](contents_basic.html#폴더파일-삭제)
 - [Chatflow 사용 예시](contents_basic.html#chatflow-사용-예시)

### 폴더 만들기
폴더를 만들면 사용 목적에 따라 이미지 파일을 더 쉽고 편하게 관리할 수 있습니다. 폴더를 만들지 않으면 가장 상위 root 경로에 이미지가 업로드 됩니다. <br/><br/>
폴더 생성을 위해 하단 우측 **폴더 만들기** 버튼을 클릭합니다. 
{% include image.html file="contents\01_create_folder_button.PNG" max-width="900" caption="폴더 만들기 버튼 클릭" %}

팝업 창에서 폴더 이름을 입력하고 **저장** 버튼을 클릭합니다. 
{% include image.html file="contents\02_create_folder_save.PNG" max-width="900" caption="폴더 만들기 저장" %}

폴더가 성공적으로 생성되면 Contents 목록에서 생성된 폴더를 확인할 수 있습니다. 폴더명을 클릭하면 해당 경로로 이동합니다.
{% include image.html file="contents\03_created_folder_in_list.PNG" max-width="900" caption="생성된 폴더 확인" %}

### 이미지 파일 업로드
원하는 폴더 경로에서 이미지 파일을 업로드 할 수 있습니다. 

**업로드** 버튼을 클릭하면 Contents 업로드 화면으로 이동합니다.
{% include image.html file="contents\04_contents_upload.PNG" max-width="900" caption="Contents Upload" %}

파일 선택 버튼을 클릭하여 업로드할 이미지 파일을 선택합니다.
{% include image.html file="contents\05_contents_upload_file_choose.PNG" max-width="900" caption="Contents Upload Image 파일 선택" %}

정상적인 이미지 파일을 선택했다면 화면에 파일 정보가 나타나고 저장 버튼을 클릭하여 업로드를 마칩니다.
{% include image.html file="contents\06_contents_upload_display_files.PNG" max-width="900" caption="Contents Upload 파일별 화면 display" %}

### 폴더/파일 삭제
삭제하고 싶은 폴더나 파일을 선택하여 삭제할 수 있습니다.
{% include note.html content="단, 하위에 폴더나 파일을 포함하고 있는 폴더는 삭제가 불가능합니다." %}
{% include image.html file="contents\07_contents_delete.PNG" max-width="900" caption="폴더/파일 삭제" %}

***"파일을 삭제"***할 경우 Chatflow의 Speak Node 답변에 사용되고 있는 이미지인지 확인 후 삭제하셔야 합니다. 사용중인 이미지가 삭제되면 답변에서 정상적인 이미지 url을 불러올 수 없게됩니다. 

### Chatflow 사용 예시
Chatflow의 Speak Node 답변 설정 화면에서 Image URL을 직접 입력하는 대신 **돋보기 아이콘**을 클릭하면 Contents에 업로드 된 파일을 선택하여 URL을 불러올 수 있습니다.
{% include image.html file="contents\08_speak_node_response_basic.PNG" max-width="900" caption="Response Type Basic" %}
{% include image.html file="contents\08_speak_node_response_crs.PNG" max-width="900" caption="Response Type Carousel" %}

이미지 선택 팝업 화면에서 파일명을 클릭하면 새 탭에서 이미지를 볼 수 있습니다. 불러오고자 하는 이미지 파일을 선택 후 **선택** 버튼을 클릭하여 URL을 불러옵니다.
{% include image.html file="contents\09_speak_node_select_image.PNG" max-width="900" caption="Select Image 팝업" %}