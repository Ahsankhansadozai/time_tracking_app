import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../app/theme/app_color.dart';
import '../../../../../common/widget_styling/WidgetStyling.dart';

class TaskListLoadingView extends StatelessWidget {
  const TaskListLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Container(
                decoration: BoxDecoration(
                  color: themeData.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.Gray200,
                        highlightColor: AppColor.Gray200,
                        child: Container(
                            decoration: BoxDecoration(
                          color: themeData.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        )),
                      ),
                    ),
                    addVerticalSpace(5),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.Gray200,
                        highlightColor: AppColor.Gray200,
                        child: Container(
                            decoration: BoxDecoration(
                          color: themeData.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        )),
                      ),
                    ),
                    addVerticalSpace(5),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.Gray200,
                        highlightColor: AppColor.Gray200,
                        child: Container(
                            decoration: BoxDecoration(
                          color: themeData.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        )),
                      ),
                    ),
                    addVerticalSpace(5),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.Gray200,
                        highlightColor: AppColor.Gray200,
                        child: Container(
                            decoration: BoxDecoration(
                          color: themeData.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        )),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Container(
                decoration: BoxDecoration(
                  color: themeData.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.Gray200,
                        highlightColor: AppColor.Gray200,
                        child: Container(
                            decoration: BoxDecoration(
                          color: themeData.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        )),
                      ),
                    ),
                    addVerticalSpace(5),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.Gray200,
                        highlightColor: AppColor.Gray200,
                        child: Container(
                            decoration: BoxDecoration(
                          color: themeData.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        )),
                      ),
                    ),
                    addVerticalSpace(5),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.Gray200,
                        highlightColor: AppColor.Gray200,
                        child: Container(
                            decoration: BoxDecoration(
                          color: themeData.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        )),
                      ),
                    ),
                    addVerticalSpace(5),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.Gray200,
                        highlightColor: AppColor.Gray200,
                        child: Container(
                            decoration: BoxDecoration(
                          color: themeData.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        )),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Container(
                decoration: BoxDecoration(
                  color: themeData.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.Gray200,
                        highlightColor: AppColor.Gray200,
                        child: Container(
                            decoration: BoxDecoration(
                          color: themeData.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        )),
                      ),
                    ),
                    addVerticalSpace(5),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.Gray200,
                        highlightColor: AppColor.Gray200,
                        child: Container(
                            decoration: BoxDecoration(
                          color: themeData.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        )),
                      ),
                    ),
                    addVerticalSpace(5),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.Gray200,
                        highlightColor: AppColor.Gray200,
                        child: Container(
                            decoration: BoxDecoration(
                          color: themeData.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        )),
                      ),
                    ),
                    addVerticalSpace(5),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      child: Shimmer.fromColors(
                        baseColor: AppColor.Gray200,
                        highlightColor: AppColor.Gray200,
                        child: Container(
                            decoration: BoxDecoration(
                          color: themeData.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        )),
                      ),
                    ),
                  ],
                )),
          ),
        ),


      ]),
    );
  }
}
