
import 'package:news_app/constants/app_constants.dart';
import 'package:news_app/feature/daily_news/data/datasource/remote/remote_datasource.dart';
import 'package:news_app/feature/daily_news/data/models/article_model.dart';
import 'package:news_app/shared/network_service.dart';

class RemoteDataSourceImpl extends RemoteDataSource {


  final NetworkService _networkService;

  RemoteDataSourceImpl(this._networkService);


  @override
  Future<List<ArticleModel>> getArticleList() async{

    Map<String, String> queryParams = {
      'country': 'us',
      'category': 'technology',
      'apiKey': AppConstants.apiKey,
    };
    try{
      var response = await _networkService.get("/top-headlines",queryParams:  queryParams);
        var data = response.data;

        List<dynamic> result = data["articles"].map<ArticleModel>((item) => ArticleModel.fromJson(item)).toList();
        return result as List<ArticleModel>;
    }
    catch(e){
      print(e);
      throw Error();
    }
  }
}