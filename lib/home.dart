import 'package:flutter/material.dart';
import 'package:flutter_web_view/web_view_container.dart';

class Home extends StatelessWidget {
  final _links = ['https://google.com', 'https://netflix.com'];

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:
                  _links.map((link) => _urlButton(context, link)).toList()),
        ),
      ),
    );
  }

  Widget _urlButton(BuildContext context, String url) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () => _handleURLButtonPress(context, url),
        child: Text(url.toString()),
      ),
    );
  }

  void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainerWidget(url)));
  }
}
