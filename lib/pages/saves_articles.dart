import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/articles_bloc.dart';
import 'package:news_app/routes/routes.gr.dart';
import 'package:news_app/widgets/botoom_app_bar.dart';
import 'package:news_app/widgets/main_scaffold.dart';
import 'package:presentation/widgets/article_item.dart';

class SavedArticlesPage extends StatelessWidget {
  const SavedArticlesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MainScaffold(
        body: Expanded(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.black,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
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
                    const Text(
                      "Saved Articles",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 50)
                  ],
                ),
              ),
              BlocConsumer<ArticlesBloc, ArticlesState>(
                builder: (context, state) {
                  if (state is ArticlesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SavedArticlesLoaded) {
                    if (state.savedArticles.isNotEmpty) {
                      return Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.only(
                            top: 25,
                            bottom: 60,
                          ),
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 5),
                          itemCount: state.savedArticles.length,
                          itemBuilder: (context, index) {
                            return ArticleItem(
                              onPressed: () => AutoRouter.of(context).push(
                                ArticleRoute(
                                  article: state.savedArticles[index],
                                ),
                              ),
                              article: state.savedArticles[index],
                            );
                          },
                        ),
                      );
                    }
                    return Column(
                      children: [
                        const SizedBox(height: 100),
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          radius: 100,
                          child: const Icon(Icons.favorite_border, size: 100),
                        ),
                        const SizedBox(height: 30),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "You have no saved\narticles",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 31),
                          ),
                        )
                      ],
                    );
                  } else {
                    return const Text('Something went wrong.');
                  }
                },
                listener: (context, state) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
