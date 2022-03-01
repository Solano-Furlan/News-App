import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:news_app/pages/home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    //Auth
    AutoRoute(page: HomePage, initial: true),
  ],
)
class $AppRouter {}
