import 'package:cv_app/edit_page.dart';
import 'package:flutter/material.dart';

class PreViewPage extends StatefulWidget {
  const PreViewPage({Key? key}) : super(key: key);

  @override
  State<PreViewPage> createState() => _PreViewPageState();
}

class _PreViewPageState extends State<PreViewPage> {
  String initialName = 'Muhammad Aliyu Abubakar';

  void syncName(String newName) {
    setState(() {
      initialName = newName;
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
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text('$initialName', style: TextStyle(fontSize: 30),),
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
                        updateName: syncName,
                      ),
                    ),
                  );
                },
                child: Text('Edit'),),
          ],
        ),
      ),
    );
  }
}
