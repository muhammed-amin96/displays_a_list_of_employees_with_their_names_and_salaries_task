import 'package:displays_a_list_of_employees_with_their_names_and_salaries_task/models/employee_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeService {
  String uri = 'https://mocki.io/v1/283ba093-9bf9-42e4-8f28-d2538937f9ca';

  Future<List<Employee>> getEmployees() async {
    var response = await http.get(Uri.parse(uri));
    List<Employee> employees = [];
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.forEach((element) {
        Employee employee = Employee.fromJson(element);
        employees.add(employee);
      });
      print('Number of Employees is ${employees.length}');
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
    return employees;
  }
}
