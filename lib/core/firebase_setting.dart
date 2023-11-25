import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_todaily/firebase_options.dart';

/// 파이어베이스 옵션 초기화
Future<void> initFirebaes() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
