import 'dart:convert';

import 'package:displays_a_list_of_employees_with_their_names_and_salaries_task/models/employee_model.dart';
import 'package:displays_a_list_of_employees_with_their_names_and_salaries_task/services/employee_service.dart';
import 'package:displays_a_list_of_employees_with_their_names_and_salaries_task/views/employee_details.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Employee> employees = [];

  bool loading = true;

  getEmployeesDataFromCache() async {
    List<Employee> cachedEmployees = [];
    final prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('employeesData') ?? '';
    if (data.isEmpty) {
      return cachedEmployees;
    } else {
      var jsonData = jsonDecode(data); //convert string to json
      jsonData.forEach((item) {
        cachedEmployees.add(Employee.fromJson(item));
      });
      return cachedEmployees;
    }
  }

  getMyEmployees() async {
    setState(() {
      loading = true;
    });
    List<Employee> cachedEmployees = await getEmployeesDataFromCache();
    if (cachedEmployees.isNotEmpty) {
      setState(() {
        employees = cachedEmployees;
        loading = false;
      });
    } else {
      List<Employee> apiEmployees = await EmployeeService().getEmployees();
      setState(() {
        employees = apiEmployees;
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getMyEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: employees.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmployeeDetails(
                                  employeeDetail: employees[index],
                                )));
                  },
                  child: ListTile(
                    leading: Text(employees[index].id.toString()),
                    title: Text(employees[index].firstName),
                    subtitle: Text('Salary: ${employees[index].salary}'),
                    trailing: Icon(Icons.person),
                  ),
                );
              },
            ),
    );
  }
}
