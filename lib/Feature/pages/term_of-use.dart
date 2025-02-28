import 'package:client_project/Core/Helper/navigation_helper.dart';

import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/pages/Privacy_1.dart';

import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class TermsOfUseView extends StatefulWidget {
  const TermsOfUseView({Key? key}) : super(key: key);

  @override
  State<TermsOfUseView> createState() => _TermsOfUseViewState();
}

class _TermsOfUseViewState extends State<TermsOfUseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView(
          children: const [
            // Headline text
            Text(
              "Terms of Use",
              style: AppTextStyle.textStyleBoldBlack20,
            ),
            AppSizedBox.sizedH25,
            Text(
              "Review Your Contract (RYC) terms of use are our contract with you. They include our commitment as a service provider and your obligations as a customer.",
              style: AppTextStyle.textStyleMediumAppBlack,
            ),
            AppSizedBox.sizedH25,
            Text(
              "Introduction",
              style: AppTextStyle.textStyleBoldBlack20,
            ),
            AppSizedBox.sizedH10,
            Text(
              "Welcome to Review Your Contract! We’re excited to have you here but before you start using RYC, we need you to look through and accept these terms. We’ve done our best to explain it all without using too much jargon, so it’s clear what we expect from you and what you can expect from us.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,

            Text(
              "To make things easier, we’ve included summary paragraphs at the top of each section to give you a heads up on what’s coming up.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "These are your legal rights and obligations, so please read everything. If you can’t agree to our terms, then you can’t use our services.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "If you still have questions or comments after you’ve read these terms, please reach out to support@lcounsel.com to get in touch. We’d love to help.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "Last updated on 29 July 2024. The terms have been updated to help ensure greater clarity and transparency, and to better align with the way we do business. The updates also include requirements for subscribers who participate in our partner program, which are designed to ensure their clients have subscription access rights.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH25,
            Text(
              "Joining and using RYC",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "In this section we explain how to use the RYC app and use our services. When you see a word in bold, it will have the same corresponding meaning every time it’s used within these terms.",
              style: AppTextStyle.textStyleBoldBlack20,
            ),
            AppSizedBox.sizedH10,
            Text(
              "1. You and RYC: When we say you or your, we mean both you and any entity or firm you’re authorized to represent. When we say RYC, we, our or us, we’re talking about the RYC entity you contract with and pay fees to based on the RYC product or service you’re using.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "2. Our services: Our services consist of all the services we provide now or in the future, including our online and mobile legal, accounting, consulting, and financial products.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "3. Creating an account: When you create an account to use our services and accept these terms, you become a member. If you’re the member, you’re the one responsible for paying for your app fees.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " 4. People invited to use RYC: An invited user is a person other than the member who has been invited to use our services. If you’re an invited user, you must also accept these terms to use our services.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "5. User roles and access: As a member inviting others to use the app, you should understand the permissions you’re granting to invited users. In particular, if you’re a small business invited user and your advisor is the member.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "6. The right to use our services: Whether you’re a member or an invited user, we grant you the right to use our services for as long as the member continues to pay for the services, or – if you’re an invited user – until your access is revoked.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "7. Your responsibilities: You promise that you’ll keep your information (including a current email address) up to date. You’re responsible for providing true, accurate and complete information and for verifying the accuracy of any information that you use from our services for your legal, tax and compliance obligations. You’re also responsible for protecting your username and password from getting stolen or misused. Our service has minimum password standards but you will ensure that passwords are very strong and not easily guessable. The stronger the password the better! ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "8. When we introduce new or revised services: Since we’re always thinking about how to make RYC the best it can be – seriously, we’ve got teams dedicated to it – we regularly expand our services. For new or updated services, there might be additional terms. We’ll let you know what those terms are before you start using those services.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "9. What we own: We own everything we’ve put into our services unless otherwise stated and excluding content owned by others. This includes rights in the design, compilation, and look and feel of our services. It also includes rights in all copyrighted works, trademarks, designs, inventions, and other intellectual property. You agree not to copy, distribute, modify or make derivative works of any of our content or use any of our intellectual property rights in any way not expressly permitted by us.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "Pricing",
              style: AppTextStyle.textStyleBoldBlack20,
            ),
            AppSizedBox.sizedH10,
            Text(
              "Unless you’re getting a first contract reviewed for free or other offer, you’ll need to pay for the service based on the pricing of the contract you need reviewed. The pricing details and other terms of your service are explained when you select the specific service. ",
              style: AppTextStyle.textStyleBoldBlack20,
            ),
            AppSizedBox.sizedH10,
            Text(
              "10. RYC pricing plans: Your use of our services generally requires you to pay a flat one time fee based on the length of your contract (the service fee). The service fee consists of the fees to review the contract and the fees we offered you for other services, including invoicing and payment. We may update or amend the service fee from time to time. As with any other changes to our terms, changes to the service fee won’t apply retrospectively. Depending on your region, subscription fees may be inclusive or exclusive of transactional taxes where relevant (like VAT and GST), as reflected in the service fee.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "11. Taxes for your use of our services: You’re responsible for paying all other external fees and taxes associated with your use of our services wherever levied. Your responsibility includes withholding tax if it applies, unless we already process that withholding tax. We may collect geographical location information to determine your location, which may be used for tax purposes. This means location information you give us must be accurate for tax residency purposes.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "12. Additional services: Depending on where you’re based and how you use our services, you may be able to take advantage of additional services that RYC offers. These might incur an additional fee that we’ll let you know about when you sign up for those services.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "Data use and privacy",
              style: AppTextStyle.textStyleBoldBlack20,
            ),
            AppSizedBox.sizedH10,
            Text(
              "RYC uses your data to provide our services to you. Our privacy notice is an important part of these terms and describes in more detail how we deal with personal data, like your name and email address.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "13. Use of data: When you enter or upload your data into our services, we don’t own that data but you grant us a license to use, copy, transmit, store, analyze, and back up all data you submit to us through our services, including personal data of yourself and others, to: enable you to use our services; allow us to improve, develop and protect our services; create new services; communicate with you about your subscription; send you information we think may be of interest to you based on your marketing preferences; and disclose to third party service providers and partners to enable and support such purposes.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " 14. Use of your own personal data: We respect your privacy and take data protection seriously. In addition to these terms, our privacy notice sets out in detail how we process your own personal data that you enter into RYC, like your name and email address.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "15. Use of personal data you enter about others: Depending on where your contacts are based, our data processing terms may also apply to the personal data of others (such as your customers, suppliers and employees) that you enter into RYC. ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "16. Anonymised statistical data: When you use our services, we may create anonymised statistical data from your data and usage of our services, including through aggregation. Once anonymised, we may use it for our own purposes, such as to provide and improve our services, to develop new services or product offerings, to identify business trends, and for other uses we communicate to you. ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "17. Data breach notifications: Where there has been unauthorized access to personal data that you’ve entered into RYC, we’ll let you know and, where possible, give you information about what has happened. Depending on the nature of the unauthorized access, and the location of your affected contacts, you may be required to assess whether the unauthorized access must be reported to the contact and/or a relevant authority. We think you’re best placed to make this decision, because you’ll have the most knowledge about the personal data you have entered in your RYC subscription. ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "Confidential information ",
              style: AppTextStyle.textStyleBoldBlack20,
            ),
            AppSizedBox.sizedH10,
            Text(
              " 18. Keeping it confidential: While using our services, you may share confidential information with us, and you may become aware of confidential information about us. You and we both agree to take reasonable steps to protect the other party’s confidential information from being accessed by unauthorized individuals. You or we may share each other’s confidential information with legal or regulatory authorities if required to do so.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "Security ",
              style: AppTextStyle.textStyleBoldBlack20,
            ),
            AppSizedBox.sizedH10,
            Text(
              "We take security seriously and you should too! To help protect our services and your data, we offer added security features such as multi-factor authentication. ",
              style: AppTextStyle.textStyleBoldBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              "18.  Security safeguards: We’ve invested in technical, physical and administrative safeguards to do our part to help keep your data safe and secure. While we’ve taken steps to help protect your data, no method of electronic storage is completely secure and we cannot guarantee absolute security. We may notify you if we have reason to believe that someone has accessed (or may be able to access) your account without authorization and we may also restrict access to certain parts of our services until you verify that access was by an authorized user. ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " 19.  Account security features:  We may introduce security features to make your account more secure, such as multi-factor authentication. Depending on where you are in the world or what services you’re using, we may require you to adopt some of these features. Where we make the use of security features optional, you’re responsible (meaning we’re not liable) for any consequences of not using those features. We strongly encourage you to use all optional security features.",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " 20.  Playing your part to secure your data: You have an important part to play by keeping your login details secure, not letting any other person use them, and by making sure you have strong security on your own systems. If you realize there’s been any unauthorized use of your password or any breach of security to your account or email address linked to your account, you need to let us know immediately. You also agree not to use free-form fields in any of RYC’s systems or services to store personal data (unless it’s a field explicitly asking for personal data - like a first name or a last name), credit card details, tax identifiers or bank account details. ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),

            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),
            AppSizedBox.sizedH10,
            Text(
              " ",
              style: AppTextStyle.textStyleMediumBlack,
            ),

            // DefaultButton(
            //   function: () {
            //     navigateTo(context, Privacy_1());
            //   },
            //   text: "Agree and Continue",
            //   textColor: AppColors.white,
            //   bottonColor: AppColors.green,
            // ),
            AppSizedBox.sizedH45,
          ],
        ),
      ),
    );
  }
}
