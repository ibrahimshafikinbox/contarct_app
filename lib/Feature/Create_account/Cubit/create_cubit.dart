import 'package:bloc/bloc.dart';
import 'package:client_project/Feature/Create_account/Cubit/create_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CreateAccountCubit() : super(CreateAccountInitial());

  // Future<void> createAccount({
  //   required String firstName,
  //   required String secondName,
  //   required String email,
  //   required String password,
  //   required String location,
  //   String? businessName,
  // }) async {
  //   emit(CreateAccountLoading());
  //   try {
  //     // Create a user in FirebaseAuth
  //     UserCredential userCredential =
  //         await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     // Create a new user document in Firestore
  //     await _firestore.collection('users').doc(userCredential.user!.uid).set({
  //       'uid': userCredential.user!.uid,
  //       'firstName': firstName,
  //       'secondName': secondName,
  //       'email': email,
  //       'address': location,
  //       'businessName': businessName ?? '',
  //       'createdAt': FieldValue.serverTimestamp(),
  //       "name": firstName,
  //       "phoneNumber": "01001683950",
  //       "dateOfBirth": " 2006",
  //       "gender": "male",
  //     });

  //     emit(CreateAccountSuccess());
  //   } catch (error) {
  //     emit(CreateAccountFailure(error.toString()));
  //   }
  // }

  Future<void> createAccount({
    required String firstName,
    required String secondName,
    required String email,
    required String password,
    required String location,
    String? businessName,
    required bool isLawyer, // إضافة معلمة لتحديد إذا كان المستخدم محامي
  }) async {
    emit(CreateAccountLoading());
    try {
      // إنشاء مستخدم جديد في FirebaseAuth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // إنشاء وثيقة مستخدم جديدة في Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'firstName': firstName,
        'secondName': secondName,
        'email': email,
        'address': location,
        'businessName': businessName ?? '',
        'isLawyer': isLawyer, // تحديد إذا كان المستخدم محامي
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(CreateAccountSuccess());
    } catch (error) {
      emit(CreateAccountFailure(error.toString()));
    }
  }
//   Future<void> createLawyerAccount({
//   required String firstName,
//   required String secondName,
//   required String email,
//   required String password,
//   required String location,
//   String? businessName,
// }) async {
//   emit(CreateAccountLoading());
//   try {
//     // إنشاء حساب مستخدم جديد في FirebaseAuth
//     UserCredential userCredential =
//         await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );

//     // إنشاء مستند جديد في Firestore كـ محامي
//     await _firestore.collection('users').doc(userCredential.user!.uid).set({
//       'uid': userCredential.user!.uid,
//       'firstName': firstName,
//       'secondName': secondName,
//       'email': email,
//       'address': location,
//       'businessName': businessName ?? '',
//       'role': 'lawyer', // تعيين الدور كـ محامي
//       'createdAt': FieldValue.serverTimestamp(),
//     });

//     emit(CreateAccountSuccess());
//   } catch (error) {
//     emit(CreateAccountFailure(error.toString()));
//   }
// }
}
