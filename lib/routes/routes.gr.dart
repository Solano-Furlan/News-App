// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:domain/article/article.entity.dart' as _i9;
import 'package:flutter/material.dart' as _i8;

import '../pages/auth/login.dart' as _i1;
import '../pages/main/article.dart' as _i3;
import '../pages/main/headlines.dart' as _i6;
import '../pages/main/home.dart' as _i2;
import '../pages/main/saved_articles.dart' as _i5;
import '../pages/main/search.dart' as _i4;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.ArticlePage(key: args.key, article: args.article));
    },
    SearchRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SearchPage());
    },
    SavedArticlesRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SavedArticlesPage());
    },
    HeadlinesRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HeadlinesPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(LoginRoute.name, path: 'login'),
        _i7.RouteConfig(HomeRoute.name, path: '/', children: [
          _i7.RouteConfig(SearchRouter.name,
              path: 'search', parent: HomeRoute.name),
          _i7.RouteConfig(SavedArticlesRouter.name,
              path: 'saved-articles', parent: HomeRoute.name),
          _i7.RouteConfig(HeadlinesRouter.name,
              path: 'headlines', parent: HomeRoute.name)
        ]),
        _i7.RouteConfig(ArticleRoute.name, path: '/article-page')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.ArticlePage]
class ArticleRoute extends _i7.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({_i8.Key? key, required _i9.ArticleModel article})
      : super(ArticleRoute.name,
            path: '/article-page',
            args: ArticleRouteArgs(key: key, article: article));

  static const String name = 'ArticleRoute';
}

class ArticleRouteArgs {
  const ArticleRouteArgs({this.key, required this.article});

  final _i8.Key? key;

  final _i9.ArticleModel article;

  @override
  String toString() {
    return 'ArticleRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i4.SearchPage]
class SearchRouter extends _i7.PageRouteInfo<void> {
  const SearchRouter() : super(SearchRouter.name, path: 'search');

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i5.SavedArticlesPage]
class SavedArticlesRouter extends _i7.PageRouteInfo<void> {
  const SavedArticlesRouter()
      : super(SavedArticlesRouter.name, path: 'saved-articles');

  static const String name = 'SavedArticlesRouter';
}

/// generated route for
/// [_i6.HeadlinesPage]
class HeadlinesRouter extends _i7.PageRouteInfo<void> {
  const HeadlinesRouter() : super(HeadlinesRouter.name, path: 'headlines');

  static const String name = 'HeadlinesRouter';
}
