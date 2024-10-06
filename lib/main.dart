import 'package:client_project/Create_account/Cubit/create_cubit.dart';
import 'package:client_project/Create_account/View/create_acc_view.dart';
import 'package:client_project/Forgot_Password/view/forgot_view.dart';
import 'package:client_project/Login/View/login_view.dart';
import 'package:client_project/firebase_options.dart';
import 'package:client_project/pages/Privacy_1.dart';
import 'package:client_project/pages/ScreenSplash_3.dart';
import 'package:client_project/pages/done_page.dart';
import 'package:client_project/pages/privacy_2.dart';
import 'package:client_project/pages/privacy_3.dart';
import 'package:client_project/pages/privacy_4.dart';
import 'package:client_project/pages/privacy_5.dart';
import 'package:client_project/pages/understand_contaract_2.dart';
import 'package:client_project/resources/theme/app_theme.dart';
import 'package:client_project/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        theme: lightTheme(),
      ),
    );
  }
}
