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
        backgroundColor: Colors.deepOrange.shade900,
        appBar: AppBar(
          title: const Text('PreView'),
          backgroundColor: Colors.deepOrange.shade700,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
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
                        Text('$initialName', style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 5,),
                        Text('$initialEmail', style: const TextStyle(fontSize: 13),),
                      ],
                    ),
                    const SizedBox(height: 20, child: Divider(thickness: 3.0,color: Colors.black,),),
                    const Text('Slack Username:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text('$initialSlack', style: const TextStyle(fontSize: 20),),
                    const SizedBox(height: 10,),
                    const Text('Github Username:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text('$initialGithub', style: const TextStyle(fontSize: 20),),
                    const SizedBox(height: 10,),
                    const Text('Bio:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text('$initialBio', style: const TextStyle(fontSize: 20),),
                  ],
                ),
              ),
          const SizedBox(height: 5.0,),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.deepOrange.shade300),),
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
                      child: Icon(Icons.edit_document),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
