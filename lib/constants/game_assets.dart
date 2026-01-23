// assets/images 경로를 한 곳에서 관리
// flutter dart 의 경우
// 파일명칭 _ 로 단어 구분
// 파일 내 코드 안에서는 카멜 케이스 형태로 작성
class GameAssets {
  // 생성자를 private으로 만들어서 인스턴스 생성방지

  // 기본 생성자 / 공개된 생성자 외부에서 접근 가능
  //const GameAssets({});
  // 비공개 생성자 / 외부에서 인스턴스 생성은 못하고, 내부 static 데이터를 사용만 가능하게 하는 생성자
  // 클래스이름._() = 비공개 생성자
  GameAssets._();

  /*
  GameAssets._(); 비공개 생성자로 작성될 경우
  const 게임1번 = GameAssets(); // 인스턴스 생성 불가한 상태

  아래와 같이 static으로 되어 있는 상수/변수 에만 접근 가능
  image: AssetImage(GameAssets.birdFluffyGround),
  static const String birdFluffyBackground 접근 가능
  const String abcdefg = "image.png" 비공개 생성자 상태에서 클래스 내부에서만 사용하는 상수이름이고,
  외부에서 abcdefg 라는 데이터 공간 내부에 존재하는 데이터에 접근 불가

  비공개 클래스인데 static 으로 되어 있는 상수나 변수 데이터는 사용 ok

   */

/* ****** 새 충돌 *********/
// 배경이미지상 하
  static const String birdFluffyBackground =
      "assets/images/bird_fluffy/background1.png";
  static const String birdFluffyGround = "assets/images/bird_fluffy/ground.png";

// 새 이미지
  static const String birdFluffyFlyBird =
      "assets/images/bird_fluffy/bird_fly.png";
  static const String birdFluffyFallBird =
      "assets/images/bird_fluffy/bird_fall.png";
  static const String birdFluffyLoading =
      "assets/images/bird_fluffy/bird_start.gif";

//장애물 이미지
  static const String birdFluffyBarrier =
      "assets/images/bird_fluffy/barrier.png";

/* ****** 캐릭터 꾸미기 게임 에셋 *********/
  // 꾸미기 로고
  static const String dressUpLogo = "assets/images/dress_up/logo.png";

  // 꾸미기 바디
  static const String dressUpBody = "assets/images/dress_up/body.png";

  // 꾸미기 모자
  static const String dressUpHat1 = "assets/images/dress_up/hat1.png";

  // 꾸미기 옷
  static const String dressUpClothes1 = "assets/images/dress_up/clothes1.png";

  // 꾸미기 무기
  static const String dressUpWep1 = "assets/images/dress_up/acc1.png";

  // 꾸미기 신발
  static const String dressUpShoes1 = "assets/images/dress_up/shoes1.png";

  // 꾸미기 악세
  static const String dressUpAcc1 = "assets/images/dress_up/bag1.png";

  // 꾸미기 배경
  static const String dressUpBack1 = "assets/images/dress_up/background1.png";
}
