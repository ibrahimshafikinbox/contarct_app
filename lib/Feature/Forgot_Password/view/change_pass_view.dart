// import 'package:client_project/Feature/Login/widget/app_button.dart';
// import 'package:client_project/Feature/Login/widget/default_form_filed.dart';
// import 'package:client_project/Feature/resources/colors/colors.dart';
// import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
// import 'package:client_project/Feature/resources/styles/app_text_style.dart';
// import 'package:flutter/material.dart';

// class ChangePasswordView extends StatefulWidget {
//   const ChangePasswordView({super.key});

//   @override
//   State<ChangePasswordView> createState() => _ChangePasswordViewState();
// }

// class _ChangePasswordViewState extends State<ChangePasswordView> {
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmnameController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AppSizedBox.sizedH50,
//             Center(
//               child: Text(
//                 "Forgot Your Password ",
//                 style: AppTextStyle.textStyleBoldBlack,
//               ),
//             ),
//             AppSizedBox.sizedH50,
//             Text('Enter your new password  '),
//             AppSizedBox.sizedH10,
//             DefaultFormField(
//               controller: passwordController,
//               type: TextInputType.emailAddress,
//               hint: 'password',
//               onValidate: (String? value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your password';
//                 } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                   return 'Please enter passsword';
//                 }
//                 return null;
//               },
//               label: 'password',
//               maxlines: 1,
//             ),
//             AppSizedBox.sizedH10,
//             DefaultFormField(
//               controller: confirmnameController,
//               type: TextInputType.emailAddress,
//               hint: 'Confirm password',
//               onValidate: (String? value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your password';
//                 } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                   return 'Please enter passsword';
//                 }
//                 return null;
//               },
//               label: 'Confirm password',
//               maxlines: 1,
//             ),
//             AppSizedBox.sizedH50,
//             DefaultButton(
//                 function: () {},
//                 text: "Change your password now",
//                 textColor: AppColors.white,
//                 bottonColor: AppColors.green),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ChangePasswordScreen extends StatefulWidget {
//   @override
//   _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController _oldPasswordController = TextEditingController();
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _otpController = TextEditingController();

//   String? _generatedOtp;

//   Future<void> sendOtp() async {
//     final user = _auth.currentUser;
//     if (user == null) {
//       print("No user is signed in.");
//       return;
//     }

//     // Generate a simple OTP (for demonstration)
//     _generatedOtp = (100000 +
//             (999999 - 100000) *
//                 (DateTime.now().millisecondsSinceEpoch % 1000000) /
//                 1000000)
//         .toInt()
//         .toString();

//     // Here you should send the OTP to the user's email
//     // For demonstration, we'll print it to the console
//     print("Sending OTP: $_generatedOtp to ${user.email}");

//     // You can use any email sending service to send the OTP to the user's email.
//   }

//   Future<void> changePassword() async {
//     final user = _auth.currentUser;

//     if (user == null) {
//       print("No user is signed in.");
//       return;
//     }

//     // Reauthenticate the user with the old password
//     try {
//       final credential = EmailAuthProvider.credential(
//         email: user.email!,
//         password: _oldPasswordController.text.trim(),
//       );

//       await user.reauthenticateWithCredential(credential);

//       // Validate the OTP
//       if (_otpController.text.trim() == _generatedOtp) {
//         // If OTP is valid, update the password
//         await user.updatePassword(_newPasswordController.text.trim());
//         print("Password changed successfully!");

//         // Clear input fields
//         _oldPasswordController.clear();
//         _newPasswordController.clear();
//         _otpController.clear();
//       } else {
//         print("Invalid OTP");
//       }
//     } catch (e) {
//       print("Error: $e");
//       // Handle different types of errors (e.g., wrong password, user not found)
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Change Password')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _oldPasswordController,
//               decoration: InputDecoration(labelText: 'Old Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _newPasswordController,
//               decoration: InputDecoration(labelText: 'New Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _otpController,
//               decoration: InputDecoration(labelText: 'Enter OTP'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: sendOtp,
//               child: Text('Send OTP'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: changePassword,
//               child: Text('Change Password'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }













// import 'package:client_project/Feature/resources/styles/app_text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ForgotPasswordScreen extends StatefulWidget {
//   @override
//   _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   final _emailController = TextEditingController();
//   final _otpController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   String? _errorMessage;
//   String? _otp;
//   bool _isOtpSent = false;

//   Future<void> _sendOtp() async {
//     final email = _emailController.text.trim();
//     if (email.isEmpty) {
//       setState(() {
//         _errorMessage = 'Please enter your email address.';
//       });
//       return;
//     }

//     try {
//       // Simulate sending an OTP (replace with actual OTP logic)
//       // Here we simply set an OTP for demonstration purposes.
//       _otp = '123456'; // This should be generated and sent via email.
//       setState(() {
//         _isOtpSent = true;
//         _errorMessage = null;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('OTP sent to $email')),
//       );
//     } catch (error) {
//       setState(() {
//         _errorMessage = 'Failed to send OTP.';
//       });
//     }
//   }

//   void _verifyOtp() {
//     if (_otpController.text.trim() == _otp) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
//       );
//     } else {
//       setState(() {
//         _errorMessage = 'Invalid OTP. Please try again.';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title:
//               Text('Forgot Password', style: AppTextStyle.textStyleBoldBlack)),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (!_isOtpSent) ...[
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: InputDecoration(labelText: 'Email'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: _sendOtp,
//                   child: Text('Send OTP'),
//                 ),
//               ] else ...[
//                 TextFormField(
//                   controller: _otpController,
//                   decoration: InputDecoration(labelText: 'Enter OTP'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the OTP';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: _verifyOtp,
//                   child: Text('Verify OTP'),
//                 ),
//               ],
//               if (_errorMessage != null) ...[
//                 SizedBox(height: 16.0),
//                 Text(
//                   _errorMessage!,
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChangePasswordScreen extends StatefulWidget {
//   @override
//   _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   final _newPasswordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   String? _errorMessage;

//   Future<void> _changePassword() async {
//     final newPassword = _newPasswordController.text.trim();
//     final confirmPassword = _confirmPasswordController.text.trim();

//     if (newPassword.isEmpty || confirmPassword.isEmpty) {
//       setState(() {
//         _errorMessage = 'Please enter both fields.';
//       });
//       return;
//     }

//     if (newPassword != confirmPassword) {
//       setState(() {
//         _errorMessage = 'Passwords do not match.';
//       });
//       return;
//     }

//     try {
//       // This is where you would implement the password change logic,
//       // such as updating the password in your database.
//       // For example:
//       // await FirebaseAuth.instance.currentUser.updatePassword(newPassword);

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Password changed successfully!')),
//       );

//       // Optionally, navigate back to login or main screen
//       Navigator.popUntil(context, (route) => route.isFirst);
//     } catch (error) {
//       setState(() {
//         _errorMessage = 'Failed to change password.';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Change Password')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: _newPasswordController,
//               decoration: InputDecoration(labelText: 'New Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: _confirmPasswordController,
//               decoration: InputDecoration(labelText: 'Confirm Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _changePassword,
//               child: Text('Change Password'),
//             ),
//             if (_errorMessage != null) ...[
//               SizedBox(height: 16.0),
//               Text(
//                 _errorMessage!,
//                 style: TextStyle(color: Colors.red),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Main file to run the app
 