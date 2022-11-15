import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/whishlist_controller.dart';

class WhishlistView extends GetView<WhishlistController> {
  const WhishlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhishlistView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WhishlistView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
