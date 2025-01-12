import 'package:displays_a_list_of_employees_with_their_names_and_salaries_task/models/employee_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmployeeDetails extends StatefulWidget {
  Employee employeeDetail;
  EmployeeDetails({super.key, required this.employeeDetail});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Text(widget.employeeDetail
                  .firstName), // used widget to access the employeeDetail object
              Text(widget.employeeDetail.lastName),
              Text(widget.employeeDetail.email),
              Text(widget.employeeDetail.salary.toString()),
            ],
          ),
        ));
  }
}
