import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class AppDrawer extends StatelessWidget {
  final PageRouteInfo<dynamic> loginRoute;
  const AppDrawer({Key? key, required this.loginRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 200,
            color: Colors.black,
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: const Text(
                  "pressage",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              AutoRouter.of(context).pushAll([loginRoute]);
            },
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text("Login"),
            ),
          )
        ],
      ),
    );
  }
}
