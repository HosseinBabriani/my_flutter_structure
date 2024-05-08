import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_structure/presentation/screens/dashboard/cubit/dashboard_cubit.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit,DashboardState>(
      listener: (context,state){},
      builder: (context,state){
        return const Scaffold(
          body: Center(
            child: Text("Dashboard Screen"),
          ),
        );
      },
    );
  }
}