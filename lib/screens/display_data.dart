import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:test_app/common_widgets.dart/data_view_widget.dart';
import 'package:test_app/common_widgets.dart/loader.dart';
import 'package:test_app/constants/common_variables.dart';
import 'package:test_app/constants/text_file.dart';
import 'package:test_app/services/api_services.dart';

class DataDisplayScreen extends StatefulWidget {
  const DataDisplayScreen({super.key});

  @override
  State<DataDisplayScreen> createState() => _DataDisplayScreenState();
}

class _DataDisplayScreenState extends State<DataDisplayScreen> {
  @override
  void initState() {
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppTexts.homeTitle),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: deviceHeight * 0.02),
                const Text(
                    "1. Scroll up to load more data\n2. Tap on card to display profile"),
                SizedBox(height: deviceHeight * 0.02),
                Expanded(
                  child: LazyLoadScrollView(
                    isLoading: pageNumber <= totalPages + 1 ? isLoading : false,
                    scrollDirection: Axis.vertical,
                    onEndOfPage:
                        pageNumber <= totalPages + 1 ? loadMore : () {},
                    child: ListView.builder(
                      itemCount: dataList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            DataViewWidget(
                              displayData: dataList[index],
                            ),
                            index != dataList.length - 1
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: deviceWidth * 0.05),
                                    child: const Divider(
                                      color: Colors.black45,
                                      thickness: 1.5,
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Loader(
              flag: isLoading,
            )
          ],
        ),
      ),
    );
  }

  getApiData() async {
    setState(() {
      isLoading = true;
    });
    final data = await APIServices.getApiData(context, pageNumber);

    totalPages = data['total_pages'];
    if (data['data'].isNotEmpty || data['data'] != null && dataList.isEmpty) {
      dataList = data['data'];
    } else {
      return data;
    }
    setState(() {
      isLoading = false;
    });
  }

  loadMore() async {
    setState(() {
      isLoading = pageNumber < totalPages ? true : false;
      pageNumber++;
    });
    final result = await APIServices.getApiData(context, pageNumber);
    if (result['data'].isNotEmpty || result['data'] != null) {
      dataList.addAll(result['data']);
    }
    setState(() {
      isLoading = false;
    });
  }

  int pageNumber = 1;
  int totalPages = 0;
  bool isLoading = false;
  List dataList = [];
}
