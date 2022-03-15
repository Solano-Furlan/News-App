// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:domain/article/article.entity.dart' as _i8;
import 'package:flutter/material.dart' as _i7;

import '../pages/article.dart' as _i2;
import '../pages/headlines.dart' as _i5;
import '../pages/home.dart' as _i1;
import '../pages/saved_articles.dart' as _i4;
import '../pages/search.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ArticlePage(key: args.key, article: args.article));
    },
    SearchRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SearchPage());
    },
    SavedArticlesRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SavedArticlesPage());
    },
    HeadlinesRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HeadlinesPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(HomeRoute.name, path: '/', children: [
          _i6.RouteConfig(SearchRouter.name,
              path: 'search', parent: HomeRoute.name),
          _i6.RouteConfig(SavedArticlesRouter.name,
              path: 'saved-articles', parent: HomeRoute.name),
          _i6.RouteConfig(HeadlinesRouter.name,
              path: 'headlines', parent: HomeRoute.name)
        ]),
        _i6.RouteConfig(ArticleRoute.name, path: '/article-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ArticlePage]
class ArticleRoute extends _i6.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({_i7.Key? key, required _i8.ArticleModel article})
      : super(ArticleRoute.name,
            path: '/article-page',
            args: ArticleRouteArgs(key: key, article: article));

  static const String name = 'ArticleRoute';
}

class ArticleRouteArgs {
  const ArticleRouteArgs({this.key, required this.article});

  final _i7.Key? key;

  final _i8.ArticleModel article;

  @override
  String toString() {
    return 'ArticleRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i3.SearchPage]
class SearchRouter extends _i6.PageRouteInfo<void> {
  const SearchRouter() : super(SearchRouter.name, path: 'search');

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i4.SavedArticlesPage]
class SavedArticlesRouter extends _i6.PageRouteInfo<void> {
  const SavedArticlesRouter()
      : super(SavedArticlesRouter.name, path: 'saved-articles');

  static const String name = 'SavedArticlesRouter';
}

/// generated route for
/// [_i5.HeadlinesPage]
class HeadlinesRouter extends _i6.PageRouteInfo<void> {
  const HeadlinesRouter() : super(HeadlinesRouter.name, path: 'headlines');

  static const String name = 'HeadlinesRouter';
}
