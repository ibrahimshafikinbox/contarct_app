import 'package:client_project/Core/Helper/FirebaseMessagingService.dart';
import 'package:client_project/Core/Helper/cache_helepr.dart';
import 'package:client_project/Core/constants/constants.dart';
import 'package:client_project/Feature/Contracts/cubit/contract_cubit.dart';
import 'package:client_project/Feature/Contracts/view/contract_home.dart';
import 'package:client_project/Feature/Lawer_section/view/lawyer_view.dart';
import 'package:client_project/Feature/Login/cubit/login_cubit.dart';
import 'package:client_project/Feature/Profile/cubit/profile_cubit.dart';
import 'package:client_project/Feature/online_payment/cubit/payment_cubit.dart';
import 'package:client_project/Feature/resources/theme/app_theme.dart';
import 'package:client_project/Feature/splash/splash_view.dart';
import 'package:client_project/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CachePrfHelper.init();

  String? uid = CachePrfHelper.getUid();
  print("🚀 App open and that is UID: $uid");
  Stripe.publishableKey = AppConstants.stipe_publishable;
  // "pk_test_51QrfjURburLuZYWY2cjANIyWsWS9esUkBZPkgr9PZDABUce25Pb60rhmC8Si9u2EqGxhrfYPaq6kDJ2NI6t3ecsh00BaNRUqOj";

  Stripe.instance.applySettings();

  MessagingHelper().initialize();

  runApp(MyApp(uid: uid));
}

class MyApp extends StatelessWidget {
  final String? uid;
  const MyApp({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ContractCubit()),
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => PaymentCubit()),
        BlocProvider(
          create: (_) => UserProfileCubit(
            FirebaseAuth.instance,
            FirebaseFirestore.instance,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: uid == null ? const SplashView() : RoleBasedScreen(uid: uid),
        theme: lightTheme(),
      ),
    );
  }
}

class RoleBasedScreen extends StatefulWidget {
  final String? uid;
  const RoleBasedScreen({super.key, required this.uid});

  @override
  // ignore: library_private_types_in_public_api
  _RoleBasedScreenState createState() => _RoleBasedScreenState();
}

class _RoleBasedScreenState extends State<RoleBasedScreen> {
  bool? isLawyer;

  @override
  void initState() {
    super.initState();
    _checkUserRole();
  }

  Future<void> _checkUserRole() async {
    if (widget.uid != null) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(widget.uid)
            .get();

        if (userDoc.exists) {
          Map<String, dynamic> userData =
              userDoc.data() as Map<String, dynamic>;
          setState(() {
            isLawyer = userData['isLawyer'] ?? false;
          });
        } else {
          print("User document not found.");
        }
      } catch (e) {
        print("Error fetching user role: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLawyer == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return isLawyer! ? const LawyerView() : ContractHomeView();
    }
  }
}
