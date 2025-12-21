import 'package:floor/floor.dart';

@entity
class Employee {
  @PrimaryKey(autoGenerate: true)
  int Id;
  // final int  formId;
  final int SalaryId;
  final String photo;
  final String name, Address, Email;
  final String phonenumber;
  Employee(this.Id, this.name, this.Address, this.Email, this.phonenumber,
      this.photo, this.SalaryId);
}
