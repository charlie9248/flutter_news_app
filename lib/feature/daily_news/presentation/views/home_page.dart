import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/daily_news/domain/entities/article.dart';
import 'package:news_app/feature/daily_news/presentation/bloc/remote_article_bloc.dart';
import 'package:news_app/feature/daily_news/presentation/views/article_details.dart';

import '../widgets/articles_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Daily News" , style: TextStyle(color: Colors.black),), ),
      body: BlocBuilder<RemoteArticleBloc,RemoteArticleState> (
        builder: (_,state) {
          if (state is RemoteArticlesLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is RemoteArticleError) {
            return const Center(child: Icon(Icons.refresh));
          }
          if (state is RemoteArticlesSuccess) {
            return ListView.builder(
              itemBuilder: (context,index){
                return ArticleWidget(
                  article: state.articles![index] ,
                  onArticlePressed: (article) => _onArticlePressed(context,article),
                );
              },
              itemCount: state.articles!.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  ArticleDetailsView(article: article)),
    );

  }
}



