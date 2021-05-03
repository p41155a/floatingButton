# floatingButton

저는 스크롤을 아래로 내리면 floating이 닫히고 올리면 floating이 열리는

아래와 같은 모양의 floating Button을 만들어야 했습니다. 



floatingButton을 만드는 방법은 stackView를 사용하는 것입니다.



#### 💡 stackView란?

**UIStackView** 는 iOS 9에서 나온 개념으로 여러 개의 View를 한 셋트로 만들어주는 역할을 하는 View입니다. 그래서 항상 StackView 안에는 몇 개의 View 들이 있는데, 이를 **arrangedSubViews** 라고 합니다. 이 subView들은 일정한 규칙에 따라 StackView 안에서 배치됩니다

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Data_stack.svg/1200px-Data_stack.svg.png" width=230>



일반적으로 stack을 생각할 때 위와 같은 그림을 떠올리게 된다

이것처럼 stack 안에 뷰를 **hidden 하면** 단순히 보이지 않는 것이 아니라

그 뷰가 pop된 것 처럼

그 상위 view 또한 **넓이가 줄어들게 됨**

따라서 custom 버튼의 넓이가 < 이미지 넓이 + text넓이 + sideview 넓이>였다가

text, sideview를 hidden 해줌에 따라 **이미지 넓이만 남게 되는 것**이지요



<img src="https://user-images.githubusercontent.com/50395024/116845382-a5787d00-ac20-11eb-8039-323d0b660802.png">

일반적으로 **addSubview** 로 뷰에 추가 시키지만 

stackView는 **addArrangedSubview** 를 통하여 화면에 추가 시키면 됩니다.



#### **⚠️ 일반적인 floatingButton과 차이점**

1. 동그라미와 아래 배경이 붙어있는 형태
2. floating버튼이 하나의 버튼으로 작동해야함

<img src="https://user-images.githubusercontent.com/50395024/116844130-2cc3f180-ac1d-11eb-89e5-bcf40f1c7811.png" width="150">



#### 💄레이아웃

위와 같은 형태의 floating Button을 만들기 위해 제가 만든 레이아웃입니다.

<img src="https://user-images.githubusercontent.com/50395024/116845276-5df1f100-ac20-11eb-947d-c428935afcfd.png" width="300">

 

하나의 버튼을 스토리보드에 두고

위와 같은 레이아웃을 가진 custom 버튼을 두었습니다.(빈 View는 단순히 여백을 위함)



<img src="https://user-images.githubusercontent.com/50395024/83377985-460f5d00-a412-11ea-8dca-7068a3ad20e8.gif" width="200">



[블로그 포스팅](https://blog.naver.com/p41155a/221986204281)