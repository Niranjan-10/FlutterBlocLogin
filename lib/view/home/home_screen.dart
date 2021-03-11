import 'package:flutter/material.dart';
import 'package:firebase_login/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatefulWidget {

  final String uuid;

  HomeScreen({this.uuid});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String uuid="dummy";

  @override
  void initState() {
    var state = context.bloc<AuthBloc>().state;
    print(state.props);
    print(state.toString());
    if(state is AuthSuccess){
      uuid = state?.user?.uid;
    }

    uuid = widget.uuid;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(uuid??""),
        ),
      ),
    );
  }
}