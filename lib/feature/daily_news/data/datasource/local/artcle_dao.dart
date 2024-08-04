
import 'package:floor/floor.dart';
import 'package:news_app/feature/daily_news/data/models/article_model.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel articleModel);


  @Insert()
  Future<void> deleteArticle(ArticleModel articleModel);


  @Query("SELECT * FROM  article")
  Future<List<ArticleModel>> getArticles(ArticleModel articleModel);

}