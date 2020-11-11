import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        elevation: 0.0,
        actions: <Widget>[
          Switch(
            value: isSwitched,
            onChanged: (val) {
              toggleTheme();
              setState(() {
                isSwitched = val;
              });
            },
          )
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your Count : $_counter',
                style: TextStyle(
                  fontSize: 20,
                )),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: 20.0,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _counter--;
                    });
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
            SizedBox(
              height: 280.0,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: 100,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _counter = 0;
                      });
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    elevation: 5.0,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  void toggleTheme() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
}
