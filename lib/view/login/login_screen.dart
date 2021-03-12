import 'package:firebase_login/bloc/home/home_bloc.dart';
import 'package:firebase_login/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_login/view/home/home_screen.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocProvider(
            create: (context) {
              return LoginBloc(context.bloc<HomeBloc>());
            },
            child: LogInForm(),
          ),
        ),
    );
  }
}

class LogInForm extends StatefulWidget {
  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  String email,password;


  @override
  Widget build(BuildContext context) {
    return Container(
     
        padding: EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSucess) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.message),
                  ),
                ));

                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(uuid: state.user.uid.toString(),)));
              } else if (state is LoginFail) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.message),
                  ),
                ));
              }
            },
            builder: (context, state) => Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(hintText: "Email"),
                ),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(hintText: "Password"),
                ),
                RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    context
                        .bloc<LoginBloc>()
                        .add(Login(email: email, password: password));
                  },
                )
              ],
            ),
          ),
        ));
  }
}



































