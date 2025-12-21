import 'package:floor/floor.dart';

@entity
class Salary {
  @PrimaryKey(autoGenerate: true)
  int Id;

  final String BasicPay, TotalSalary, WorkingHours;
  Salary(this.Id, this.BasicPay, this.TotalSalary, this.WorkingHours);
}
