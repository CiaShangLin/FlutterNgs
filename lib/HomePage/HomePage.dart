import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ngs/HomePage/HomePageViewModel.dart';
import 'package:flutter_ngs/StateResponse.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage(this.homePageViewModel, {Key? key}) : super(key: key);

  HomePageViewModel homePageViewModel;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print('_HomePageState initState');
    widget.homePageViewModel.getApiData();
  }

  @override
  Widget build(BuildContext context) {
    print('_HomePageState build');
    return Consumer<HomePageViewModel>(
      builder: (context, viewModel, child) {
        switch (viewModel.stateResponse.status) {
          case Status.LOADING:
            return Center(
              child:
                  Text("HomePage loading data:${viewModel.stateResponse.data}"),
            );
          case Status.ERROR:
            return Center(
              child: Text("HomePage error:${viewModel.stateResponse.data}"),
            );
          case Status.SUCCESS:
            return Scaffold(
              body: Center(
                child: Text(
                    "HomePage success data:${viewModel.stateResponse.data}"),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  //用context的方法拿到ViewModel,也有其他的這要看官方的文檔
                  print(context.read<HomePageViewModel>().stateResponse.data);
                },
                child: Icon(Icons.add),
              ),
            );
        }
      },
    );
  }
}
