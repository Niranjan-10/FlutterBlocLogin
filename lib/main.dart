import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_login/services/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocProvider(
            create: (context) {
              return AuthBloc();
            },
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.message),
                  ),
                ));
              } else if (state is AuthFail) {
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
                  child: Text("Sign up"),
                  onPressed: () {
                    context
                        .bloc<AuthBloc>()
                        .add(AuthSignUp(email: email, password: password));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
