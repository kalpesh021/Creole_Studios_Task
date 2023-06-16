import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/constants/text_file.dart';
import 'package:test_app/screens/display_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.homeTitle),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DataDisplayScreen()));
            },
            child: Text(
              AppTexts.homeBtnText,
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            )),
      ),
    ));
  }
}
