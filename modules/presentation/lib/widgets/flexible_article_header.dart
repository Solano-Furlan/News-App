import 'package:auto_size_text/auto_size_text.dart';
import 'package:domain/article/article.entity.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class FlexibleArticleHeader extends StatelessWidget {
  const FlexibleArticleHeader({
    Key? key,
    required this.article,
    required this.heightCallback,
    required this.isSaved,
    required this.onSavedPressed,
  }) : super(key: key);
  final ArticleModel? article;
  final bool isSaved;
  final Function(double) heightCallback;
  final Function() onSavedPressed;

  @override
  Widget build(BuildContext context) {
    const double expandedHeight = 500.0;
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        collapsedHeight: 100,
        expandedHeight: expandedHeight,
        pinned: true,
        primary: true,
        leading: const SizedBox(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        forceElevated: false,
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            heightCallback(constraints.constrainHeight());
            return Container(
              width: double.infinity,
              height: expandedHeight,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
              ),
              child: Stack(
                children: [
                  if (article != null &&
                      article!.url != null &&
                      constraints.constrainHeight() > 170)
                    SizedBox(
                      width: double.infinity,
                      height: expandedHeight,
                      child: article!.urlToImage != null &&
                              !article!.urlToImage!.contains("null")
                          ? Image.network(
                              article!.urlToImage!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              AppImages.newsBackground,
                              fit: BoxFit.fill,
                              package: "presentation",
                            ),
                    ),
                  Container(
                    height: expandedHeight,
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
                                  Colors.black.withOpacity(1),
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
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(
                                  Icons.arrow_back,
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
                              IconButton(
                                iconSize: 34,
                                padding: const EdgeInsets.all(0),
                                splashRadius: 34,
                                alignment: Alignment.center,
                                onPressed: () => onSavedPressed(),
                                icon: Icon(
                                  isSaved
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.white,
                                  size: 31,
                                ),
                              ),
                            ],
                          ),
                          if (constraints.constrainHeight() > 170)
                            const Spacer(),
                          if (constraints.constrainHeight() > 440) ...[
                            const SizedBox(height: 50),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300.withOpacity(.6),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    article!.source ?? "",
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                          ],
                          if (constraints.constrainHeight() > 355) ...[
                            AutoSizeText(
                              article?.title ?? "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 3,
                            ),
                            const SizedBox(height: 70),
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
