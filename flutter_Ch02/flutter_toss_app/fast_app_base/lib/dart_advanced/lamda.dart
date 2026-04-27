main() {
  /// 람다의 표현 설명
  ///
  /// (int 파라미터1, String 파라미터2) => 반환값
  ///
  int add(int a, int b) => a + b;

  final add2 = (int a, int b) => a + b; // 변수에 선언할 수 있지만 대부분 함수로 선언하는게 직관적임.
  ///
  /// 람다의 특징 설명
  ///
  /// 1. 익명: 이름을 지을 수 없다. (변수에 담을 수 있음)
  /// 2. 함수: Class에 종속되지 않음
  /// 3. 전달: 1급 객체로서 함수 파라미터로 전달, 변수에 저장 가능
  /// 4. 간결성: 익명 클래스처럼 많은 코드를 구현할 필요가 없다.

  /// List Sort 예제
  final list = [5, 2, 4, 1, 3];
  list.sort();
  list.sort((a, b) => a == b ? 0 : a < b ? 1 : -1);
  
  /// 보통 이렇게
  // 오름차순
  list.sort((a, b) => a.compareTo(b));

  // 내림차순
  list.sort((a, b) => b.compareTo(a));
  print(list);
}