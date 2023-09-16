import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cv_app/preview_page.dart';

class EditPage extends StatefulWidget {
  final String initialName;
  final String initialEmail;
  final String initialSlack;
  final String initialGithub;
  final String initialBio;

  Function(String,String,String,String,String) update;

  EditPage({
    super.key,
    required this.initialName,
    required this.initialEmail,
    required this.initialSlack,
    required this.initialGithub,
    required this.initialBio,
    required this.update
  });
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final slackUserNameController = TextEditingController();
  final gitHubUserNameController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.initialName;
    emailController.text = widget.initialEmail;
    slackUserNameController.text = widget.initialSlack;
    gitHubUserNameController.text = widget.initialGithub;
    bioController.text = widget.initialBio;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    slackUserNameController.dispose();
    gitHubUserNameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  Container infoField(TextEditingController id, Widget infoIcon, String hint, String label) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: id,
          decoration: InputDecoration(
            label: Text(label),
            hintText: hint,
            icon: infoIcon,
          ),
        ),
      ),
    );
  }

  void onSaveChanges() {
    String nameData = nameController.text;
    String emailData = emailController.text;
    String slackData = slackUserNameController.text;
    String gitData = gitHubUserNameController.text;
    String bioData = bioController.text;
    widget.update(nameData, emailData, slackData, gitData, bioData);
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
                infoField(
                  nameController,
                  const Icon(Icons.person),
                  'Full Name',
                  'Name',
                ),
                SizedBox(
                  height: 5.0,
                ),
                infoField(
                  emailController,
                  const Icon(Icons.mail),
                  'Email Address',
                  'Email',
                ),
                SizedBox(
                  height: 5.0,
                ),
                infoField(
                  slackUserNameController,
                  Image.asset(
                    'assets/icons8-slack-48.png',
                    scale: 1.5,
                  ),
                  'Slack Username',
                  'Slack Username',
                ),
                const SizedBox(
                  height: 5.0,
                ),
                infoField(
                  gitHubUserNameController,
                  Image.asset(
                    'assets/icons8-github-48.png',
                    scale: 1.5,
                  ),
                  'GitHub Username',
                  'GitHub Username',
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: bioController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Bio',
                        label: Text('Bio'),
                        icon: const Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                FloatingActionButton(
                  onPressed: () {
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
