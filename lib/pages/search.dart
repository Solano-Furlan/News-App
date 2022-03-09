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

  List sections = [
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 78),
              IconButton(
                onPressed: () {},
                iconSize: 34,
                padding: const EdgeInsets.all(0),
                splashRadius: 34,
                alignment: Alignment.centerLeft,
                icon: const Icon(
                  Icons.menu,
                  size: 34,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "Discover",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "News from all over the world",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),
              SearchBar(
                controller: controller,
                onPressedFilter: () {},
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        SizedBox(
          height: 58,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: sections.length,
            itemBuilder: (context, index) {
              return _buildSectionItem(title: sections[index], index: index);
            },
          ),
        ),
        if (articles.isNotEmpty)
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(
                top: 15,
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
          ),
      ],
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
