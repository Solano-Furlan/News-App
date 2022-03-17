import 'package:domain/article/article.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/saved_aticles_bloc/saved_articles_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key, required this.article}) : super(key: key);

  final ArticleModel article;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  double? headerHeight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            <Widget>[
          BlocBuilder<ArticlesBloc, SavedArticlesState>(
            builder: (context, state) {
              if (state is SavedArticlesLoaded) {
                return FlexibleArticleHeader(
                  article: widget.article,
                  isSaved:
                      state.savedArticles.any((e) => e.id == widget.article.id),
                  onSavedPressed: () {
                    if (state.savedArticles
                            .any((e) => e.id == widget.article.id) ==
                        false) {
                      context.read<ArticlesBloc>().add(
                            SaveArticle(
                              article: widget.article,
                            ),
                          );
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ConfirmationPopup(
                              title: "Remove Article",
                              text:
                                  "Are you sure that you want to remove this article from the saved list?",
                              onConfirmation: () {
                                context.read<ArticlesBloc>().add(
                                      DeleteSavedArticle(
                                        articleId: widget.article.id,
                                      ),
                                    );
                                Navigator.of(context).pop();
                              },
                            );
                          });
                    }
                  },
                  heightCallback: (val) {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      setState(() {
                        headerHeight = val;
                      });
                    });
                  },
                );
              }
              return FlexibleArticleHeader(
                article: null,
                isSaved: false,
                onSavedPressed: () {},
                heightCallback: (_) {},
              );
            },
          ),
        ],
        body: Column(
          children: [
            const SizedBox(height: 100),
            Expanded(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior(),
                  child: GlowingOverscrollIndicator(
                    axisDirection: AxisDirection.down,
                    color: Colors.transparent,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        SizedBox(
                            height: headerHeight != null && headerHeight! < 150
                                ? 80
                                : 40),
                        Text(
                          widget.article.description ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (widget.article.url != null &&
                !widget.article.url!.contains("null"))
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: PrimaryButton(
                        onPressed: () async {
                          if (!await launch(widget.article.url!)) {
                            throw 'Could not launch ${widget.article.url}';
                          }
                        },
                        trailingIcon: const Icon(
                          Icons.open_in_new,
                          color: Colors.white,
                          size: 24,
                        ),
                        text: "Read More",
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
