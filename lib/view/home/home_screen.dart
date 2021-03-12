import 'package:firebase_login/bloc/home/home_bloc.dart';
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
  String uuid = "dummy";

  @override
  void initState() {
    uuid = widget.uuid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeStarted) {
                
                uuid = "No data";

              
              } else if (state is HomeSuccess) {
                uuid = state.user.uid;
              }
          },
          builder: (context, state) {
            return Center(
              child: Text(uuid ?? ""),
            );
          },
        ),
      ),
    );
  }
}
