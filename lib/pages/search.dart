import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:news_app/dependencies/dependencies.dart';
import 'package:news_app/routes/routes.gr.dart';
import 'package:presentation/presentation.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();

  List<String> sections = [
    "Heath",
    "Politics",
    "Economics",
    "Traval",
    "Food",
    "Nature",
  ];
  String selectedSection = "Heath";

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
        FlexibleSearchHeader(
          controller: controller,
          heightCallback: (_) {},
          sections: sections,
          selectedSection: selectedSection,
        ),
      ],
      body: articles.isEmpty
          ? const SizedBox()
          : ListView.separated(
              padding: const EdgeInsets.only(
                top: 210,
                bottom: 60,
              ),
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 5),
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
    );
  }

  Widget _buildSectionItem({
    required String title,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSection = title;
        });
      },
      child: IntrinsicWidth(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 20),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: title == selectedSection
                      ? Colors.black
                      : Colors.grey.shade400,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              height: 3,
              color: index == 0 && title == selectedSection
                  ? Colors.black
                  : Colors.grey.shade400,
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: double.infinity,
                height: 3,
                color: title == selectedSection
                    ? Colors.black
                    : Colors.grey.shade400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
