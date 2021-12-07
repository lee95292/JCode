# JCode에서 C와 C++ 환경 구축 및 디버그 설정하는 법
vscode의 workspace를 이용하여 초기 디버그 설정 단계를 설명하고 있습니다.

1. JCode 인스턴스에 접속하여 좌측 상단 메뉴 버튼을 클릭합니다.<br/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144953230-30e5e4bf-d9f1-4e25-bf3f-14806e0d7bdb.png width="200" height="200"/><br/><br/>
2. File -> Open Folder 를 클릭 후 /home/~ 를 입력하고 엔터를 눌러줍니다.<br/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144953761-9ace14a1-3cce-4c9c-b270-d644de386aeb.png width="450" height="200"/><br/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144953980-0b779520-85fb-45eb-8eba-41c4843e6514.png width="450" height="100"/><br/><br/>
3. 계정 폴더 안에서 우클릭 후 나오는 new folder를 통해 작업 공간을 생성합니다.<br/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144954163-52d8bdc3-bcf3-4243-9e7d-b1f8ac6eb603.png width="250" height="400"/><br/><br/>
4. 다시 한번 좌측 상단의 메뉴를 눌러서 File -> Add folder to workspace... 를 눌러주고, 작업 공간의 주소를 적습니다.<br/>
   (대체로 /home/~/(작업 공간 이름) 입니다.)<br/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144954507-58245876-a9da-4c70-82ec-b81215786586.png width="467" height="300"/><br/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144954763-64852f3d-3853-4459-a784-75050f1dbfbf.png width="200" height="200"/><br/><br/>
5. 좌측 상단의 메뉴에서 File -> Save Workspace As... 를 눌러주고, workspace.code-workspace 가 작업 공간에 저장될 수 있도록 합니다.<br/>
   (대체로 /home/~/(작업 공간 이름)/workspace.code-workspace 입니다.<br/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144954897-cedbf361-36fd-46bf-83ca-97eac9b0e7cc.png width="467" height="300"/><br/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144955080-f4a42546-048d-4e87-8e1a-213f413dc660.png width="362" height="149"/><br/><br/>
6. 아래 사진으로 이동 후에 "Tasks:run build task" 와 "Tasks:run test task"를 찾습니다.<br/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144982646-fc8f4449-3dd4-4652-b674-359434aba601.png width="600" height="500"/><br/><br/>
7. build task 는 기본적으로 매핑이 되어있습니다. test task 만 따로 매핑을 해주고 기억합니다.<br/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144983130-204d4d56-404d-45a3-ae28-2cae719a2769.png width="400" height="200"/><br/><br/>

8. 작업 공간내에 .vscode폴더를 생성합니다.<br/><br/>
<img src=https://user-images.githubusercontent.com/77586765/144979127-71bfdae8-6725-4cd7-ac32-4c4acfc4e04f.png width="200" height="80"/>

10. .vscode 폴더 내에 tasks.json 파일을 생성하고 해당 내용을 붙여넣습니다.
``` 
{
	"version": "2.0.0",
	"runner": "terminal",
	"type": "shell",
	"echoCommand": true,
	"presentation": { "reveal": "always" },
	"tasks": [
		{
      			"label": "C++: gcc build active file",
      			"command": "g++",
     			"args": [
				    "${file}",
        			"-g",
        			"-o",
      				"${fileDirname}/${fileBasenameNoExtension}"
      			],
			"group": "build",
      			"problemMatcher": {
				"fileLocation": [
			 		"relative",
					"${workspaceRoot}"
				],
			 	"pattern": {
					"regexp": "^(.*):(\\d+):(\\d+):\\s+(warning error):\\s+(.*)$",
				 	"file": 1,
					"line": 2,
					"column": 3,
					"severity" : 4,
					"message" : 5,
				}
    			}
		},
		{
			"label": "C: gcc build active file",
      			"command": "gcc",
     			"args": [
				"${file}",
        			"-g",
        			"-o",
      				"${fileDirname}/${fileBasenameNoExtension}"
      			],
			"group": "build",
      			"problemMatcher": {
				    "fileLocation": [
			 		    "relative",
					    "${workspaceRoot}"
				    ],
			 	    "pattern": {
					    "regexp": "^(.*):(\\d+):(\\d+):\\s+(warning error):\\s+(.*)$",
				 	    "file": 1,
					    "line": 2,
					    "column": 3,
					    "severity" : 4,
					    "message" : 5,
				    }
    			}
		    },
		{
			"label": "execute",
			"command": "cd ${fileDirname} && ./${fileBasenameNoExtension}",
			"group": "test"
		}
	]
}
```
10. .vscode 폴더에 launch.json 파일을 생성하고 해당 내용을 붙여넣습니다.
```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "(gdb) Launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "./${fileBasenameNoExtension}",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${fileDirname}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "miDebuggerPath": "/usr/bin/gdb",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ],
            "preLaunchTask": "C++: gcc build active file"
        }
    ]
}
```
11. 작업 공간내에 테스트로 사용될 c or c++ 파일을 생성하고 간단한 코드를 작성합니다.
12. keybinding.json 에 작성하였던 빌드 커맨드를 입력합니다 (본 문서에선 cmd+shift+b 입니다.)
13. c 파일이라면 C:gcc build active file 을 선택하고 c++ 파일이라면 C++:gcc build active file 을 선택합니다.
14. 무사히 빌드가 완료되면 실행 커맨드를 입력합니다 (본 문서에선 cmd+shift+a 입니다.)
15. execute 를 선택하고 무사히 실행이 완료되면 작업 공간내에 code-workspace 확장자 파일을 열어줍니다.
16. 아래 내용을 "folders": 가 끝나는 대괄호 바로에 넣어줍니다.
```
,
	"settings": {},
	"launch": {
		"version": "0.2.0",
		"configurations": [
			{
				"name": "gcc - Build and debug active file",
				"type": "cppdbg",
				"request": "launch",
				"program": "${fileDirname}/${fileBasenameNoExtension}",
				"args": [],
				"stopAtEntry": false,
				"cwd": "${fileDirname}",
				"environment": [],
				"externalConsole": false,
				"MIMode": "gdb",
				"setupCommands": [
					{
						"description": "Enable pretty-printing for gdb",
						"text": "-enable-pretty-printing",
						"ignoreFailures": true
					}
				],
				//"preLaunchTask": "C: gcc build active file",
				"miDebuggerPath": "/usr/bin/gdb"
			}
		]
	}
```
17. 다시 테스트로 사용할 파일로 돌아가 f5를 입력하고 디버깅을 진행합니다.

