part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  const NewsSuccess({required this.topNews});
  final TopNews topNews;
}

final class NewsError extends NewsState {
  const NewsError({required this.errorText});
  final String errorText;
}
