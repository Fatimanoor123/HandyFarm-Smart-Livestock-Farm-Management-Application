import 'package:floor/floor.dart';

@entity
class Animal {
  @PrimaryKey(autoGenerate: true)
  int Id;
  final int SpecieId;
  final String name,
      FatherName,
      MotherName,
      Sex,
      DOB,
      DateofPurchase,
      DateLost,
      ReaasonLost,
      AnimalStatus;
  final String puchasefrom;
  final String price;
  final String photo;
  Animal(
      this.Id,
      this.name,
      this.AnimalStatus,
      this.DateLost,
      this.DateofPurchase,
      this.DOB,
      this.FatherName,
      this.MotherName,
      this.price,
      this.ReaasonLost,
      this.Sex,
      this.SpecieId,
      this.photo,
      this.puchasefrom);
}
