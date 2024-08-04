


import 'package:get_it/get_it.dart';
import 'package:news_app/feature/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app/feature/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/feature/daily_news/domain/usecases/get_articles.dart';
import 'package:news_app/shared/dio_network_service.dart';
import 'package:news_app/shared/network_service.dart';

import '../feature/daily_news/data/datasource/remote/remote_datasource.dart';
import '../feature/daily_news/data/datasource/remote/remote_datasource_impl.dart';

final injector  =  GetIt.instance;

Future<void> setUp() async{
  injector.registerLazySingleton<NetworkService>(() => DioNetworkService());
}

// please check here
void provideDataSources(){
  injector.registerFactory<RemoteDataSource>(
          () => RemoteDataSourceImpl(injector.get<NetworkService>()));
}


void provideRepositories(){
  injector.registerFactory<ArticleRepository>(() =>
      ArticleRepositoryImpl(injector.get<RemoteDataSource>()));

}

void provideUseCases(){
  injector.registerFactory<GetArticleUseCase>(() => GetArticleUseCase(injector.get<ArticleRepository>()));
}




