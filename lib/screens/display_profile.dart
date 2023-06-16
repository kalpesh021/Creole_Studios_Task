import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/common_widgets.dart/cached_image.dart';
import 'package:test_app/constants/common_variables.dart';
import 'package:test_app/constants/text_file.dart';
import 'package:test_app/screens/display_data.dart';

class DisplayProfileScreen extends StatelessWidget {
  final dynamic data;
  const DisplayProfileScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("${data['first_name']} ${data['last_name']}"),
            ),
            body: SizedBox(
              width: deviceWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: deviceHeight * 0.1),
                  CachedImage(
                    imgUri: data['avatar'],
                    height: deviceHeight * 0.2,
                    width: deviceWidth * 0.4,
                  ),
                  SizedBox(height: deviceHeight * 0.1),
                  Text(
                    "Email Address",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.01),
                  Text(
                    data['email'],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            )));
  }
}
