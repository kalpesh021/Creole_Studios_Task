
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key, required this.flag}) : super(key: key);

  final bool flag;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return flag
        ? Container(
            width: width,
            height: height,
            color: Colors.black.withOpacity(0.5),
            child: const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            )),
          )
        : const SizedBox();
  }
}
