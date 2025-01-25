import 'package:flutter/material.dart';
import 'package:flutter_shaking_widget/shake.widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: const ShakeDemo(title: 'Flutter Shake Widget Demo'),
    );
  }
}

class ShakeDemo extends StatefulWidget {
  const ShakeDemo({required this.title, super.key});

  final String title;

  @override
  State<ShakeDemo> createState() => _ShakeDemoState();
}

class _ShakeDemoState extends State<ShakeDemo> {
  bool _shakeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShakeWidget(
                  enableShake: _shakeEnabled,
                  child: Icon(
                    Icons.favorite,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 10),
                ShakeWidget(
                  enableShake: _shakeEnabled,
                  child: Icon(
                    Icons.thumb_up,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setState(() => _shakeEnabled = !_shakeEnabled),
              child: Text('Toggle Shake'),
            ),
          ],
        ),
      ),
    );
  }
}
