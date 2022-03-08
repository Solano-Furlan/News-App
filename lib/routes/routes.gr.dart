// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:domain/article/article.entity.dart' as _i7;
import 'package:flutter/material.dart' as _i6;

import '../pages/article.dart' as _i4;
import '../pages/home.dart' as _i1;
import '../pages/saves_articles.dart' as _i3;
import '../pages/search.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    SearchRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SearchPage());
    },
    SavedArticlesRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SavedArticlesPage());
    },
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ArticlePage(key: args.key, article: args.article));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeRoute.name, path: '/'),
        _i5.RouteConfig(SearchRoute.name, path: '/search-page'),
        _i5.RouteConfig(SavedArticlesRoute.name, path: '/saved-articles-page'),
        _i5.RouteConfig(ArticleRoute.name, path: '/article-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.SearchPage]
class SearchRoute extends _i5.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '/search-page');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i3.SavedArticlesPage]
class SavedArticlesRoute extends _i5.PageRouteInfo<void> {
  const SavedArticlesRoute()
      : super(SavedArticlesRoute.name, path: '/saved-articles-page');

  static const String name = 'SavedArticlesRoute';
}

/// generated route for
/// [_i4.ArticlePage]
class ArticleRoute extends _i5.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({_i6.Key? key, required _i7.ArticleModel article})
      : super(ArticleRoute.name,
            path: '/article-page',
            args: ArticleRouteArgs(key: key, article: article));

  static const String name = 'ArticleRoute';
}

class ArticleRouteArgs {
  const ArticleRouteArgs({this.key, required this.article});

  final _i6.Key? key;

  final _i7.ArticleModel article;

  @override
  String toString() {
    return 'ArticleRouteArgs{key: $key, article: $article}';
  }
}
