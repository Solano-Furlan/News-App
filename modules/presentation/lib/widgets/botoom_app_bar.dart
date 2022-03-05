import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final String currentRoute;
  const CustomBottomAppBar({Key? key, required this.currentRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 2,
          width: double.infinity,
          color: Colors.grey.shade300,
        ),
        Container(
            height: 70,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.manage_accounts_rounded,
                    size: 30,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
