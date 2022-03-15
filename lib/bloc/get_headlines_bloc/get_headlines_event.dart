part of 'get_headlines_bloc.dart';

abstract class GetHeadlinesEvent extends Equatable {}

class GetHeadlinesArticles extends GetHeadlinesEvent {
  final List<ArticleModel> headlines;
  GetHeadlinesArticles({this.headlines = const <ArticleModel>[]});

  @override
  List<Object> get props => [headlines];
}
