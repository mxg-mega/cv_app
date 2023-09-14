import 'package:flutter/material.dart';
import 'package:cv_app/preview_page.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.title});

  final String title;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController slackUserNameController = TextEditingController();
  TextEditingController gitHubUserNameController = TextEditingController();

  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    slackUserNameController.dispose();
    gitHubUserNameController.dispose();
    super.dispose();
  }
  @override
  void initState(){
    nameController.text = 'Muhammad Aliyu Abubakar';
    emailController.text = 'muhammadmasanawa75@gmail.com';
    slackUserNameController.text = 'Muhammad Aliyu Abubakar';
    gitHubUserNameController.text = 'mxg-mega';
    super.initState();
  }

  void _saveChanges(){
    setState(() {
    });
    Navigator.pop(context);
  }
  PreViewPage fetch = new PreViewPage(title: 'Preview Page');


  Container infoField(
      TextEditingController? infoValue, Widget infoIcon, String hint) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
                child: Column(
              children: [
                infoField(nameController, const Icon(Icons.person), 'Full Name'),
                SizedBox(
                  height: 5.0,
                ),
                infoField(emailController, const Icon(Icons.mail), 'Email Address'),
                SizedBox(
                  height: 5.0,
                ),
                infoField(slackUserNameController, Image.asset('assets/icons8-slack-48.png', scale: 1.5,), 'Slack Username'),
                SizedBox(
                  height: 5.0,
                ),
                infoField(gitHubUserNameController, Image.asset('assets/icons8-github-48.png', scale: 1.5,), 'GitHub Username'),
                SizedBox(
                  height: 5.0,
                ),FloatingActionButton(onPressed: _saveChanges, child: Icon(Icons.save),)
              ],
            ),),),
      ),
    );
  }
}
