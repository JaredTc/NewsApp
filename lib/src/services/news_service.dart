import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'f0a34faeb79d44ecb732f58a7b668b91';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.heart, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];


  Map<String, List<Article>> categoryArticles ={};
  NewsService() {
    getTopHeadlines();

    categories.forEach((element) {
      categoryArticles[element.name] = [];
    });
    getArticleByCategory(_selectedCategory );
  }

  get selectedCategory => _selectedCategory;

  set selectedCategory( valor)  {
    _selectedCategory = valor;
    getArticleByCategory( valor);
    notifyListeners();
  }


  List<Article>? get getArticleCategorysSelected 
  => categoryArticles[ selectedCategory];



  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newResponseFromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticleByCategory(String category)async{

    if( categoryArticles[category]!.isNotEmpty){
      return categoryArticles[category];
    }
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us&category=$category';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newResponseFromJson(resp.body);
    categoryArticles[category]!.addAll( newsResponse.articles);
    notifyListeners();
  }
}
