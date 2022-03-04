import 'package:auto_size_text/auto_size_text.dart';
import 'package:domain/article/article.entity.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class FlexibleHeader extends StatelessWidget {
  final ArticleModel article;
  const FlexibleHeader({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        collapsedHeight: 100,
        expandedHeight: 450,
        pinned: true,
        primary: true,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        forceElevated: false,
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              width: double.infinity,
              height: 450,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: constraints.constrainHeight() > 170
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      )
                    : null,
              ),
              child: Stack(
                children: [
                  if (article.url != null &&
                      constraints.constrainHeight() > 170)
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
                      color: constraints.constrainHeight() < 170
                          ? Colors.black
                          : null,
                      gradient: constraints.constrainHeight() < 170
                          ? null
                          : LinearGradient(
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
                        mainAxisAlignment: constraints.constrainHeight() > 170
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).viewPadding.top +
                                (constraints.constrainHeight() > 170 ? 40 : 0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                iconSize: 34,
                                padding: const EdgeInsets.all(0),
                                splashRadius: 34,
                                alignment: Alignment.centerLeft,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 34,
                                ),
                              ),
                              Text(
                                constraints.constrainHeight() < 170
                                    ? "pressage"
                                    : "",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 50)
                            ],
                          ),
                          if (constraints.constrainHeight() > 280) ...[
                            const SizedBox(height: 50),
                            IntrinsicWidth(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
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
                          ],
                          if (constraints.constrainHeight() > 375)
                            AutoSizeText(
                              article.title ?? "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 3,
                            ),
                          if (constraints.constrainHeight() > 400) ...[
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
                          ]
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
