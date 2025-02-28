import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:client_project/Feature/Profile/cubit/profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  UserProfileCubit(this._auth, this._firestore) : super(UserProfileInitial());

  Future<void> fetchUserData() async {
    try {
      emit(UserProfileLoading());

      User? user = _auth.currentUser;
      if (user != null) {
        String uid = user.uid;

        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(uid).get();

        if (userDoc.exists) {
          final userData = {
            "firstName": userDoc['firstName'] ?? '',
            "email": userDoc['email'] ?? '',
            "address": userDoc['address'] ?? '',
            "gender": userDoc['gender'] ?? "",
            "phone_number": userDoc["phone_number"] ?? ""
          };
          emit(UserProfileLoaded(userData));
          print(userDoc["phone_number"]);
        } else {
          print("🚀🚀$uid");

          print("user data not found ");
          emit(UserProfileError("User data not found"));
        }
      } else {
        emit(UserProfileError("User not authenticated"));
        print("user not auth");
      }
    } catch (e) {
      emit(UserProfileError("Error fetching user data: $e"));
      print(e);
    }
  }

  Future<void> updateUserProfile({
    required String firstName,
    required String phone,
    required String address,
    required String gender,
  }) async {
    try {
      emit(EditUserProfileLoading());

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;

        await FirebaseFirestore.instance.collection('users').doc(uid).update({
          'firstName': firstName,
          "phone_number": phone,
          // 'email': email,
          'address': address,
          "gender": gender
        });

        emit(EditUserProfileSuccess());
      } else {
        emit(UserProfileError("User not authenticated"));
      }
    } catch (e) {
      emit(EditUserProfileError());
    }
  }
}

class UserProfile {
  final String firstName;
  final String secondName;
  final String email;
  final String address;
  final String businessName;
  final bool isLawyer;
  final String uid;
  final DateTime createdAt;

  UserProfile({
    required this.firstName,
    required this.secondName,
    required this.email,
    required this.address,
    required this.businessName,
    required this.isLawyer,
    required this.uid,
    required this.createdAt,
  });

  // Factory method to create a UserProfile instance from Firestore data
  factory UserProfile.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return UserProfile(
      firstName: data['firstName'] ?? '',
      secondName: data['secondName'] ?? '',
      email: data['email'] ?? '',
      address: data['address'] ?? '',
      businessName: data['businessName'] ?? '',
      isLawyer: data['isLawyer'] ?? false,
      uid: data['uid'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  // Optional: Convert the model to a map (useful for saving to Firestore)
  Map<String, dynamic> toFirestore() {
    return {
      'firstName': firstName,
      'secondName': secondName,
      'email': email,
      'address': address,
      'businessName': businessName,
      'isLawyer': isLawyer,
      'uid': uid,
      'createdAt': createdAt,
    };
  }
}
