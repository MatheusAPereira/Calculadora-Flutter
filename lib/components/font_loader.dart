import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FontLoaderExample extends StatefulWidget {
  @override
  _FontLoaderExampleState createState() => _FontLoaderExampleState();
}

class _FontLoaderExampleState extends State<FontLoaderExample> {
  bool _fontLoaded = false;

  Future<void> _loadFont() async {
    await FontLoader('Work Sans').load(); // replace with your font name and path
    setState(() {
      _fontLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [//Text('Olá'),
      _fontLoaded
            ? Text(
                'Font loaded successfully!',
                style: TextStyle(fontFamily: 'MyFont'), // use the loaded font
              )
            : ElevatedButton(
                onPressed: _loadFont,
                child: Text('Load Font'),
              ),
      ]);
  }
}