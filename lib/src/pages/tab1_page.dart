import 'package:flutter/material.dart';
import 'package:newsapp/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

import '../services/news_service.dart';

class Tab1Page extends StatefulWidget {
  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context).headlines;
    // newsService.headlines;
    //  ListNews(newsService),
    return Scaffold(
      body: (newsService.isEmpty)
            ? const Center(child: CircularProgressIndicator(color: Colors.red,),)
              : ListNews(newsService),
    );
  }
  
  @override
  bool get wantKeepAlive =>true;
}
