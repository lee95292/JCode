# JCode에서 C와 C++ 환경 구축 및 디버그 설정하는 법
vscode의 workspace를 이용하여 초기 디버그 설정 단계를 설명하고 있습니다.

1. JCode 인스턴스에 접속하여 좌측 상단 메뉴 버튼을 클릭합니다.<br/>
<img src=https://user-images.githubusercontent.com/77586765/144953230-30e5e4bf-d9f1-4e25-bf3f-14806e0d7bdb.png width="200" height="200"/><br/>
2. File -> Open Folder 를 클릭 후 /home/~ 를 입력하고 엔터를 눌러줍니다.<br/>
<img src=https://user-images.githubusercontent.com/77586765/144953761-9ace14a1-3cce-4c9c-b270-d644de386aeb.png width="450" height="200"/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144953980-0b779520-85fb-45eb-8eba-41c4843e6514.png width="450" height="100"/><br/>
3. 계정 폴더 안에서 우클릭 후 나오는 new folder를 통해 작업 공간을 생성합니다.<br/>
<img src=https://user-images.githubusercontent.com/77586765/144954163-52d8bdc3-bcf3-4243-9e7d-b1f8ac6eb603.png width="250" height="400"/><br/>
4. 다시 한번 좌측 상단의 메뉴를 눌러서 File -> Add folder to workspace... 를 눌러주고, 작업 공간의 주소를 적습니다.
   (대체로 /home/~/(작업 공간 이름) 입니다.)<br/>
<img src=https://user-images.githubusercontent.com/77586765/144954507-58245876-a9da-4c70-82ec-b81215786586.png width="467" height="300"/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144954763-64852f3d-3853-4459-a784-75050f1dbfbf.png width="200" height="200"/><br/>
5. 좌측 상단의 메뉴에서 File -> Save Workspace As... 를 눌러주고, workspace.code-workspace 가 작업 공간에 저장될 수 있도록 합니다.
   (대체로 /home/~/(작업 공간 이름)/workspace.code-workspace 입니다.<br/>
<img src=https://user-images.githubusercontent.com/77586765/144954897-cedbf361-36fd-46bf-83ca-97eac9b0e7cc.png width="467" height="300"/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144955080-f4a42546-048d-4e87-8e1a-213f413dc660.png width="362" height="149"/><br/>
6. CTRL + P 단축키를 이용하여 keybindings.json 을 열어줍니다.<br/>
<img src=https://user-images.githubusercontent.com/77586765/144955206-5b97b784-f3da-4b6f-8cef-3f47880d4d49.png width="400" height="80"/><br/>
7. 하단의 내용을 입력해줍니다. 해당 내용은 shift+cmd+a 커맨드를 통해 c 파일을 빌드, shift+cmd+b 커맨드를 통해 c 파일을 실행한다는 의미입니다. 해당 커맨드가 아닌 다른 커맨드로 바꾸셔도 가능하지만, 반드시 기억하고 있어야 합니다.<br/>
``` // 키 바인딩을 이 파일에 넣어서 기본값 재정의auto[]
[
    {
        "key": "shift+cmd+b",
        "command": "workbench.action.tasks.build"
    },
    {
        "key": "shift+cmd+a",
        "command": "workbench.action.tasks.test"
    }
] 
```
8. 작업 공간내에 .vscode폴더를 생성합니다.
9. launch.json 파일을 생성하고 해당 내용을 붙여넣습니다.
10. tasks.json 파일을 생성하고 해당 내용을 붙여넣습니다.
11. 작업 공간내의 w
12. 작업 공간내에 테스트로 사용될 c 파일을 생성하고 간단한 코드를 작성합니다.
13. 사전에 설정한 커맨드로 빌드해줍니다. (본 문서에서는 shift+cmd+b 입니다.)
14. 
