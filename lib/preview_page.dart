import 'package:cv_app/edit_page.dart';
import 'package:flutter/material.dart';

class PreViewPage extends StatefulWidget {
  const PreViewPage({super.key, required this.title});
  const PreViewPage.name(this.name{super.key});

  final String title;
  final String name;
  @override
  State<PreViewPage> createState() => _PreViewPageState();
}

class _PreViewPageState extends State<PreViewPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title.title),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text(
                ,
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit');
                  },
                  child: Text('Edit'))
            ],
          ),
        ),
      ),
    );
  }
}
