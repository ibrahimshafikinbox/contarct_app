import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:client_project/Core/Helper/FirebaseMessagingService.dart';
import 'package:client_project/Feature/Contracts/cubit/contarct_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ContractCubit extends Cubit<ContractState> {
  ContractCubit() : super(ContractInitial());
  Future<void> submitContractWithInvoice({
    required String contractName,
    required String otherParties,
    required String concerns,
    required String goals,
    required String questions,
    required String additionalInfo,
    required String contractUrl,
    required int pageNumber,
    required int amount,
    String? contractType,
  }) async {
    emit(ContractLoading());

    try {
      // Get the device token correctly
      MessagingHelper messagingService = MessagingHelper();
      String? deviceToken =
          await messagingService.logToken(); // ✅ Await the function

      if (deviceToken == null) {
        emit(ContractFailure(error: "Failed to retrieve device token."));
        return;
      }

      String userId = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the contracts collection
      DocumentReference contractRef =
          FirebaseFirestore.instance.collection('contracts').doc();

      // Reference to the users collection
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      // Generate a unique invoice ID
      String invoiceId =
          FirebaseFirestore.instance.collection('contracts').doc().id;

      // Save the contract details
      await contractRef.set({
        "device_token": deviceToken, // ✅ Now this is a String, not Future<void>
        'contract_id': contractRef.id,
        'contract_name': contractName,
        'other_parties': otherParties,
        'concerns': concerns,
        'goals': goals,
        'questions': questions,
        'additional_info': additionalInfo,
        'contract_url': contractUrl,
        'status': 'Under Review',
        'created_at': Timestamp.now(),
        'type_of_pdf': contractType,
        'user_id': userId,
        'invoice': {
          "page_count": pageNumber,
          'invoice_id': invoiceId,
          'amount': amount,
          'due_date': Timestamp.now(),
        },
      });

      // Save the device token for the customer
      await userRef.update({
        'deviceTokens': FieldValue.arrayUnion([deviceToken]),
      });

      emit(ContractSuccess());
      print("✅ contract created successfully");
    } catch (e) {
      emit(ContractFailure(error: e.toString()));
    }
  }

  // Future<void> submitContractWithInvoice({
  //   required String contractName,
  //   required String otherParties,
  //   required String concerns,
  //   required String goals,
  //   required String questions,
  //   required String additionalInfo,
  //   required String contractUrl,
  //   required int pageNumber,
  //   required int amount,
  //   String? contractType,
  // }) async {
  //   emit(ContractLoading());

  //   try {
  //     // Get the device token
  //     MessagingHelper messagingService = MessagingHelper();
  //     Future<void> deviceToken = messagingService.logToken();

  //     if (deviceToken == null) {
  //       emit(ContractFailure(error: "Failed to retrieve device token."));
  //       return;
  //     }

  //     String userId = FirebaseAuth.instance.currentUser!.uid;

  //     // Reference to the contracts collection
  //     DocumentReference contractRef =
  //         FirebaseFirestore.instance.collection('contracts').doc();

  //     // Reference to the users collection (or customers collection)
  //     DocumentReference userRef =
  //         FirebaseFirestore.instance.collection('users').doc(userId);

  //     // Generate a unique invoice ID
  //     String invoiceId =
  //         FirebaseFirestore.instance.collection('contracts').doc().id;

  //     // Save the contract details
  //     await contractRef.set({
  //       "device_token": deviceToken,
  //       'contract_id': contractRef.id,
  //       'contract_name': contractName,
  //       'other_parties': otherParties,
  //       'concerns': concerns,
  //       'goals': goals,
  //       'questions': questions,
  //       'additional_info': additionalInfo,
  //       'contract_url': contractUrl,
  //       'status': 'Under Review',
  //       'created_at': Timestamp.now(),
  //       'type_of_pdf': contractType,
  //       'user_id': userId,
  //       'invoice': {
  //         "page_count": pageNumber,
  //         'invoice_id': invoiceId,
  //         'amount': amount,
  //         'due_date': Timestamp.now(),
  //       },
  //     });

  //     // Save the device token for the customer
  //     await userRef.update({
  //       'deviceTokens': FieldValue.arrayUnion(
  //           [deviceToken]), // Add the device token to the array
  //     });

  //     emit(ContractSuccess());
  //     print("✅ contract crated success");
  //   } catch (e) {
  //     emit(ContractFailure(error: e.toString()));
  //   }
  // }

  void getReviewdOeder() async {
    emit(GetReviewdContractLoading());

    try {
      CollectionReference contracts =
          FirebaseFirestore.instance.collection('contracts');
      String userId = FirebaseAuth.instance.currentUser!.uid;

      QuerySnapshot querySnapshot = await contracts
          .where('user_id', isEqualTo: userId)
          .where('status', isEqualTo: "Under Review")
          .get();

      if (querySnapshot.docs.isEmpty) {
        print(
            '🚀🚀No contracts found for this user with the status: review order ');
        emit(GetReviewedContractSuccess(contracts: []));
        return;
      }

      List<Map<String, dynamic>> contractList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      emit(GetReviewedContractSuccess(contracts: contractList));
      print("🚀🚀🚀$contractList");
    } catch (e) {
      emit(GetReviewedContractFailure(error: e.toString()));
    }
  }
  // get finished order

  void getFinishedOrder() async {
    emit(GetFinisedContractLoading()); // Emit loading state first

    try {
      CollectionReference contracts =
          FirebaseFirestore.instance.collection('contracts');
      String userId = FirebaseAuth.instance.currentUser!.uid;

      QuerySnapshot querySnapshot = await contracts
          .where('user_id', isEqualTo: userId)
          .where('status', isEqualTo: "finished")
          .get();

      if (querySnapshot.docs.isEmpty) {
        print('No contracts found for this user with the status: finished ');
        emit(GetFinisedContractSuccess(contracts: [])); // Emit empty list
        return;
      }

      List<Map<String, dynamic>> contractList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      print("🚀🚀🚀FInished contarct ${contractList}");

      emit(GetFinisedContractSuccess(
          contracts: contractList)); // Emit contract list on success
    } catch (e) {
      emit(
          GetFinisedContractFailure(error: e.toString())); // Emit failure state
    }
  }

  Future<void> uploadFileAndUpdateContract({
    required String contractId,
  }) async {
    emit(ContractLoading());

    try {
      // Pick file using FilePicker
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.any);

      if (result == null) {
        emit(ContractFailure(error: "No file selected"));
        return;
      }

      // Get the selected file
      String? filePath = result.files.single.path;
      if (filePath == null) {
        emit(ContractFailure(error: "File path is null"));
        return;
      }

      // Get current user ID
      String userId = FirebaseAuth.instance.currentUser!.uid;

      // Reference to Firebase Storage (you can store in a folder like 'contracts/{userId}/')
      final storageRef = FirebaseStorage.instance
          .ref()
          .child("contracts/$userId/${result.files.single.name}");

      // Upload the file to Firebase Storage
      final uploadTask = storageRef.putFile(File(filePath));

      // Wait for the upload to complete
      final snapshot = await uploadTask.whenComplete(() {});

      // Get the file's URL after upload
      final downloadUrl = await snapshot.ref.getDownloadURL();

      // Reference to the specific contract document in Firestore
      DocumentReference contractRef =
          FirebaseFirestore.instance.collection('contracts').doc(contractId);

      // Update the 'contract_url' field in Firestore
      await contractRef.update({
        'contract_url': downloadUrl,
        "status": "finished",
        'updated_at':
            Timestamp.now(), // Optional: update the last modified timestamp
      });

      emit(ContractSuccess());
    } catch (e) {
      emit(ContractFailure(error: e.toString()));
    }
  }
}
