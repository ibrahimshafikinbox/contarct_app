import 'package:client_project/Login/cubit/login_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      // Firebase login with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess(userCredential.user!.uid));
    } catch (error) {
      emit(LoginError(error.toString()));
    }
  }

  // Future<void> registerUser({
  //   required String email,
  //   required String password,
  //   required String name,
  // }) async {
  //   emit(LoginLoading());
  //   try {
  //     // Firebase sign-up with email and password
  //     UserCredential userCredential =
  //         await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     // Save user data to Firestore collection 'users'
  //     await _firestore.collection('users').doc(userCredential.user!.uid).set({
  //       'uid': userCredential.user!.uid,
  //       'email': email,
  //       'name': name,
  //       'createdAt': DateTime.now(),
  //     });
  //     print(">>>>>>>>>cool , success");
  //     emit(LoginSuccess(userCredential.user!.uid));
  //   } catch (error) {
  //     emit(LoginError(error.toString()));
  //     print(error.toString());
  //   }
  // }
}
