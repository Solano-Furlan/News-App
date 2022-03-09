import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:news_app/dependencies/dependencies.dart';
import 'package:news_app/routes/routes.gr.dart';
import 'package:presentation/presentation.dart';

class HeadlinesPage extends StatefulWidget {
  const HeadlinesPage({Key? key}) : super(key: key);

  @override
  State<HeadlinesPage> createState() => _HeadlinesPageState();
}

class _HeadlinesPageState extends State<HeadlinesPage> {
  bool _isInit = true;
  List<ArticleModel> articles = [];
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      _isInit = false;
      final res = await getIt<ArticleRepository>().getTopHeadlines();
      setState(() {
        articles = res;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
          <Widget>[
        FlexibleHealineHeader(
          article: articles.isEmpty ? null : articles.first,
          onPressed: () => articles.isEmpty
              ? null
              : AutoRouter.of(context).push(
                  ArticleRoute(article: articles.first),
                ),
        ),
      ],
      body: Column(
        children: [
          articles.isEmpty
              ? const Spacer()
              : Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(
                      top: 130,
                      bottom: 60,
                    ),
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemCount: articles.length - 1,
                    itemBuilder: (context, index) {
                      return ArticleItem(
                        onPressed: () => AutoRouter.of(context).push(
                          ArticleRoute(
                            article: articles[index + 1],
                          ),
                        ),
                        article: articles[index + 1],
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
