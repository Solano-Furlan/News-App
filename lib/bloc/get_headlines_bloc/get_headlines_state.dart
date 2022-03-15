part of 'get_headlines_bloc.dart';

abstract class GetHeadlinesState extends Equatable {
  const GetHeadlinesState();

  @override
  List<Object> get props => [];
}

class GetHeadlinesInitial extends GetHeadlinesState {}

class GetHeadlinesLoading extends GetHeadlinesState {}

class GetHeadlinesLoaded extends GetHeadlinesState {
  final List<ArticleModel> healines;

  const GetHeadlinesLoaded({this.healines = const <ArticleModel>[]});

  @override
  List<Object> get props => [healines];
}

class GetHeadlinesError extends GetHeadlinesState {}
