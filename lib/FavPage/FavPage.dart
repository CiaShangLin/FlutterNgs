import 'package:flutter/cupertino.dart';

class FavPage extends StatefulWidget {
  FavPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>_FavPageState();
}

class _FavPageState extends State<FavPage> {

  @override
  void initState() {
    super.initState();
    print('_FavPageState initState');
  }

  @override
  Widget build(BuildContext context) {
    print('_FavPageState build');
    return Center(
      child: Text("FavPage"),
    );
  }
}
