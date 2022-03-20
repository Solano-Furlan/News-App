import 'package:auto_route/auto_route.dart';
import 'package:news_app/pages/auth/login.dart';
import 'package:news_app/pages/main/article.dart';
import 'package:news_app/pages/main/headlines.dart';
import 'package:news_app/pages/main/home.dart';
import 'package:news_app/pages/main/saved_articles.dart';
import 'package:news_app/pages/main/search.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'login',
      page: LoginPage,
    ),
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
