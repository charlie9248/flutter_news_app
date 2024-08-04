
import 'package:dio/dio.dart';
import 'package:news_app/core/data_state.dart';
import 'package:news_app/feature/daily_news/data/datasource/remote/remote_datasource.dart';
import 'package:news_app/feature/daily_news/data/models/article_model.dart';
import 'package:news_app/feature/daily_news/domain/entities/article.dart';
import 'package:news_app/feature/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl  implements ArticleRepository {


  final RemoteDataSource _remoteDataSource;

  ArticleRepositoryImpl(this._remoteDataSource);


  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try{
      var result = await _remoteDataSource.getArticleList() ;
      return DataSuccess(result);
    } on DioException catch(error) {
      return DataError(error);
    }
  }
}
