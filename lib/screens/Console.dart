import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handyfarm/screens/Add_Animal.dart';
import 'package:handyfarm/screens/Animals.dart';
import 'package:handyfarm/screens/ContactUs.dart';
import 'package:handyfarm/screens/Contacts.dart';
import 'package:handyfarm/screens/EmployeeReg.dart';
import 'package:handyfarm/screens/Expenses.dart';
import 'package:handyfarm/screens/MachineryList.dart';
import 'package:handyfarm/screens/MedicineList.dart';
import 'package:handyfarm/screens/Salary.dart';
import 'package:handyfarm/screens/add_Expense.dart';
import 'package:handyfarm/screens/add_medicine.dart';
import 'package:handyfarm/screens/midpageprecaution.dart';
import 'package:handyfarm/screens/add_machinary.dart';
import 'package:handyfarm/screens/milk_list.dart';
import 'package:handyfarm/screens/sale_list.dart';

import 'employee_list.dart';

main() {
  runApp(MaterialApp(
    home: Console(),
  ));
}

class Console extends StatelessWidget {
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(25.0),
      crossAxisSpacing: 15,
      mainAxisSpacing: 20,
      crossAxisCount: 3,
      children: <Widget>[
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addAnimal()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 0.90),
                  child: Text("Add Animals", style: TextStyle(fontSize: 12.0)),
                ),
                height: 80.0,
                width: 40.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 6.0,
                    image: AssetImage('assets/add_animal.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ))),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeeReg()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 0.90),
                  child: Text("Add Employee", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 6.0,
                    image: AssetImage('assets/add_emplyeess.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),

        //TODO Add medicine
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMedicine()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 0.90),
                  child:
                      Text("Add Medicines", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 8.0,
                    image: AssetImage('assets/AddMedicine.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),

        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddExpense()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 0.90),
                  child: Text("Add Expense", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 8.0,
                    image: AssetImage('assets/Expense.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMachinary()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 0.90),
                  child:
                      Text("Add Machinery", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 7.0,
                    image: AssetImage('assets/add_machinary.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),

        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnimalList()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 1.0),
                  child: Text("Animals", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 3.0,
                    image: AssetImage('assets/animal.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExpenseList()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 1.0),
                  child: Text("Expenses", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 8.0,
                    image: AssetImage('assets/expense_1.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeeList()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 1.0),
                  child: Text("Employees", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 8.0,
                    image: AssetImage('assets/total.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),

        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MedicineList()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 0.90),
                  child: Text("Medicines", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 6.0,
                    image: AssetImage('assets/medicine.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),

        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MachineryList()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 1.0),
                  child: Text("Machines", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 6.0,
                    image: AssetImage('assets/machinary.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),

        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MilkList()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 0.90),
                  child:
                      Text("Milk Production", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 6.0,
                    image: AssetImage('assets/milk_report.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),

        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SaleList()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 1.0),
                  child: Text("Sales", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 6.0,
                    image: AssetImage('assets/sales.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),

        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MidPage()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 0.90),
                  child: Text("Precautions", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 8.0,
                    image: AssetImage('assets/precaution.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUs()),
              );
            },
            child: Container(
                child: Align(
                  alignment: Alignment(0.10, 0.90),
                  child: Text("Contact Us", style: TextStyle(fontSize: 12.0)),
                ),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 8.0,
                    image: AssetImage('assets/contactUS.png'),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF7F7F7F)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ))),
      ],
    );
  }
}
