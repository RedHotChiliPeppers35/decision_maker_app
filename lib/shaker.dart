import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10;
  Timer? timer;
  int imageNo = 1;

  @override
  void initState() {
    super.initState();
    timeCheck();
  }

  void _incrementCounter() {
    if (_counter == 0) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text("OOPS !"),
          content: const Text(
            "You have reached the number of available shakes for today",
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Okay"))
          ],
        ),
      );
    } else {
      SystemSound.play(SystemSoundType.click);
      setState(() {
        _counter--;
        imageNo = Random().nextInt(5) + 1;
      });
    }
  }

  void timeCheck() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      String currentDateFormat = DateFormat("HH:mm:ss").format(DateTime.now());
      setState(() {
        if (currentDateFormat == "00:37:00") {
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text("WAOOOW :)"),
              content: const Text(
                "Your shakes are refreshed !",
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Lets Shake!"))
              ],
            ),
          );
          _counter = 10;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 186, 233, 255),
      appBar: AppBar(
        title: const Text("Make your choices with me!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Text(
              'Your remaining shakes:',
              style: TextStyle(
                  color: Color.fromARGB(255, 7, 16, 71), fontSize: 18),
            ),
            Text(
              '$_counter',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 7, 16, 71),
                  fontSize: 25),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  setState(() {
                    _incrementCounter();
                  });
                },
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Image(
                      key: ValueKey<int>(_counter),
                      image: AssetImage("images/ball$imageNo.png")),
                )),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
