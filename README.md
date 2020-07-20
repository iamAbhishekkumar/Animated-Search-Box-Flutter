# Animated-Search-Box-Flutter
![](https://img.shields.io/badge/Dart-Flutter-blue.svg?style=for-the-badge&logo=flutter)
----
This is file will return a aniamted search box. You can add "onChanged" and many changes to code before using it.

### Size issue :
The size of handle bar is hard coded so to resize the search icon place it inside a fitted box.
```
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 50,
            width: 50,
            child: FittedBox(
              child: SearchAnimation(),
            ),
          ),
        ),
      ),
    );
  }
}
```
