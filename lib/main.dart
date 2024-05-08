import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:my_flutter_structure/config/app_theme.dart';
import 'package:my_flutter_structure/presentation/authentication/authentication_cubit.dart';

import 'config/app_bloc_observer.dart';
import 'config/register_route_data.dart';
import 'config/register_routes.dart';

void main() async {
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US',
    supportedLocales: ['en_US', 'fa'],
  );
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocDelegate();
  runApp(BlocProvider<AuthenticationCubit>(
    create: (context) => AuthenticationCubit()..appStarted(),
    child:  LocalizedApp(
      delegate,
      const MyFlutterStructure(),
    ),
  ));
}

class MyFlutterStructure extends StatefulWidget {
  const MyFlutterStructure({Key? key}) : super(key: key);

  @override
  _MyFlutterStructureState createState() => _MyFlutterStructureState();
}

class _MyFlutterStructureState extends State<MyFlutterStructure> {
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    var register = RegisterRouteData();
    var registerRoutes = RegisterRoutes();
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate,
        ],
        onGenerateRoute: register.register,
        supportedLocales: localizationDelegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: localizationDelegate.currentLocale,
        title: translate('app_bar.main.title'),
        theme: AppTheme.of(context),
        routes: registerRoutes.register(),
      ),
    );
  }
}
