import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stacked/stacked.dart';
import 'package:time_tracking_app/app/theme/app_color.dart';
import 'package:time_tracking_app/presentation/dashboard_screen/view_model/DashBaordViewModel.dart';

import '../../../../common/widget_styling/WidgetStyling.dart';

class DashBoardScreen extends StatefulWidget {
  static const route = '/';

  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashBoardViewModel dashboardViewModel = DashBoardViewModel();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashBoardViewModel>.reactive(
        viewModelBuilder: () => dashboardViewModel,
        onModelReady: (viewModel) async {},
        builder: (context, viewModel, child) {
          return SafeArea(
              child: Scaffold(
            body: _buildBody(),
          ));
        });
  }

  _buildBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTodoWidget(),
            addHorizontalSpace(10),
            _buildInProgressWidget(),
            addHorizontalSpace(10),
            _buildDoneWidget()
          ],
        ),
      ),
    );
  }

  _buildTodoWidget() {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width / 1.3,
      child: Container(
          decoration: hContainerBorder(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTitle('Todo'),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share,
                              size: 20,
                              color: AppColor.Gray700,
                            )),
                        IconButton(
                            onPressed: () {
                              dashboardViewModel.hAddNewTask();
                            },
                            icon: Icon(
                              Icons.add,
                              color: AppColor.Orange,
                            ))
                      ],
                    )
                  ],
                ),
              ),
              addVerticalSpace(10),
              false
                  ? buildTodoList()
                  : Center(
                      child: hEmptyText(
                        'Click to add task',
                        100,
                        MediaQuery.of(context).size.width / 1.3,
                      ),
                    )
            ],
          )),
    );
  }

  _buildInProgressWidget() {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width / 1.3,
      child: Container(
          decoration: hContainerBorder(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTitle('InProgress'),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share,
                              size: 20,
                              color: AppColor.Gray700,
                            )),
                        IconButton(
                            onPressed: () {
                              dashboardViewModel.hAddNewTask();
                            },
                            icon: Icon(
                              Icons.add,
                              color: AppColor.Orange,
                            ))
                      ],
                    )
                  ],
                ),
              ),
              addVerticalSpace(10),
              false
                  ? buildTodoList()
                  : Center(
                      child: hEmptyText(
                        'Click to add task',
                        100,
                        MediaQuery.of(context).size.width / 1.3,
                      ),
                    )
            ],
          )),
    );
  }

  _buildDoneWidget() {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width / 1.3,
      child: Container(
        decoration: hContainerBorder(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTitle('Done'),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: AppColor.Gray700,
                            size: 20,
                          )),
                      IconButton(
                          onPressed: () {
                            dashboardViewModel.hAddNewTask();
                          },
                          icon: Icon(
                            Icons.add,
                            color: AppColor.Orange,
                          ))
                    ],
                  )
                ],
              ),
            ),
            addVerticalSpace(10),
            false
                ? buildTodoList()
                : Center(
                    child: hEmptyText(
                      'Click to add task',
                      100,
                      MediaQuery.of(context).size.width / 1.3,
                    ),
                  )
          ],
        ),
      ),
    );
  }

  _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(title),
    );
  }

  buildTodoList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: 0,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 10),
          child: SlideAnimation(
            verticalOffset: 44.0,
            child: FadeInAnimation(
              child: Container(),
            ),
          ),
        );
      },
    );
  }
}
