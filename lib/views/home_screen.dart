import 'package:displays_a_list_of_employees_with_their_names_and_salaries_task/models/employee_model.dart';
import 'package:displays_a_list_of_employees_with_their_names_and_salaries_task/services/employee_service.dart';
import 'package:displays_a_list_of_employees_with_their_names_and_salaries_task/views/employee_details.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Employee> employees = [];
  bool loading = true;
  getMyEmployees() async {
    employees = await EmployeeService().getEmployees();
    loading = false;
    setState(() {}); //notify UI lma el y get el employees
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
