import 'package:auto_size_text/auto_size_text.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:news_app/dependencies/dependencies.dart';
import 'package:presentation/presentation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      body: Column(
        children: [
          if (articles.isNotEmpty) HomeHeader(article: articles.first),
          if (articles.length > 1)
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 30,
                  bottom: 60,
                ),
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 45),
                itemCount: articles.length - 1,
                itemBuilder: (context, index) {
                  return NewsItem(
                    onPressed: () {},
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
