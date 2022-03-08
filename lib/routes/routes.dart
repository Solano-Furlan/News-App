import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:news_app/pages/article.dart';
import 'package:news_app/pages/home.dart';
import 'package:news_app/pages/saves_articles.dart';
import 'package:news_app/pages/search.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: SearchPage),
    AutoRoute(page: SavedArticlesPage),
    AutoRoute(page: ArticlePage),
  ],
)
class $AppRouter {}
