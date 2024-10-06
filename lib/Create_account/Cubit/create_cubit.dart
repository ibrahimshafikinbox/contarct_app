import 'package:bloc/bloc.dart';
import 'package:client_project/Create_account/Cubit/create_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  }) async {
    emit(CreateAccountLoading());
    try {
      // Create a user in FirebaseAuth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create a new user document in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'firstName': firstName,
        'secondName': secondName,
        'email': email,
        'location': location,
        'businessName': businessName ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(CreateAccountSuccess());
    } catch (error) {
      emit(CreateAccountFailure(error.toString()));
    }
  }
}
