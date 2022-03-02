import 'package:auto_size_text/auto_size_text.dart';
import 'package:domain/article/article.entity.dart';
import 'package:flutter/material.dart';
import 'package:presentation/theme/app_theme.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key, required this.article}) : super(key: key);
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Stack(
        children: [
          if (article.url != null)
            SizedBox(
              width: double.infinity,
              height: 450,
              child: Image.network(
                article.urlToImage!,
                fit: BoxFit.cover,
              ),
            ),
          Container(
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.3),
                    Colors.black.withOpacity(.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).viewPadding.top + 40,
                  ),
                  const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 34,
                  ),
                  const SizedBox(height: 30),
                  IntrinsicWidth(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300.withOpacity(.6),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "News of the day",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AutoSizeText(
                    article.title ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Learn more",
                        style: appTheme.textTheme.headline2!.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
