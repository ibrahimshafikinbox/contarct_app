import 'package:client_project/Feature/Create_account/Cubit/create_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CreateAccountCubit() : super(CreateAccountInitial());

  Future<void> createAccount({
    required String firstName,
    required String secondName,
    required String email,
    required String password,
    required String location,
    String? businessName,
    required bool isLawyer,
  }) async {
    emit(CreateAccountLoading());
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'firstName': firstName,
        'secondName': secondName,
        'email': email,
        'address': location,
        'businessName': businessName ?? '',
        'isLawyer': isLawyer,
        'createdAt': FieldValue.serverTimestamp(),
        "allow_notification": false,
        "gender": "",
        "phone_number": "",
      });

      emit(CreateAccountSuccess());
    } catch (error) {
      emit(CreateAccountFailure(error.toString()));
    }
  }
}
