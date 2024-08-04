part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {

  final List<ArticleEntity> ? articles;
  final DioException ? error;
  const RemoteArticleState({this.articles , this.error});

  @override
  List<Object> get props => [articles! , error!];

}

final class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

final class RemoteArticlesSuccess extends RemoteArticleState {
  const RemoteArticlesSuccess(List<ArticleEntity> articles) : super(articles: articles);
}

final class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioException error) : super(error: error);
}

