import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/service.dart';

import '../model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService service;
  NewsBloc({required this.service}) : super(NewsLoading()) {
    on<NewsArticleEvent>(_getNews);
  }

  Future<void> _getNews(NewsEvent event, Emitter<NewsState> emit) async {
    final news = await service.fetchNews();
    if (news != null) {
      emit(NewsSuccess(topNews: news));
    } else {
      emit(const NewsError(errorText: 'ERROR HA HA'));
    }
  }
}
