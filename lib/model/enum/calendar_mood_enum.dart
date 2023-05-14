enum CalendarMood {
  veryGood('very good', '아주 좋음'),
  good('good', '좋음'),
  normal('normal', '보통'),
  bad('bad', '안 좋음'),
  veryBad('very bad', '아주 안 좋음');

  final String enString;
  final String koString;
  const CalendarMood(this.enString, this.koString);
}
