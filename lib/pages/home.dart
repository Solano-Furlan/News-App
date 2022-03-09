import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/routes/routes.gr.dart';
import 'package:presentation/widgets/botoom_app_bar.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AutoTabsScaffold(
        routes: const [
          HeadlinesRouter(),
          SearchRouter(),
          SavedArticlesRouter(),
        ],
        builder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
                KeyboardVisibilityBuilder(
                    builder: (context, isKeyboardVisible) {
                  return isKeyboardVisible
                      ? const SizedBox()
                      : CustomBottomAppBar(
                          setActiveIndex: (index) =>
                              tabsRouter.setActiveIndex(index),
                          currentIndex: tabsRouter.activeIndex,
                        );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
