import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipper_app/app/bloc/app_bloc.dart';
import 'package:shipper_app/app/bloc/app_event.dart';
import 'package:shipper_app/app/bloc/app_state.dart';
import 'package:shipper_app/app/common_bottom_navigation.dart';
import 'package:shipper_app/login/screens/login_screen.dart';
import 'package:shipper_app/utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        BlocProvider.of<AppBloc>(context).add(const AppInitiated());
        return MaterialApp(
            title: 'Food Delivery App',
            theme: TAppTheme.lightTheme,
            darkTheme: TAppTheme.darkTheme,
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            // supportedLocales: AppLocalizations.supportedLocales,
            home: state.token != null ? CommonBottomNavigation() : LoginScreen());
      },
    );
  }
}
