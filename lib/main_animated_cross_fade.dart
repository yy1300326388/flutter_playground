import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  var _isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              'DartとFlutterがスムーズに切り替わります',
              style: Theme.of(context).textTheme.display1,
            ),
            AnimatedCrossFade(
              firstChild: Image.asset('assets/images/dart.png'),
              secondChild: Image.asset('assets/images/flutter.png'),
              crossFadeState: _isFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 800),
            ),
            Text(
              'クロスフェードしながら高さも滑らかに変化します',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            _isFirst = !_isFirst;
          });
        },
      ),
    );
  }
}
