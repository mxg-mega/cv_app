import 'package:cv_app/edit_page.dart';
import 'package:flutter/material.dart';

class PreView extends StatefulWidget {

  @override
  State<PreView> createState() => _PreViewState();
}

class _PreViewState extends State<PreView> {
  EditPage info = EditPage();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PreView'),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              info.info.page(),
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



class PreviewInfo extends StatefulWidget {
  const PreviewInfo({Key? key}) : super(key: key);

  @override
  State<PreviewInfo> createState() => _PreviewInfoState();
}

class _PreviewInfoState extends State<PreviewInfo> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
