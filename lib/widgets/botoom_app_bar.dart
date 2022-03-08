import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/routes/routes.gr.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

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
                  onPressed: () =>
                      AutoRouter.of(context).replaceAll([const HomeRoute()]),
                  icon: const Icon(
                    Icons.home,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      AutoRouter.of(context).replaceAll([const SearchRoute()]),
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => AutoRouter.of(context)
                      .replaceAll([const SavedArticlesRoute()]),
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    size: 30,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
