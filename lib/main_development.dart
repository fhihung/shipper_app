import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipper_app/app/bloc/app_bloc.dart';
import 'package:shipper_app/app/storage_service.dart';
import 'package:shipper_app/app/view/app.dart';
import 'package:shipper_app/home/bloc/home_bloc.dart';
import 'package:shipper_app/home/controllers/home_controller.dart';
import 'package:shipper_app/login/bloc/login_bloc.dart';
import 'package:shipper_app/login/controller/login_controller.dart';
import 'package:shipper_app/product/bloc/product_bloc.dart';
import 'package:shipper_app/product/controllers/product_controller.dart';
import 'package:shipper_app/sign_up/bloc/sign_up_bloc.dart';
import 'package:shipper_app/sign_up/controller/sign_up_controller.dart';

void main() {
  bootstrap(() {
    return Future.value(const App());
  });
}

Future<void> bootstrap(Future<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  final storageService = StorageService();
  final homeController = HomeController();
  final loginController = LoginController();
  final productController = ProductController();
  final signUpController = SignUpController();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(homeController, storageService),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(productController),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(loginController),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(signUpController),
        ),
        BlocProvider<AppBloc>(
          create: (context) => AppBloc(),
        ),
      ],
      child: await builder(),
    ),
  );
}
