import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tab1_page.dart';
import 'package:newsapp/src/pages/tab2_page.dart';
import 'package:newsapp/src/theme/theme.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _NavegacionModel(),
      child:  Scaffold(
        body: _pages(),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }
}

class _bottomNavigationBar extends StatelessWidget {
  const _bottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegacionModel>(context);
    // final newsService = Provider.of<NewsService>(context);

    return BottomNavigationBar(
        selectedItemColor: mytheme.accentColor,
        currentIndex: navegationModel._pageActual,
        onTap: (i) => navegationModel.pageActual = i,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'For You'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'World'),
        ]);
  }
}

class _pages extends StatelessWidget {
  const _pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegationModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _pageActual = 0;

  final PageController _pageController = PageController();

  int get paginaActual => _pageActual;

  set pageActual(int valor) {
    _pageActual = valor;
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
