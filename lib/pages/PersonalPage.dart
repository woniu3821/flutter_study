import 'package:flutter/material.dart';
import './HourList.dart';
import './MyApply.dart';

class PersonalPage extends StatefulWidget {
  PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人荣誉称号申请"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: "荣誉称号列表"), Tab(text: "我的申请(1)")],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        hourView(),
        myApplyView(),
      ]),
    );
  }
}
