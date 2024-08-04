import 'package:news_app/core/data_state.dart';
import 'package:news_app/feature/daily_news/domain/entities/article.dart';
import 'package:news_app/feature/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/feature/daily_news/domain/usecases/base_usecase.dart';

class GetArticleUseCase implements BaseUseCase<DataState<List<ArticleEntity>> , void> {


  final ArticleRepository  _articleRepository;


  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
}