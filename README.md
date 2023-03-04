# memmo_iOS
[사람기억 앱] swiftUI + MVVM + Realm<br/><br/>
멤버 별로 메모를 보기좋게 관리하면 어떨까? 싶어 만들게 되었습니다. <br/>
먼저 그룹을 생성하고 각 그룹에 멤버를 추가합니다. 멤버에게는 메모를 달 수 있는데 이모지와 타이틀로 어떤 질문에 대한 답변을 달 건지 지정하고 메모합니다.<br/>
예를들어, 가족의 옷 사이즈를 기록해놓는다고 하면 “가족들” 그룹에 가족들을 멤버로 추가하고 “👕 옷사이즈” 이모지에 각각 사이즈를 추가합니다. <br/>
이렇게 추가하면 메모보기 타입에서 옷사이즈를 클릭하면 전체를 모아볼 수도 있습니다.<br/>

<img src="https://raw.githubusercontent.com/nasneyland/nasneyland/main/memmo/memmo_01.jpeg"  width="120"> <img src="https://raw.githubusercontent.com/nasneyland/nasneyland/main/memmo/memmo_02.jpeg"  width="120">
<img src="https://raw.githubusercontent.com/nasneyland/nasneyland/main/memmo/memmo_03.jpeg"  width="120">
<img src="https://raw.githubusercontent.com/nasneyland/nasneyland/main/memmo/memmo_04.jpeg"  width="120">

<img src="https://raw.githubusercontent.com/nasneyland/nasneyland/main/memmo/memmo_05.jpeg"  width="120"> <img src="https://raw.githubusercontent.com/nasneyland/nasneyland/main/memmo/memmo_06.jpeg"  width="120">
<img src="https://raw.githubusercontent.com/nasneyland/nasneyland/main/memmo/memmo_07.jpeg"  width="120">
<img src="https://raw.githubusercontent.com/nasneyland/nasneyland/main/memmo/memmo_08.jpeg"  width="120">
<img src="https://raw.githubusercontent.com/nasneyland/nasneyland/main/memmo/memmo_09.jpeg"  width="120">

### 디자인 패턴
- MVVM 패턴 사용
- View 기능만 하는 뷰 파일을 따로 선언
- 셀이나 팝업뷰 전부 따로 구현하여 뷰를 최대한 짧은 코드로 구현
- 자주 쓰는 컴포넌트(프로필뷰, 색상버튼 등)도 따로 선언하여 재사용성 고려
- ViewModel 에서 데이터 CRUD 함수 구현 후 각 View에서 불러오기

### 레이아웃 구성
- Storyboard에서 Auto Layout을 구현하는 방법 사용
- 장점 : 직관적인 레이아웃 구현 가능, 빌드 없이 레이아웃 수정을 바로 확인 가능
- 단점 : 빌드 시간이 길어짐, 스토리보드에서 지원하지 않는 옵션은 부분적으로 코드로 구현 -> 통일성이 떨어짐
- 결론 : 애플에서도 코들 구현하는 것을 권장하고 있고, 장점보다는 단점이 훨씬 많기 때문에 이후 다음 프로젝트 부터는 **SnapKit**을 이용해 구현

### 데이터 통신
- Realm을 이용하여 기기내부에 데이터 저장 (get, post, put, delete)
- ViewModel에서 일괄적으로 데이터 관리
- Model 선언 (Category/Person/Memotype/Memo) 
- 모델 간 일대다, 일대일 관계성 관리

### 주요 기능
- 그룹 생성 : 그룹 이름과 색상을 선택하여 생성
- 그룹 관리 : 멤버 데이터를 담을 그룹 테이블 생성, 그룹 셀을 클릭하면 그룹에 속한 멤버들 리스트가 보임
- 멤버 생성 : 멤버 이름과, 프로필사진, 속할 그룹을 선택하여 생성
- 멤버 관리 : 멤버 데이터에는 멤버 정보와 속한 메모 리스트가 존재
- 메모 관리 : 메모 보기를 클릭하여 타입 별 메모 모아보기 또는 멤버를 클릭하여 해당 멤버에 대한 메모만 모아보기
- 메모 생성 : 멤버 상세보기 화면에서 이모지와 메모 제목, 내용을 입력 (이모지 피커 구현)
