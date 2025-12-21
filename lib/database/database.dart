import 'package:floor/floor.dart';
import 'package:handyfarm/dao/AnimalDAO.dart';
import 'package:handyfarm/dao/AnimalMedDAO.dart';
import 'package:handyfarm/dao/ContactDAO.dart';
import 'package:handyfarm/dao/EmployeeDAO.dart';
import 'package:handyfarm/dao/ExpenseDAO.dart';
import 'package:handyfarm/dao/ExpenseTypeDAO.dart';
import 'package:handyfarm/dao/Farm_dao.dart';
import 'package:handyfarm/dao/MachineDAO.dart';
import 'package:handyfarm/dao/MilkProductionDAO.dart';
import 'package:handyfarm/dao/SalaryDAO.dart';
import 'package:handyfarm/dao/SaleDAO.dart';
import 'package:handyfarm/dao/SpecieDAO.dart';
import 'package:handyfarm/entity/Animal.dart';
import 'package:handyfarm/entity/AnimalMedicine.dart';
import 'package:handyfarm/entity/Contact.dart';
import 'package:handyfarm/entity/Expense.dart';
import 'package:handyfarm/entity/ExpenseType.dart';
import 'package:handyfarm/entity/Machine.dart';
import 'package:handyfarm/entity/MilkProduction.dart';
import 'package:handyfarm/entity/Salary.dart';
import 'package:handyfarm/entity/Sale.dart';

import 'package:handyfarm/entity/Specie.dart';
import 'package:handyfarm/entity/employe.dart';
import 'package:handyfarm/entity/farm.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [
  Employee,
  Salary,
  Farm,
  Specie,
  Animal,
  AnimalMedicine,
  Expense,
  ExpenseType,
  Sale,
  Contact,
  Machine,
  MilkProduction,
  Contact
])
abstract class AppDatabase extends FloorDatabase {
  EmployeeDAO get employeeDAO;
  SalaryDAO get salarydao;
  Farmdao get farmDAO;
  SpecieDAO get Speciedao;
  AnimalDAO get Animaldao;
  AnimalMedicineDAO get AniMeddao;
  ExpenseDAO get Expensedao;
  ExpenseTypeDAO get Etypedao;
  SaleDAO get saledao;
  ContactDAO get contactdao;
  MachineDAO get machinedao;
  MilkProductionDAO get milkdao;
}
