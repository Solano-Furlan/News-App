import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:news_app/pages/article.dart';
import 'package:news_app/pages/headlines.dart';
import 'package:news_app/pages/home.dart';
import 'package:news_app/pages/saved_articles.dart';
import 'package:news_app/pages/search.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: HomePage, children: [
      AutoRoute(
        path: 'search',
        name: 'SearchRouter',
        page: SearchPage,
      ),
      AutoRoute(
        path: 'saved-articles',
        name: 'SavedArticlesRouter',
        page: SavedArticlesPage,
      ),
      AutoRoute(
        path: 'headlines',
        name: 'HeadlinesRouter',
        page: HeadlinesPage,
      ),
    ]),
    AutoRoute(page: ArticlePage),
  ],
)
class $AppRouter {}
