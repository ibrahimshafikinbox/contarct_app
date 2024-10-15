// // ignore: depend_on_referenced_packages
// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:client_project/Feature/Profile/cubit/profile_state.dart';

// class UserProfileCubit extends Cubit<UserProfileState> {
//   final FirebaseAuth _auth;
//   final FirebaseFirestore _firestore;

//   UserProfileCubit(this._auth, this._firestore) : super(UserProfileInitial());

//   Future<void> fetchUserData() async {
//     try {
//       emit(UserProfileLoading());

//       // Get the current user's UID
//       User? user = _auth.currentUser;
//       if (user != null) {
//         String uid = user.uid;

//         // Fetch the user document from Firestore
//         DocumentSnapshot userDoc =
//             await _firestore.collection('users').doc(uid).get();

//         // Extract data from the document
//         if (userDoc.exists) {
//           final userData = {
//             "name": userDoc['firstName'],
//             "email": userDoc['email'],
//             // "dateOfBirth": userDoc['dateOfBirth'],
//             // "gender": userDoc['gender'],
//             "address": userDoc['address'],
//           };

//           emit(UserProfileLoaded(userData));
//           print(userData);
//         } else {
//           emit(UserProfileError("User data not found"));
//         }
//       } else {
//         emit(UserProfileError("User not authenticated"));
//       }
//     } catch (e) {
//       emit(UserProfileError("Error fetching user data: $e"));
//       print(e);
//     }
//   }
// }
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

      // Get the current user's UID
      User? user = _auth.currentUser;
      if (user != null) {
        String uid = user.uid;

        // Fetch the user document from Firestore
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(uid).get();

        // Extract data and convert it to UserProfile model
        //       if (userDoc.exists) {
        //         UserProfile userProfile = UserProfile.fromFirestore(userDoc);

        //         // Emit the loaded state with user profile data
        // emit(UserProfileLoaded(userData)); // تمرير بيانات المستخدم هنا
        //         print(userProfile);
        if (userDoc.exists) {
          final userData = {
            "firstName": userDoc['firstName'] ?? '',
            "email": userDoc['email'] ?? '',
            "address": userDoc['address'] ?? '',
            // "phoneNumber": userDoc['phoneNumber'] ??
            //     '',
            // "dateOfBirth": userDoc['dateOfBirth'] ?? '',
            // "gender": userDoc['gender'] ?? '',
          };
          emit(UserProfileLoaded(userData)); // تمرير بيانات المستخدم هنا
        } else {
          emit(UserProfileError("User data not found"));
        }
      } else {
        emit(UserProfileError("User not authenticated"));
      }
    } catch (e) {
      emit(UserProfileError("Error fetching user data: $e"));
      print(e);
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
