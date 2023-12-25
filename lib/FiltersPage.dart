import 'package:flutter/material.dart';

void main() {
  runApp(const FiltersPage());
}

class FiltersPage extends StatelessWidget {
  const FiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filter Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: const EatListPage(),
    );
  }
}

class EatListPage extends StatefulWidget {
  const EatListPage({super.key});

  @override
  State<EatListPage> createState() => _EatListPageState();
}

class _EatListPageState extends State<EatListPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
