import 'package:cv_app/edit_page.dart';
import 'package:flutter/material.dart';

class PreViewPage extends StatefulWidget {
  const PreViewPage({Key? key}) : super(key: key);

  @override
  State<PreViewPage> createState() => _PreViewPageState();
}

class _PreViewPageState extends State<PreViewPage> {
  String initialName = 'Muhammad Aliyu Abubakar';
  String initialEmail = 'muhammadmasanawa75@gmail.com';
  String initialSlack = 'Raazi';
  String initialGithub = 'mxg-mega';
  String initialBio = 'A Passionate developer interested in game, mobile, and web technologies.';

  void sync(String newName,String newEmail,String newSlack,String newGit,String newBio) {
    setState(() {
      initialName = newName;
      initialEmail = newEmail;
      initialSlack = newSlack;
      initialGithub = newGit;
      initialBio = newBio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          title: Text('PreView'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('$initialName', style: TextStyle(fontSize: 25,),),
                        SizedBox(height: 5,),
                        Text('$initialEmail', style: TextStyle(fontSize: 10),),
                      ],
                    ),
                    SizedBox(height: 20, child: Divider(thickness: 3.0,color: Colors.black,),),
                    Text('Slack Username:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text('$initialSlack', style: TextStyle(fontSize: 20),),
                    SizedBox(height: 10,),
                    Text('Github Username:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text('$initialGithub', style: TextStyle(fontSize: 20),),
                    SizedBox(height: 10,),
                    Text('Bio:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text('$initialBio', style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPage(
                          initialName: initialName,
                          initialEmail: initialEmail,
                          initialSlack: initialSlack,
                          initialGithub: initialGithub,
                          initialBio: initialBio,
                          update: sync,
                        ),
                      ),
                    );
                  },
                  child: Text('Edit'),),
            ],
          ),
        ),
      ),
    );
  }
}
