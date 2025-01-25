# Flutter shaking widget

A simple and lightweight Flutter package for adding horizontal shake animations to your widgets. Perfect for creating attention-grabbing UI elements like error indicators, animated icons, or any widget that requires a shaking effect.

<img src="https://github.com/user-attachments/assets/3a1cc683-70a4-4d67-b029-5c1eb749cff9" alt="Flutter shaking widget Demo" style="height:400px;">

## Features

- Add shake animation to any widget.
- Control the animation toggle dynamically.
- Fully customizable: set animation duration and use your own child widget.
- Uses `Transform.translate` for efficient and flexible animations.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_shaking_widget: ^1.0.0
```

Then, run:

```bash
flutter pub get
```

## Usage

### Basic Example

```dart
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

```

### Advanced Example

You can customize the animation duration and use any widget as a child:

```dart
ShakeWidget(
  enableShake: true,
  duration: Duration(milliseconds: 1000),
  child: Text(
    'Shake Me!',
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  ),
)
```

## Parameters

| Parameter      | Type            | Default                           | Description                                  |
|----------------|-----------------|-----------------------------------|----------------------------------------------|
| `enableShake`  | `bool`          | `false`                           | Toggles the shake animation.                |
| `child`        | `Widget`        | `required`                        | The widget to apply the shake effect on.    |
| `duration`     | `Duration`      | `Duration(milliseconds: 1500)`    | Sets the duration of the shake animation.   |

## How It Works

`ShakeWidget` uses Flutter's `Transform.translate` widget to create a smooth horizontal shaking effect without affecting the widget's layout. The animation runs using an `AnimationController` and a `Tween` that interpolates between two horizontal offset values.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

If you find this package helpful, feel free to star the repository and share your feedback! Your contributions and suggestions are always welcome. ❤️

