import 'package:flutter/material.dart';

import 'botoom_app_bar.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  const MainScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            body,
            const CustomBottomAppBar(),
          ],
        ),
      ),
    );
  }
}
