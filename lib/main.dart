import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/src/pages/tabs_page.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     systemNavigationBarIconBrightness: Brightness.light,
    //     statusBarIconBrightness: Brightness.light));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        theme: mytheme,
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: TabsPage(),
      ),
    );
  }
}
