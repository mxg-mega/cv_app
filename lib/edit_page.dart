import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cv_app/preview_page.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EditPage();
  }
}

class EditPage extends StatefulWidget {
  EditPage({super.key});
  _EditPageState info = _EditPageState();
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController slackUserNameController = TextEditingController();
  TextEditingController gitHubUserNameController = TextEditingController();

  String fullName = 'Muhammad Aliyu Abubakar';
  String email = 'muhammadmasanawa75@gmail.com';
  String slack = 'Muhammad Aliyu Abubakar';
  String githubUsername = 'mxg-mega';

  @override
  void initState() {
    super.initState();
    nameController.text = 'Muhammad Aliyu Abubakar';
    emailController.text = 'muhammadmasanawa75@gmail.com';
    slackUserNameController.text = 'Muhammad Aliyu Abubakar';
    gitHubUserNameController.text = 'mxg-mega';
    nameController.addListener(sync);
    emailController.addListener(sync);
    slackUserNameController.addListener(sync);
    gitHubUserNameController.addListener(sync);
  }

  // String getName(){
  //   fullName = nameController.text;
  //   return fullName;
  // }

  void sync(){
    fullName = nameController.text;
    email = emailController.text;
    slack = slackUserNameController.text;
    githubUsername = gitHubUserNameController.text;
  }

  Container infoField(
      TextEditingController infoValue, Widget infoIcon, String hint) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: infoValue,
          decoration: InputDecoration(
            hintText: hint,
            icon: infoIcon,
          ),
        ),
      ),
    );
  }

  Widget page(){
    sync();
    return Text(nameController.text);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    slackUserNameController.dispose();
    gitHubUserNameController.dispose();
    super.dispose();
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
                infoField(
                    nameController, const Icon(Icons.person), 'Full Name'),
                SizedBox(
                  height: 5.0,
                ),
                infoField(
                    emailController, const Icon(Icons.mail), 'Email Address'),
                SizedBox(
                  height: 5.0,
                ),
                infoField(
                    slackUserNameController,
                    Image.asset(
                      'assets/icons8-slack-48.png',
                      scale: 1.5,
                    ),
                    'Slack Username'),
                SizedBox(
                  height: 5.0,
                ),
                infoField(
                    gitHubUserNameController,
                    Image.asset(
                      'assets/icons8-github-48.png',
                      scale: 1.5,
                    ),
                    'GitHub Username'),
                SizedBox(
                  height: 5.0,
                ),
                FloatingActionButton(
                  onPressed: (){
                    Navigator.pop(context);
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
