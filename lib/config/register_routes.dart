import 'package:flutter/material.dart';
import 'package:my_flutter_structure/config/app_routes.dart';
import 'package:my_flutter_structure/presentation/authentication/authentication_cubit.dart';
import 'package:my_flutter_structure/presentation/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:my_flutter_structure/presentation/screens/dashboard/dashboard.dart';
import 'package:my_flutter_structure/presentation/screens/sign_up/cubit/sign_up_cubit.dart';
import 'package:my_flutter_structure/presentation/screens/sign_up/sign_up.dart';
import 'package:my_flutter_structure/presentation/screens/sing_in/cubit/sign_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_structure/presentation/screens/sing_in/sign_in.dart';
import 'package:my_flutter_structure/presentation/screens/splash/splash.dart';

class RegisterRoutes{
  Map<String, WidgetBuilder> register() {
    return <String, WidgetBuilder>{
      AppRoutes.splash: (context) => const SplashScreen(),
      AppRoutes.signIn: (context) => _buildSignInBloc(),
      AppRoutes.signUp: (context) => _buildSignUpBloc(),
      AppRoutes.authPath: (context) =>
          BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return _buildDashboardCubit();
                } else {
                  return _buildSignInBloc();
                }
              }),
    };
  }
  BlocProvider<SignInCubit> _buildSignInBloc() {
    return BlocProvider<SignInCubit>(
      create: (context) => SignInCubit(
        authenticationCubit: BlocProvider.of<AuthenticationCubit>(context),
      ),
      child: const SignInScreen(),
    );
  }
  BlocProvider<DashboardCubit> _buildDashboardCubit() {
    return BlocProvider<DashboardCubit>(
      create: (context) => DashboardCubit(),
      child: const DashboardScreen(),
    );
  }
  BlocProvider<SignUpCubit> _buildSignUpBloc() {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit(),
      child: const SignUpScreen(),
    );
  }
}