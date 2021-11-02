import 'package:flutter/cupertino.dart';

class MemberPage extends StatefulWidget {
  MemberPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>_MemberPageState();
}

class _MemberPageState extends State<MemberPage> {

  @override
  void initState() {
    super.initState();
    print('_MemberPageState initState');
  }

  @override
  Widget build(BuildContext context) {
    print('_MemberPageState build');
    return Center(
      child: Text("MemberPage"),
    );
  }
}
