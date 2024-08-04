part of 'remote_article_bloc.dart';

sealed class RemoteArticleEvent extends Equatable {
  const RemoteArticleEvent();
}

 class GetArticlesEvent extends RemoteArticleEvent {
  const GetArticlesEvent();

  @override
  List<Object?> get props => [];
}



