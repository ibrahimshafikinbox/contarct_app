import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:client_project/Feature/Contracts/cubit/contarct_state.dart';
import 'package:client_project/Feature/Contracts/cubit/contract_cubit.dart';
import 'package:client_project/Feature/Contracts/view/review_contarct.dart';
import 'package:client_project/Feature/Login/widget/app_button.dart';
import 'package:client_project/Feature/Login/widget/default_form_filed.dart';
import 'package:client_project/Feature/resources/colors/colors.dart';
import 'package:client_project/Feature/resources/styles/app_sized_box.dart';
import 'package:client_project/Feature/resources/styles/app_text_style.dart';

class ContractDetails extends StatefulWidget {
  final int filePageCount;
  final int amount;

  const ContractDetails({
    Key? key,
    required this.filePageCount,
    required this.amount,
  }) : super(key: key);

  @override
  State<ContractDetails> createState() => _ContractDetailsState();
}

class _ContractDetailsState extends State<ContractDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController contractNameController = TextEditingController();
  final TextEditingController otherPartiesController = TextEditingController();
  final TextEditingController concernsController = TextEditingController();
  final TextEditingController goalsController = TextEditingController();
  final TextEditingController questionsController = TextEditingController();
  final TextEditingController additionalInfoController =
      TextEditingController();
  String? contractDownloadUrl;
  String? selectedContractType;

  Future<void> uploadContract() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['doc', 'docx'], // Allow only Word files
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = result.files.single.name;

      try {
        final storageRef = FirebaseStorage.instance.ref('contracts/$fileName');
        await storageRef.putFile(file);
        String downloadUrl = await storageRef.getDownloadURL();
        setState(() {
          contractDownloadUrl = downloadUrl;
        });
        print(downloadUrl);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('🚀 Contract uploaded successfully')));
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('🚀 Failed to upload contract')));
      }
    }
  }

  void submitContractDetails() {
    if (contractDownloadUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('🚀🚀 Please upload a contract file first')));
      return;
    }

    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewContract(
            contractUrl: contractDownloadUrl!,
            contractName: contractNameController.text,
            otherParties: otherPartiesController.text,
            concerns: concernsController.text,
            goals: goalsController.text,
            questions: questionsController.text,
            additionalInfo: additionalInfoController.text,
            contractType: selectedContractType,
            filePageCount: widget.filePageCount,
            amount: widget.amount,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(' Please fill out all required fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSizedBox.sizedH40,
                const Row(
                  children: [
                    Text(
                      "Contract Details : ",
                      style: AppTextStyle.textStyleBoldBlack,
                    ),
                    Spacer(),
                  ],
                ),
                AppSizedBox.sizedH15,
                Text(
                  "Contract Name: ",
                  style: AppTextStyle.textStyleRegularGray,
                ),
                AppSizedBox.sizedH10,
                DefaultFormField(
                  controller: contractNameController,
                  type: TextInputType.text,
                  hint: 'Contract name',
                  isPassword: false,
                  onValidate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill in this field';
                    }
                    return null;
                  },
                  label: 'Contract Name',
                  maxlines: 1,
                ),
                ContractTypeSelector(
                  onSelectedContractChanged: (String? value) {
                    setState(() {
                      selectedContractType = value;
                    });
                  },
                ),
                Text("Please upload your word document.",
                    style: AppTextStyle.textStyleRegularGray),
                AppSizedBox.sizedH10,
                Center(
                  child: appButtonWithIcon(
                    function: uploadContract,
                    text: "Upload Contract",
                    textColor: AppColors.black,
                    bottonColor: AppColors.white,
                    icon: Icons.navigate_next,
                  ),
                ),
                AppSizedBox.sizedH15,
                Text(
                  "Or, if you prefer to upload from another device, please use this link..",
                  style: AppTextStyle.textStyleRegularGray,
                ),
                AppSizedBox.sizedH10,
                Center(
                  child: appButtonWithIcon(
                    function: () {},
                    text: "Email Upload Link",
                    textColor: AppColors.black,
                    bottonColor: AppColors.white,
                    icon: Icons.navigate_next,
                  ),
                ),
                AppSizedBox.sizedH20,
                const Text(
                    "Who are the other parties in the contract and how are they connected to you?"),
                AppSizedBox.sizedH10,
                DefaultFormField(
                  controller: otherPartiesController,
                  type: TextInputType.text,
                  hint: '',
                  label: "",
                  maxlines: 1,
                  isPassword: false,
                  onValidate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill in this field';
                    }
                    return null;
                  },
                ),
                AppSizedBox.sizedH10,
                const Text("What are your biggest concerns with the contract?"),
                AppSizedBox.sizedH10,
                DefaultFormField(
                  controller: concernsController,
                  type: TextInputType.text,
                  hint: '?',
                  label: '',
                  maxlines: 1,
                  isPassword: false,
                  onValidate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill in this field';
                    }
                    return null;
                  },
                ),
                AppSizedBox.sizedH10,
                const Text("What are your goals for the contract?"),
                AppSizedBox.sizedH10,
                DefaultFormField(
                  controller: goalsController,
                  type: TextInputType.text,
                  hint: "",
                  label: '',
                  maxlines: 1,
                  isPassword: false,
                  onValidate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill in this field';
                    }
                    return null;
                  },
                ),
                AppSizedBox.sizedH10,
                const Text("What questions do you have about the contract?"),
                AppSizedBox.sizedH10,
                DefaultFormField(
                  controller: questionsController,
                  type: TextInputType.text,
                  hint: '',
                  label: '',
                  maxlines: 1,
                  isPassword: false,
                  onValidate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill in this field';
                    }
                    return null;
                  },
                ),
                AppSizedBox.sizedH10,
                const Text("Any additional information you want to add?"),
                AppSizedBox.sizedH10,
                DefaultFormField(
                  controller: additionalInfoController,
                  type: TextInputType.text,
                  hint: '',
                  label: '',
                  maxlines: 1,
                  isPassword: false,
                  onValidate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill in this field';
                    }
                    return null;
                  },
                ),
                AppSizedBox.sizedH25,
                Material(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0XFFFFFFFF),
                  elevation: 3,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: BlocConsumer<ContractCubit, ContractState>(
                      listener: (context, state) {
                        if (state is ContractLoading) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Submitting contract...')));
                        } else if (state is ContractSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Contract submitted successfully!')));
                        } else if (state is ContractFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Failed to submit contract: ${state.error}')));
                        }
                      },
                      builder: (context, state) {
                        return Material(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0XFFFFFFFF),
                            elevation: 3,
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                                child: DefaultButton(
                                    function: () async {
                                      submitContractDetails();
                                    },
                                    text: "       Next        ",
                                    textColor: AppColors.white,
                                    bottonColor: AppColors.green)));
                      },
                    ),
                  ),
                ),
                AppSizedBox.sizedH50,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContractTypeSelector extends StatefulWidget {
  final ValueChanged<String?> onSelectedContractChanged;

  const ContractTypeSelector(
      {super.key, required this.onSelectedContractChanged});

  @override
  // ignore: library_private_types_in_public_api
  _ContractTypeSelectorState createState() => _ContractTypeSelectorState();
}

class _ContractTypeSelectorState extends State<ContractTypeSelector> {
  String? selectedContract;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text("Contract Type:", style: TextStyle(fontSize: 16)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // First Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildRadioOption('Sales / Procurement'),
                  buildRadioOption('Employment / Offer'),
                ],
              ),
              // Second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  buildRadioOption('Corp. / Joint Venture'),
                  AppSizedBox.sizedW20,
                  buildRadioOption('Settlement'),
                ],
              ),
              // Third Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildRadioOption('Vendor / Supplier'),
                  buildRadioOption('Terms & Conditions'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRadioOption(String title) {
    return Row(
      children: <Widget>[
        Radio<String>(
          value: title,
          groupValue: selectedContract,
          onChanged: (String? value) {
            setState(() {
              selectedContract = value;
            });
            widget.onSelectedContractChanged(value);
          },
        ),
        Text(
          title,
          style: AppTextStyle.textStyleRegularGray,
        ),
      ],
    );
  }
}
