import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ngs/FavPage/FavPageViewModel.dart';
import 'package:flutter_ngs/StateResponse.dart';
import 'package:provider/provider.dart';

class FavPage extends StatefulWidget {
  FavPage({Key? key}) : super(key: key);

  FavPageViewModel favPageViewModel = FavPageViewModel();

  @override
  State<StatefulWidget> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  void initState() {
    super.initState();
    print('_FavPageState initState');
    widget.favPageViewModel.getApiData();
  }

  @override
  Widget build(BuildContext context) {
    print('_FavPageState build');
    return ChangeNotifierProvider.value(
      value: widget.favPageViewModel,
      child: Consumer<FavPageViewModel>(
        builder: (context, viewModel, child) {
          switch (viewModel.stateResponse.status) {
            case Status.LOADING:
              return Center(
                child: Text(
                    "FavPage loading data:${viewModel.stateResponse.data}"),
              );
            case Status.ERROR:
              return Center(
                child: Text("FavPage error:${viewModel.stateResponse.data}"),
              );
            case Status.SUCCESS:
              return Scaffold(
                body: Center(
                  child: Text(
                      "FavPage success data:${viewModel.stateResponse.data}"),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    //用context的方法拿到ViewModel,也有其他的這要看官方的文檔
                    print(context.read<FavPageViewModel>().stateResponse.data);
                  },
                  child: Icon(Icons.add),
                ),
              );
          }
        },
      ),
    );
  }
}
