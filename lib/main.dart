import 'package:flutter/material.dart';
import 'package:flutter_ngs/HomePage/HomePageViewModel.dart';
import 'package:provider/provider.dart';

import 'FavPage/FavPage.dart';
import 'HomePage/HomePage.dart';
import 'MemberPage/MemberPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  HomePageViewModel homePageViewModel = HomePageViewModel();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    //變數需告不能直接用widget
    pages.add(HomePage(widget.homePageViewModel));
    pages.add(FavPage());
    pages.add(MemberPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => widget.homePageViewModel),
      ],
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "首頁",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '收藏',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: '會員',
            ),
          ],
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
