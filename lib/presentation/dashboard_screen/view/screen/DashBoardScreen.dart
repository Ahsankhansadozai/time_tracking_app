import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:time_tracking_app/common/constants.dart';
import 'package:time_tracking_app/common/custom_function.dart';
import 'package:time_tracking_app/domain/model/Task.dart';
import 'package:time_tracking_app/presentation/dashboard_screen/view/components/ListItemView/view/ListItemView.dart';
import 'package:time_tracking_app/presentation/dashboard_screen/view/components/ListLoadingView/TaskListLoadingView.dart';
import 'package:time_tracking_app/presentation/dashboard_screen/view_model/DashBaordViewModel.dart';

import '../../../../common/widget_styling/WidgetStyling.dart';
import '../../../../core/view_state.dart';

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
        onModelReady: (viewModel) async {
          viewModel.hFetchAllTaskFromLocalDb();
        },
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTodoWidget(),
          _buildInProgressWidget(),
          _buildDoneWidget()
        ],
      ),
    );
  }

  _buildTodoWidget() {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.3,
        child: Container(
            decoration: hContainerBorder(10.0, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTitle('Todo'),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                dashboardViewModel.hConvertListToCsvFile(
                                    dashboardViewModel.hGetTodoList(TODO));
                              },
                              icon: const Icon(
                                Icons.share,
                              )),
                          IconButton(
                              onPressed: () {
                                dashboardViewModel.hAddNewTask(TODO);
                              },
                              icon: const Icon(
                                Icons.add,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                buildTodoListWidget()
              ],
            )),
      ),
    );
  }

  _buildInProgressWidget() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.3,
        child: Container(
            decoration: hContainerBorder(10.0, context),
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
                              onPressed: () {
                                dashboardViewModel.hConvertListToCsvFile(
                                    dashboardViewModel
                                        .hGetTodoList(INPROGRESS));
                              },
                              icon: const Icon(
                                Icons.share,
                              )),
                          IconButton(
                              onPressed: () {
                                dashboardViewModel.hAddNewTask(INPROGRESS);
                              },
                              icon: const Icon(
                                Icons.add,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                buildInProgressListWidget()
              ],
            )),
      ),
    );
  }

  _buildDoneWidget() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.3,
        child: Container(
          decoration: hContainerBorder(10.0, context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTitle('Done'),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              dashboardViewModel.hConvertListToCsvFile(
                                  dashboardViewModel.hGetTodoList(DONE));
                            },
                            icon: const Icon(
                              Icons.share,
                            )),
                        IconButton(
                            onPressed: () {
                              dashboardViewModel.hAddNewTask(DONE);
                            },
                            icon: const Icon(
                              Icons.add,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              buildInDoneWidget()
            ],
          ),
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

  buildTodoList(List<TaskModel> data) {
    printLog(data.length.toString());
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      controller: dashboardViewModel.scrollControllerTodo,
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListItemView(data[index]);
      },
    );
  }

  buildInProgressList(List<TaskModel> data) {
    printLog(data.length.toString());
    return ListView.builder(
      controller: dashboardViewModel.scrollControllerInProgress,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListItemView(data[index]);
      },
    );
  }

  buildDoneList(List<TaskModel> data) {
    printLog(data.length.toString());
    return ListView.builder(
      controller: dashboardViewModel.scrollControllerDone,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListItemView(data[index]);
      },
    );
  }

  buildTodoListWidget() {
    switch (dashboardViewModel.viewState.state) {
      case ResponseState.LOADING:
        return const TaskListLoadingView();
      case ResponseState.COMPLETE:
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 2.0),
            child: buildTodoList(dashboardViewModel.hFindTaskFromList(TODO)),
          ),
        );
      case ResponseState.ERROR:
        return Center(
          child: hEmptyText(
            'Un_Expected error occurred while Loading List',
            100,
            MediaQuery.of(context).size.width / 1.3,
          ),
        );
      case ResponseState.EMPTY:
        return Center(
          child: hEmptyText(
            'Click to add task',
            100,
            MediaQuery.of(context).size.width / 1.3,
          ),
        );
    }
  }

  buildInProgressListWidget() {
    switch (dashboardViewModel.viewState.state) {
      case ResponseState.LOADING:
        return const TaskListLoadingView();
      case ResponseState.COMPLETE:
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 2.0),
            child: buildInProgressList(
                dashboardViewModel.hFindTaskFromList(INPROGRESS)),
          ),
        );
      case ResponseState.ERROR:
        return Center(
          child: hEmptyText(
            'Un_Expected error occurred while Loading List',
            100,
            MediaQuery.of(context).size.width / 1.3,
          ),
        );
      case ResponseState.EMPTY:
        return Center(
          child: hEmptyText(
            'Click to add task',
            100,
            MediaQuery.of(context).size.width / 1.3,
          ),
        );
    }
  }

  buildInDoneWidget() {
    switch (dashboardViewModel.viewState.state) {
      case ResponseState.LOADING:
        return const TaskListLoadingView();
      case ResponseState.COMPLETE:
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 2.0),
            child:
                buildInProgressList(dashboardViewModel.hFindTaskFromList(DONE)),
          ),
        );
      case ResponseState.ERROR:
        return Center(
          child: hEmptyText(
            'Un_Expected error occurred while Loading List',
            100,
            MediaQuery.of(context).size.width / 1.3,
          ),
        );
      case ResponseState.EMPTY:
        return Center(
          child: hEmptyText(
            'Click to add task',
            100,
            MediaQuery.of(context).size.width / 1.3,
          ),
        );
    }
  }
}
