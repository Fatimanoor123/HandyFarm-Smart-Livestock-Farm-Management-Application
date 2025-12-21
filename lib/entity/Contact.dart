import 'package:floor/floor.dart';

@entity
class Contact {
  @PrimaryKey(autoGenerate: true)
  int ContactId;

  final String Contactname, Address, Email, URL;
  final String Phone;

  Contact(this.Contactname, this.Address, this.Phone, this.Email, this.URL);
}
