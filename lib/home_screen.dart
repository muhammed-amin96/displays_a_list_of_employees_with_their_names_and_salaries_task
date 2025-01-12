import 'package:displays_a_list_of_employees_with_their_names_and_salaries_task/services/employee_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              EmployeeService().getEmployees();
            },
            child: Text('Parse')),
      ),
    );
  }
}
