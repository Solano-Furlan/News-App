// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:domain/domain.dart' as _i6;
import 'package:flutter/material.dart' as _i5;

import '../pages/article.dart' as _i2;
import '../pages/home.dart' as _i1;
import '../pages/saves_articles.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ArticlePage(key: args.key, article: args.article));
    },
    SavedArticlesRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SavedArticlesPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeRoute.name, path: '/'),
        _i4.RouteConfig(ArticleRoute.name, path: '/article-page'),
        _i4.RouteConfig(SavedArticlesRoute.name, path: '/saved-articles-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ArticlePage]
class ArticleRoute extends _i4.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({_i5.Key? key, required _i6.ArticleModel article})
      : super(ArticleRoute.name,
            path: '/article-page',
            args: ArticleRouteArgs(key: key, article: article));

  static const String name = 'ArticleRoute';
}

class ArticleRouteArgs {
  const ArticleRouteArgs({this.key, required this.article});

  final _i5.Key? key;

  final _i6.ArticleModel article;

  @override
  String toString() {
    return 'ArticleRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i3.SavedArticlesPage]
class SavedArticlesRoute extends _i4.PageRouteInfo<void> {
  const SavedArticlesRoute()
      : super(SavedArticlesRoute.name, path: '/saved-articles-page');

  static const String name = 'SavedArticlesRoute';
}
