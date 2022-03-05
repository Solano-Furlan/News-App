// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:domain/domain.dart' as _i5;
import 'package:flutter/material.dart' as _i4;

import '../pages/article.dart' as _i2;
import '../pages/home.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ArticleRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ArticlePage(key: args.key, article: args.article));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(HomeRoute.name, path: '/'),
        _i3.RouteConfig(ArticleRoute.name, path: '/article-page')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ArticlePage]
class ArticleRoute extends _i3.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({_i4.Key? key, required _i5.ArticleModel article})
      : super(ArticleRoute.name,
            path: '/article-page',
            args: ArticleRouteArgs(key: key, article: article));

  static const String name = 'ArticleRoute';
}

class ArticleRouteArgs {
  const ArticleRouteArgs({this.key, required this.article});

  final _i4.Key? key;

  final _i5.ArticleModel article;

  @override
  String toString() {
    return 'ArticleRouteArgs{key: $key, article: $article}';
  }
}
