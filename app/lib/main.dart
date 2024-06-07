import 'package:app/mock.dart';
import 'package:app/widget/page_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.transparent,
          // ···
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Instagram'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(widget.title),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.heart),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.chat_bubble_text),
            onPressed: () {},
          ),
        ],
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: _createHorWidget(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.play_rectangle),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }

  // 创建分页
  List<Widget> _createHorWidget() {
    List<Widget> _list = [];
    for (var i = 0; i < response.mockData!.length; i++) {
      MockData item = response.mockData![i];
      _list.add(PageItem(
        id: item.id,
        name: item.name,
        address: item.address,
        content: item.content,
      ));
    }
    return _list;
  }
}
