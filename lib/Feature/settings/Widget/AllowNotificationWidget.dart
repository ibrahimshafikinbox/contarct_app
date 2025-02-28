import 'package:client_project/Core/Helper/cache_helepr.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AllowNotificationWidget extends StatefulWidget {
  const AllowNotificationWidget({super.key});

  @override
  _AllowNotificationWidgetState createState() =>
      _AllowNotificationWidgetState();
}

class _AllowNotificationWidgetState extends State<AllowNotificationWidget> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;

  void toggleDoNotDisturb(bool currentStatus) async {
    final currentUser = this.currentUser;
    if (currentUser != null) {
      try {
        await firestore.collection('users').doc(currentUser.uid).set({
          'allow_notification': !currentStatus,
        }, SetOptions(merge: true));
      } catch (error) {
        print("Error updating status: ${error.toString()}");
      }
    } else {
      print("User not logged in. Cannot update Do Not Disturb status.");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser == null) {
      return const Text("Please log in to set your Do Not Disturb status.");
    }

    return StreamBuilder<DocumentSnapshot>(
      stream: firestore
          .collection('users')
          .doc(currentUser?.uid ?? CachePrfHelper.getUid().toString())
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return const Text("Unable to fetch data. Please try again.");
        }

        var userDoc = snapshot.data!;
        bool isDNDActive = userDoc['allow_notification'] ?? false;

        return Switch(
          value: isDNDActive,
          onChanged: (value) {
            toggleDoNotDisturb(isDNDActive);
          },
          activeTrackColor: Color.fromARGB(255, 171, 215, 172),
          activeColor: Colors.green,
          inactiveThumbColor: Colors.grey[600],
          inactiveTrackColor: Colors.grey[300],
        );
      },
    );
  }
}

class NotificationsBuildContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPress;
  final Widget? child; // Add an optional child

  const NotificationsBuildContainer({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPress,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xffEEEDED),
          ),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon),
                    AppSizedBox.sizedW20,
                    Text(
                      text,
                      style: AppTextStyle.textStyleMediumBlack,
                    ),
                  ],
                ),
                if (child != null)
                  child!, // Display the child widget if provided
              ],
            ),
          ),
        ),
      ),
    );
  }
}
