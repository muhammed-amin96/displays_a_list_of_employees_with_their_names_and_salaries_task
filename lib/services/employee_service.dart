import 'package:dio/dio.dart';
import 'package:displays_a_list_of_employees_with_their_names_and_salaries_task/models/employee_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class EmployeeService {
  String endPoint = 'https://mocki.io/v1/283ba093-9bf9-42e4-8f28-d2538937f9ca';
  List<Employee> employees = [];

  Future<List<Employee>> getEmployees() async {
    try {
      var response = await Dio().get(endPoint);
      var data = response.data; //parse response data
      var cachedData = jsonEncode(data); //cconvert json to string
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(
          'employeesData', cachedData); //store data in shared preferences
      data.forEach((element) {
        Employee employee = Employee.fromJson(element); //parse each user
        employees.add(employee);
      });
    } catch (e) {
      print(e.toString());
    }
    return employees;
  }
}
