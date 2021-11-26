<img width=200px src=https://user-images.githubusercontent.com/63224278/143586538-5155519b-7d73-422e-97bf-806874df93ec.jpg> <img width=200px src=https://user-images.githubusercontent.com/63224278/143587668-b51e84b2-49d3-4d34-ba11-aff401f7733c.png>

## 🌊 Project
**🎧 음악 서비스, Genie 💙**!
> **SOPT 29th JointSeminar**  
> **프로젝트 기간: 2021.11.13 ~ 2021.12.03**  

**📱구현 영상**

![Simulator Screen Recording - iPhone 13 - 2021-11-26 at 21 39 07](https://user-images.githubusercontent.com/63224278/143592088-644b98e8-a26d-47e1-80ba-0e8fbefeb3e2.gif)



<br>

## 🍎 iOS Developers

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<table>
  <tr>
    <td align="center"><a href="https://github.com/hwangji-dev"><img src="https://user-images.githubusercontent.com/63224278/103209152-b436e680-4945-11eb-91e4-bd8622e442e2.png" width="100px;" alt=""/><br /><sub><b>hwangji-dev</b></sub></a><br /><a href="https://github.com/SOPT-29th-JointSeminar-9/Client-iOS/commits?author=hwangJi-dev" title="Code">📱</a></td>
    <td align="center"><a href="https://github.com/jumining"><img src="https://user-images.githubusercontent.com/63224278/143587600-9a6c8d10-a59e-4b7c-8fdc-02ba306dfdfb.png" width="100px;" alt=""/><br /><sub><b>jumining</b></sub></a><br /><a href="https://github.com/SOPT-29th-JointSeminar-9/Client-iOS/commits?author=jumining" title="Code">📱</a></td>
  </tr>
</table>

<br>

## ⚙️ Development Environment and Using Library

* Development Environment  
![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg) ![iOS](https://img.shields.io/badge/Platform-iOS-black.svg)


* Using Library  

  ```ruby
  # Pods for Client-iOS
  pod 'Alamofire'       # 서버 통신
  pod 'SnapKit'         # UI Layout	
  pod 'Then'            # UI Layout	
  ```

<br>

## 🌈 View Hierachy
### 🎧 뮤직허그 MainView

<img width=300px src=https://user-images.githubusercontent.com/76610340/143442389-743f5e5e-022c-43f4-880f-24ddb75dd056.png> 

<br>

### 🎧 바텀 MusicBar (Normal)
<img width=600px src=https://user-images.githubusercontent.com/63224278/143588102-177b18bd-4c43-484a-a1a7-683a09651c57.png> 

<br>

### 🎧 바텀 MusicBar (Chat)
<img width=600px src=https://user-images.githubusercontent.com/63224278/143588109-e75dfddc-accf-492a-ae3a-df94a5c0a773.png> 

<br>

### 🎧 네비게이션 탭바(뷰페이저)
<img width=600px src=https://user-images.githubusercontent.com/76610340/142490460-077ce316-b39b-4868-8983-41d33fb0a57f.jpeg> 
<img width=600px src=https://user-images.githubusercontent.com/76610340/142490467-cfa4e8d5-d8c8-42e6-a7b2-37ac14777e07.jpeg> 
<img width=600px src=https://user-images.githubusercontent.com/76610340/142490476-a50a2b46-91fb-48c4-a2ad-fe249207b5e0.jpeg> 


<br>

## 💻 Coding Convention   
<details>
 <summary> 🗂 폴더구조 </summary>
 <div markdown="1">  
   <br>
   
   <img width=500px src=https://user-images.githubusercontent.com/63224278/143589904-762a699a-743a-4c31-95c7-32980710631e.png> 

---
```markdown
🗂 Global
    - Class 🗂
    - Struct 🗂
    - View 🗂
    - Extension 🗂
    - Font 🗂
    - LaunchScreen

🗂 Network
    - APIModels 🗂
    - APIServices 🗂

🗂 Screen
    - Chat 🗂
        - Controller 🗂
        - Storyboard 🗂
        - Controller 🗂
        - Cell 🗂
    - ...

🗂 Support
    - info.plist
    - AppDelegate.swift
    - SceneDelegate.swift
    - Assets.xcassets
```
<br>
 </div>
 </details>
 

<details>
<summary> 🖋 네이밍 </summary>
<div markdown="1">       


---

**Class & Struct**

- 클래스/구조체 이름은 **UpperCamelCase**를 사용합니다.

- 클래스 이름에는 접두사를 붙이지 않습니다.

  <kbd>좋은 예</kbd>

    ```swift
    class MyChatCVC: UICollectionViewCell
    ```

  <kbd>나쁜 예</kbd>

    ```swift
    struct menuContentData { }
    ```

**함수 & 변수 & 상수**

- 함수와 변수에는 **lowerCamelCase**를 사용합니다.

- 버튼명에는 **Btn 약자**를 사용합니다.

- 모든 IBOutlet에는 해당 클래스명을 뒤에 붙입니다. 
    - ~~ImageView, ~~Label, ~~TextField와 같이 속성값을 붙여줍니다.
    
- 테이블 뷰는 **TV**, 컬렉션뷰는 **CV**로 줄여서 네이밍합니다.

- 테이블 뷰 셀은 **TVC**, 컬렉션뷰 셀은 **CVC**로 줄여서 네이밍합니다.

  <kbd>좋은 예</kbd>

    ```swift
    @IBOutlet weak var chatDownBtn: UIButton!
    @IBOutlet weak var genieMainView: UIView!
    @IBOutlet weak var chatCV: UICollectionView!
    ```

  <kbd>나쁜 예</kbd>

    ```swift
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var geniecollectionview: UICollectionView!
    @IBOutlet weak var tagcollectionview: UICollectionView!
    @IBOutlet weak var tableview: UITableView!
    ```
<br>

</div>
</details>

 

 <details>
 <summary> 🏷 주석 </summary>
 <div markdown="1">       
 

---

 - `// MARK:` 를 사용해서 연관된 코드를 구분짓습니다.
 - `///` 를 사용해서 문서화에 사용되는 주석을 남깁니다. (ex. /// 사용자 프로필을 그려주는 뷰)
 <br>

 </div>
 </details>


<details>
<summary> 📎 기타 </summary>
<div markdown="1">       


---

- viewDidLoad() 내에는 **Function만 위치**시킵니다.
- 중복되는 부분들은 +Extension.swift로 만들어 활용합니다.
- 메인컬러와 같이 자주 쓰이는 컬러들은 Asset에 Color Set을 만들어서 사용합니다.
- , 뒤에 반드시 띄어쓰기를 합니다.
- 함수끼리 1줄 개행합니다.
- 중괄호는 아래와 같은 형식으로 사용합니다.
  ```swift
  if (condition){
  
    Statements
    /*
    ...
    */
    
  }
  ```
  </div>
  </details>

👉🏻 다음 [Style Guide](https://github.com/StyleShare/swift-style-guide)를 참고헀습니다.

<br>


## ⚡️ Commit Messge Rules
<details>
<summary> 💡 Git Commit Message Rules </summary>
<div markdown="1">       


---

> 반영사항을 바로 확인할 수 있도록 작은 기능 하나라도 구현되면 커밋을 권장합니다.  
> 커밋할 땐 **iOS 슬랙에 노티**합니다.  
> 기능 구현이 완벽하지 않을 땐, 각자 브랜치에 커밋을 해주세요.  
<br>


**커밋 메시지 명령어 모음**
* ```
  * 🚑️[HOTFIX] : issue나, QA에서 급한 버그 수정에 사용
  * 🔨[FIX] : 버그, 오류 해결
  * ➕[ADD] : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 파일 생성 시
  * ✨[FEAT] : 새로운 기능 구현
  * ⚰️[DEL] : 쓸모없는 코드 삭제
  * 📝[DOCS] : README나 WIKI 등의 문서 개정
  * 💄[MOD] : storyboard 파일,UI 수정한 경우
  * ✅[CHORE] : 코드 수정, 내부 파일 수정
  * ✏️[CORRECT] : 주로 문법의 오류나 타입의 변경, 이름 변경 등에 사용합니다.
  * 🚚[MOVE] : 프로젝트 내 파일이나 코드의 이동
  * ⏪️[RENAME] : 파일 이름 변경이 있을 때 사용합니다.
  * ⚡️[IMPROVE] : 향상이 있을 때 사용합니다.
  * ♻️[REFACTOR] : 전면 수정이 있을 때 사용합니다
  * 🔀[MERGE]: 다른브렌치를 merge 할 때 사용합니다.
  ```
  <br>

**커밋 메세지 형식**
- `[커밋메세지] 설명` 형식으로 커밋 메시지를 작성합니다.
- 커밋 메시지는 영어 사용을 권장합니다.  
  <kbd>좋은 예</kbd>

    ```
    ✅[CHORE] : 여분공간과 맨위로 버튼 눌렀을 때 화면 맨위로 이동하기 구현 완료
    ```
  <kbd>나쁜 예</kbd>

    ```
    메인 화면 구현 완료
    ```
  </div>
  </details>

<br>

## ⚡️ Github mangement

<details>
<summary> 💡 Gitflow Workflow </summary>
<div markdown="1">       


---

```
1. Issue를 생성한다.
2. feature Branch를 생성한다.
3. Add - Commit - Push - Pull Request 의 과정을 거친다.
4. Pull Request가 작성되면 작성자 이외의 다른 팀원이 Code Review를 한다.
5. Code Review가 완료되면 Pull Request 작성자가 main Branch로 merge 한다.
6. 종료된 Issue와 Pull Request의 Label과 Project를 관리한다.
```

- 커밋 메세지는 다른 사람들이 봐도 이해할 수 있게 써주세요.

- 풀리퀘스트를 통해 코드 리뷰를 해보아요.

</div>
</details>

<br>
