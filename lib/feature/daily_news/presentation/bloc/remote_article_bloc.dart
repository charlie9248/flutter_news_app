import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/data_state.dart';
import 'package:news_app/feature/daily_news/domain/entities/article.dart';
import 'package:news_app/feature/daily_news/domain/usecases/get_articles.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {

  final GetArticleUseCase _getArticleUseCase;


  RemoteArticleBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()) {
    on<GetArticlesEvent>(_onGetArticles);
  }

  FutureOr<void> _onGetArticles(GetArticlesEvent event, Emitter<RemoteArticleState> emit) async {

    final dataState  = await  _getArticleUseCase.call();

    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(RemoteArticlesSuccess(dataState.data!));
    }else{
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
