import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/get_headlines_bloc/get_headlines_bloc.dart';
import 'package:news_app/bloc/login_bloc/login_bloc.dart';
import 'package:news_app/bloc/saved_aticles_bloc/saved_articles_bloc.dart';
import 'package:news_app/dependencies/dependencies.dart';
import 'package:news_app/routes/routes.gr.dart';
import 'package:presentation/presentation.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ArticlesBloc()..add(GetSavedArticles()),
        ),
        BlocProvider(
          create: (context) =>
              GetHeadlinesBloc(articlesRepo: getIt<ArticleRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              LoginBloc(authRepository: getIt<AuthenticationRepository>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: appTheme,
        builder: (BuildContext? context, Widget? widget) =>
            ResponsiveWrapper.builder(
          widget,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        ),
      ),
    );
  }
}
