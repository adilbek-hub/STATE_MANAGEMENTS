import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/news_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('News App')),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return const CircularProgressIndicator();
            } else if (state is NewsSuccess) {
              return ListView.builder(
                  itemCount: state.topNews.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    final articles = state.topNews.articles[index];
                    return Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CachedNetworkImage(
                                  imageUrl: articles.urlToImage ?? '',
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Text(articles.description ?? 'NULL'))
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else if (state is NewsError) {
              return Text(state.errorText);
            } else {
              return const Text('UnknownERROR');
            }
          },
        ));
  }
}
