import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'lawyer_state.dart';

class LawyerCubit extends Cubit<LawyerState> {
  LawyerCubit() : super(LawyerInitial());

  Future<void> fetchLawyerData() async {
    emit(LawyerLoading());
    try {
      // Fetch lawyer data
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) throw 'User not logged in';

      DocumentSnapshot lawyerDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!lawyerDoc.exists) throw 'No lawyer data found';

      Map<String, dynamic> lawyerData =
          lawyerDoc.data() as Map<String, dynamic>;

      // Fetch contracts under review
      QuerySnapshot contractsSnapshot = await FirebaseFirestore.instance
          .collection('contracts')
          .where('status', isEqualTo: 'Under Review')
          .get();

      List<Map<String, dynamic>> contracts = contractsSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      emit(LawyerLoaded(lawyerData: lawyerData, contracts: contracts));
    } catch (e) {
      emit(LawyerError(e.toString()));
    }
  }
}
