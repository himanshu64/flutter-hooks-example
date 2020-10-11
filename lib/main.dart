import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabDemo(),
    );
  }
}

class TabDemo extends HookWidget {
  final List<Widget> list = [
    Tab(
      icon: Icon(Icons.card_travel),
    ),
    Tab(
      icon: Icon(Icons.add_shopping_cart),
    ),
    Tab(
      icon: Icon(Icons.ac_unit),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final _controller = useTabController(initialLength: list.length);
    final _index = useState(0);
    final _key = GlobalKey();

    _controller.addListener(() {
      _index.value = _controller.index;
    });
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(controller: _controller, onTap: (index) {}, tabs: list),
        title: Text('Tabs Demo ${_index.value}'),
      ),
      body: TabBarView(key: _key, controller: _controller, children: [
        Center(
            child: Text(
          '1.\n_index: ${_index.value}\n_controller.index: ${_controller.index}',
          style: TextStyle(fontSize: 40),
        )),
        Center(
            child: Text(
          '2.\n_index: ${_index.value}\n_controller.index: ${_controller.index}',
          style: TextStyle(fontSize: 40),
        )),
        Center(
            child: Text(
          '3.\n_index: ${_index.value}\n_controller.index: ${_controller.index}',
          style: TextStyle(fontSize: 40),
        )),
      ]),
    );
  }
}
