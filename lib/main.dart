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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Plan {
  String name;
  String description;
  String date;
  bool isCompleted;

  Plan({required this.name, required this.description, required this.date, this.isCompleted = false});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Plan> plans = [];

  void _addPlan(String name, String description, String date) {
    setState(() {
      plans.add(Plan(name: name, description: description, date: date));
    });
  }

  void _editPlan(int index, String newName) {
    setState(() {
      plans[index].name = newName;
    });
  }

  void _toggleComplete(int index) {
    setState(() {
      plans[index].isCompleted = !plans[index].isCompleted;
    });
  }

  void _deletePlan(int index) {
    setState(() {
      plans.removeAt(index);
    });
  }

  void _showAddPlanDialog() {
    String newName = '';
    String newDescription = '';
    String newDate = '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Plan'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Plan Name'),
              onChanged: (value) => newName = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Description'),
              onChanged: (value) => newDescription = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Date'),
              onChanged: (value) => newDate = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (newName.isNotEmpty) {
                _addPlan(newName, newDescription, newDate);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add Plan'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}