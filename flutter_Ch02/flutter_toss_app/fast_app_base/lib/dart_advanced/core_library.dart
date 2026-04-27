main() {
  String content = '과일들: ';

  StringBuffer stringBuffer = StringBuffer(content);
  stringBuffer.writeAll(['사과', '오렌지', '수박', '체리'], ', ');
  // stringBuffer.write('사과');
  // stringBuffer.writeln('사과');
  print(stringBuffer.toString());
  // print(s);

  /// 정규식
  final findHashTagRegExp = RegExp(r'(#[\dA-Za-z가-힣ㄱ-ㅎㅏ-ㅣ]*)');
  const hashContent = '문장에 #해시태그를 찾아주세요. #플러터 #좋아요';

  final hashMatches = findHashTagRegExp.allMatches(hashContent);
  for (final match in hashMatches) {
    final matchedString = hashContent.substring(match.start, match.end);
    print(matchedString);
  }

  /// Uri
  const example = 'https://www.example.com/path/to/resource?query=123&page=1';

  final uri = Uri.parse(example);

  print(uri.scheme);
  print(uri.host);
  print(uri.path);

  for (final pathSegment in uri.pathSegments) {
    print(pathSegment);
  }

  final params = uri.queryParametersAll;
  print(params);
}