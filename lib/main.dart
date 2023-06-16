import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/constants/common_variables.dart';
import 'package:test_app/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Size size = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  deviceHeight = size.height;
  deviceWidth = size.width;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(deviceWidth, deviceHeight),
        builder: (context, child) {
          return   const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        });
  }
}
