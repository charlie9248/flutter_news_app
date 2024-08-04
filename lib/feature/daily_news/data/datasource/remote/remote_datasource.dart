
import 'package:news_app/feature/daily_news/data/models/article_model.dart';

abstract class RemoteDataSource   {

  Future<List<ArticleModel>> getArticleList();
}