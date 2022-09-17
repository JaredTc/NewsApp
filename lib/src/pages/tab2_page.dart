import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/theme.dart';
import 'package:newsapp/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
        body: Column(
      children: [
        _ListCategories(),
        Expanded(child: 
        ListNews(newsService.getArticleCategorysSelected!))
      ],
    ));
  }
}

class _ListCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 105,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          var name2 = categories[index].name;
          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                _CategoryButtom(
                  category: categories[index],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('${name2[0].toUpperCase()}${name2.substring(1)}')
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButtom extends StatelessWidget {
  final Category category;

  const _CategoryButtom({required this.category});
  @override
  Widget build(BuildContext context) {
     final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        // print(category.name);
        final categories = Provider.of<NewsService>(context, listen: false);
        categories.selectedCategory = category.name;
      },
      child: Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.symmetric( horizontal: 10),
          decoration:
              const BoxDecoration(
                shape: BoxShape.circle, 
                // color: Colors.white
                ),
          child: Icon(category.icon, 
          color: (newsService.selectedCategory == category.name)? mytheme.accentColor
          : Colors.white),
          ),
    );
  }
}
