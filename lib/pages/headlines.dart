import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/get_headlines_bloc/get_headlines_bloc.dart';
import 'package:news_app/routes/routes.gr.dart';
import 'package:presentation/presentation.dart';

class HeadlinesPage extends StatefulWidget {
  const HeadlinesPage({Key? key}) : super(key: key);

  @override
  State<HeadlinesPage> createState() => _HeadlinesPageState();
}

class _HeadlinesPageState extends State<HeadlinesPage> {
  bool _isInit = true;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      _isInit = false;
      context.read<GetHeadlinesBloc>().add(GetHeadlinesArticles());
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHeadlinesBloc, GetHeadlinesState>(
      builder: (context, state) {
        if (state is GetHeadlinesLoaded) {
          return NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
              FlexibleHealineHeader(
                article: state.healines.isEmpty ? null : state.healines.first,
                onPressed: () => state.healines.isEmpty
                    ? null
                    : AutoRouter.of(context).push(
                        ArticleRoute(article: state.healines.first),
                      ),
              ),
            ],
            body: state.healines.isEmpty
                ? const SizedBox()
                : ListView.separated(
                    padding: const EdgeInsets.only(
                      top: 130,
                      bottom: 60,
                    ),
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemCount: state.healines.length - 1,
                    itemBuilder: (context, index) {
                      return ArticleItem(
                        onPressed: () => AutoRouter.of(context).push(
                          ArticleRoute(
                            article: state.healines[index + 1],
                          ),
                        ),
                        article: state.healines[index + 1],
                      );
                    },
                  ),
          );
        }
        if (state is GetHeadlinesLoading || state is GetHeadlinesInitial) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          return const Center(child: Text("Somthing went wrong"));
        }
      },
    );
  }
}
