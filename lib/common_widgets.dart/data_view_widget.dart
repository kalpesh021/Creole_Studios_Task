import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/common_widgets.dart/cached_image.dart';
import 'package:test_app/constants/common_variables.dart';
import 'package:test_app/screens/display_profile.dart';

class DataViewWidget extends StatelessWidget {
  final dynamic displayData;
  const DataViewWidget({super.key, required this.displayData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DisplayProfileScreen(
                  data: displayData,
                )));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.05, vertical: deviceHeight * 0.01),
        child: Row(
          children: [
            CachedImage(
              imgUri: displayData['avatar'],
            ),
            SizedBox(width: deviceWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${displayData['first_name']} ${displayData['last_name']}",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: deviceHeight * 0.01),
                  Text(
                    displayData['email'],
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
