import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mycourses_controller.dart';

class MycoursesView extends GetView<MycoursesController> {
  const MycoursesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MycoursesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MycoursesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
