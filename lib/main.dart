import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/daily_news/domain/usecases/get_articles.dart';
import 'package:news_app/feature/daily_news/presentation/bloc/remote_article_bloc.dart';
import 'package:news_app/feature/daily_news/presentation/views/home_page.dart';

import 'config/theme/app_theme.dart';
import 'di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  provideDataSources();
  provideRepositories();
  provideUseCases();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: BlocProvider(
        create: (context) => RemoteArticleBloc(injector.get<GetArticleUseCase>())..add(const GetArticlesEvent()),
        child: const HomePage(),
      ),
    );
  }
}
