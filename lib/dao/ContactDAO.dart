import 'package:handyfarm/entity/Contact.dart';
import 'package:floor/floor.dart';

@dao
abstract class ContactDAO {
  @Query('SELECT * FROM Contact')
  Future<List<Contact>> getAllContact();

  @Query('SELECT * FROM Contact WHERE id=:id')
  Future<Contact> getAllContactById(int id);

  @Query('DELETE  FROM Contact')
  Future<void> deleteAllContact();

  @insert
  Future<int> insertContact(Contact Contact);

  @update
  Future<void> updateContact(Contact Contact);

  @delete
  Future<void> deleteContact(Contact Contact);
}
