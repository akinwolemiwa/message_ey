import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:message_app/customs/colors.dart';
import 'package:message_app/services/chat_services.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // startTimer();
    _getData();
  }

  Future<void> _getData() async {
    await ref.read(chatsApiProvider).getAllChats(
          ref: ref,
          onError: (message) {},
        );

    route();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/homePage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainTheme,
      body: Center(
        child: Image.asset(
          'assets/png/m_app.png',
          height: 100.h,
        ),
      ),
    );
  }
}
