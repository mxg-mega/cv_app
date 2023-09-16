import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cv_app/preview_page.dart';

class EditPage extends StatefulWidget {
  final String initialName;
  final Function(String) updateName;
  EditPage({super.key, required this.initialName, required this.updateName});
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController slackUserNameController = TextEditingController();
  // TextEditingController gitHubUserNameController = TextEditingController();

  // String fullName = 'Muhammad Aliyu Abubakar';
  // String email = 'muhammadmasanawa75@gmail.com';
  // String slack = 'Muhammad Aliyu Abubakar';
  // String githubUsername = 'mxg-mega';

  // var fullName = 'Muhammad';
  // var email;
  // var slack;
  // var githubUsername;

  @override
  void initState() {

    // emailController.text = 'muhammadmasanawa75@gmail.com';
    // slackUserNameController.text = 'Muhammad Aliyu Abubakar';
    // gitHubUserNameController.text = 'mxg-mega';
    nameController.text = widget.initialName;
    super.initState();
    // nameController.addListener(_syncName);
    // emailController.addListener(sync);
    // slackUserNameController.addListener(sync);
    // gitHubUserNameController.addListener(sync);
  }


  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
  // String getName(){
  //   fullName = nameController.text;
  //   return fullName;
  // }

  // List<String> sync(){
  //
  //     return info;
  //
  // }

  // TextEditingController infoValue,
  // controller: infoValue,

  // Container infoField(
  //     Widget infoIcon, String hint) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
  //     child: Padding(
  //       padding: const EdgeInsets.all(10.0),
  //       child: TextFormField(
  //         decoration: InputDecoration(
  //           hintText: hint,
  //           icon: infoIcon,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   emailController.dispose();
  //   slackUserNameController.dispose();
  //   gitHubUserNameController.dispose();
  //   super.dispose();
  // }

  void onSaveChanges(){
    String editedData = nameController.text;
    widget.updateName(editedData);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      backgroundColor: Colors.brown,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        icon: const Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
                // infoField(
                //     // nameController,
                //     const Icon(Icons.person),
                //     'Full Name',
                // ),
                // SizedBox(
                //   height: 5.0,
                // ),
                // infoField(
                //     emailController, const Icon(Icons.mail), 'Email Address', ),
                // SizedBox(
                //   height: 5.0,
                // ),
                // infoField(
                //     slackUserNameController,
                //     Image.asset(
                //       'assets/icons8-slack-48.png',
                //       scale: 1.5,
                //     ),
                //     'Slack Username'),
                // SizedBox(
                //   height: 5.0,
                // ),
                // infoField(
                //     gitHubUserNameController,
                //     Image.asset(
                //       'assets/icons8-github-48.png',
                //       scale: 1.5,
                //     ),
                //     'GitHub Username'),
                SizedBox(
                  height: 5.0,
                ),
                FloatingActionButton(
                  onPressed: (){
                   onSaveChanges();
                  },
                  child: Icon(Icons.save),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
