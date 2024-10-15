import 'package:bloc/bloc.dart';
import 'package:client_project/Feature/Contracts/cubit/contarct_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ContractCubit extends Cubit<ContractState> {
  ContractCubit() : super(ContractInitial());

  Future<void> submitContractDetails({
    required String contractName,
    required String otherParties,
    required String concerns,
    required String goals,
    required String questions,
    required String additionalInfo,
    required String contractUrl,
    String? contractType,
  }) async {
    emit(ContractLoading());

    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection('contracts').add({
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
      });
      emit(ContractSuccess());
    } catch (e) {
      emit(ContractFailure(error: e.toString()));
    }
  }
}
