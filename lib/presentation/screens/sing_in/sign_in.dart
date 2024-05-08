import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_structure/presentation/screens/sing_in/cubit/sign_in_cubit.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit,SignInState>(
      listener: (context,state){},
      builder: (context,state){
        return const Scaffold(
          body: Center(
            child: Text("Sign In Screen"),
          ),
        );
      },
    );
  }
}
