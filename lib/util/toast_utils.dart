import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showToast(String msg) {
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT);
  }

  /// 캘린더 타이틀 2자 미만 입력시
  static const String titleValid = '제목은 최소 2자 이상 입력하세요.';

  /// 캘린더 저장 성공시
  static const String successSave = '캘린더를 저장했습니다.';

  /// 캘린더 저장 실패시
  static const String failSave = '저장에 실패했습니다.';

  /// 캘린더 삭제 성공시
  static const String successDelete = '캘린더를 삭제했습니다.';

  /// 캘린더 삭제 실패시
  static const String failDelete = '삭제에 실패했습니다.';
}
