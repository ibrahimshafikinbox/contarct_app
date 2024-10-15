import 'package:client_project/Feature/Contracts/cubit/contract_cubit.dart';
import 'package:client_project/Feature/Contracts/view/contract_details.dart';
import 'package:client_project/Feature/Create_account/View/create_acc_view.dart';
import 'package:client_project/Feature/Profile/cubit/profilr_cubit.dart';
import 'package:client_project/Feature/resources/theme/app_theme.dart';
import 'package:client_project/Feature/splash/splash.dart';
import 'package:client_project/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ContractCubit()),
        BlocProvider(
            create: (_) => UserProfileCubit(
                FirebaseAuth.instance, FirebaseFirestore.instance)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CreateAccountView(),
        theme: lightTheme(),
      ),
    );
  }
}
