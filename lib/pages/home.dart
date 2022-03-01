import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:news_app/dependencies/dependencies.dart';
import 'package:presentation/presentation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PrimaryButton(
        onPressed: () async {
          final res = await getIt<Backend>().getHeadlines();
          print(res);
        },
        text: "Articles",
      )),
    );
  }
}
