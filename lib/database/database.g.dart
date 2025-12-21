// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  EmployeeDAO _employeeDAOInstance;

  SalaryDAO _salarydaoInstance;

  Farmdao _farmDAOInstance;

  SpecieDAO _SpeciedaoInstance;

  AnimalDAO _AnimaldaoInstance;

  AnimalMedicineDAO _AniMeddaoInstance;

  ExpenseDAO _ExpensedaoInstance;

  ExpenseTypeDAO _EtypedaoInstance;

  SaleDAO _saledaoInstance;

  ContactDAO _contactdaoInstance;

  MachineDAO _machinedaoInstance;

  MilkProductionDAO _milkdaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Employee` (`Id` INTEGER PRIMARY KEY AUTOINCREMENT, `SalaryId` INTEGER, `photo` TEXT, `name` TEXT, `Address` TEXT, `Email` TEXT, `phonenumber` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Salary` (`Id` INTEGER PRIMARY KEY AUTOINCREMENT, `BasicPay` TEXT, `TotalSalary` TEXT, `WorkingHours` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Farm` (`FarmId` INTEGER PRIMARY KEY AUTOINCREMENT, `date` TEXT, `farmName` TEXT, `farmAddress` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Specie` (`SpecieId` INTEGER, `Name` TEXT, PRIMARY KEY (`SpecieId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Animal` (`Id` INTEGER PRIMARY KEY AUTOINCREMENT, `SpecieId` INTEGER, `name` TEXT, `FatherName` TEXT, `MotherName` TEXT, `Sex` TEXT, `DOB` TEXT, `DateofPurchase` TEXT, `DateLost` TEXT, `ReaasonLost` TEXT, `AnimalStatus` TEXT, `puchasefrom` TEXT, `price` TEXT, `photo` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AnimalMedicine` (`Id` INTEGER PRIMARY KEY AUTOINCREMENT, `Name` TEXT, `Type` TEXT, `Reasons` TEXT, `Symptoms` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Expense` (`Id` INTEGER, `name` TEXT, `Amount` TEXT, `date` TEXT, PRIMARY KEY (`Id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ExpenseType` (`ETypeId` INTEGER, `name` TEXT, PRIMARY KEY (`ETypeId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Sale` (`Id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` TEXT, `name` TEXT, `itemName` TEXT, `Type` TEXT, `ItemPrice` TEXT, `purchasefrom` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Contact` (`ContactId` INTEGER PRIMARY KEY AUTOINCREMENT, `Contactname` TEXT, `Address` TEXT, `Email` TEXT, `URL` TEXT, `Phone` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Machine` (`Id` INTEGER PRIMARY KEY AUTOINCREMENT, `Machinename` TEXT, `MachineType` TEXT, `PurchaseDate` TEXT, `MachinePrice` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MilkProduction` (`Id` INTEGER PRIMARY KEY AUTOINCREMENT, `MilkType` TEXT, `TotalMilkProduce` TEXT, `TotalMilkSale` TEXT, `cattle` TEXT, `date` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Contact` (`ContactId` INTEGER PRIMARY KEY AUTOINCREMENT, `Contactname` TEXT, `Address` TEXT, `Email` TEXT, `URL` TEXT, `Phone` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  EmployeeDAO get employeeDAO {
    return _employeeDAOInstance ??= _$EmployeeDAO(database, changeListener);
  }

  @override
  SalaryDAO get salarydao {
    return _salarydaoInstance ??= _$SalaryDAO(database, changeListener);
  }

  @override
  Farmdao get farmDAO {
    return _farmDAOInstance ??= _$Farmdao(database, changeListener);
  }

  @override
  SpecieDAO get Speciedao {
    return _SpeciedaoInstance ??= _$SpecieDAO(database, changeListener);
  }

  @override
  AnimalDAO get Animaldao {
    return _AnimaldaoInstance ??= _$AnimalDAO(database, changeListener);
  }

  @override
  AnimalMedicineDAO get AniMeddao {
    return _AniMeddaoInstance ??= _$AnimalMedicineDAO(database, changeListener);
  }

  @override
  ExpenseDAO get Expensedao {
    return _ExpensedaoInstance ??= _$ExpenseDAO(database, changeListener);
  }

  @override
  ExpenseTypeDAO get Etypedao {
    return _EtypedaoInstance ??= _$ExpenseTypeDAO(database, changeListener);
  }

  @override
  SaleDAO get saledao {
    return _saledaoInstance ??= _$SaleDAO(database, changeListener);
  }

  @override
  ContactDAO get contactdao {
    return _contactdaoInstance ??= _$ContactDAO(database, changeListener);
  }

  @override
  MachineDAO get machinedao {
    return _machinedaoInstance ??= _$MachineDAO(database, changeListener);
  }

  @override
  MilkProductionDAO get milkdao {
    return _milkdaoInstance ??= _$MilkProductionDAO(database, changeListener);
  }
}

class _$EmployeeDAO extends EmployeeDAO {
  _$EmployeeDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _employeeInsertionAdapter = InsertionAdapter(
            database,
            'Employee',
            (Employee item) => <String, dynamic>{
                  'Id': item.Id,
                  'SalaryId': item.SalaryId,
                  'photo': item.photo,
                  'name': item.name,
                  'Address': item.Address,
                  'Email': item.Email,
                  'phonenumber': item.phonenumber
                }),
        _employeeUpdateAdapter = UpdateAdapter(
            database,
            'Employee',
            ['Id'],
            (Employee item) => <String, dynamic>{
                  'Id': item.Id,
                  'SalaryId': item.SalaryId,
                  'photo': item.photo,
                  'name': item.name,
                  'Address': item.Address,
                  'Email': item.Email,
                  'phonenumber': item.phonenumber
                }),
        _employeeDeletionAdapter = DeletionAdapter(
            database,
            'Employee',
            ['Id'],
            (Employee item) => <String, dynamic>{
                  'Id': item.Id,
                  'SalaryId': item.SalaryId,
                  'photo': item.photo,
                  'name': item.name,
                  'Address': item.Address,
                  'Email': item.Email,
                  'phonenumber': item.phonenumber
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Employee> _employeeInsertionAdapter;

  final UpdateAdapter<Employee> _employeeUpdateAdapter;

  final DeletionAdapter<Employee> _employeeDeletionAdapter;

  @override
  Future<List<Employee>> getAllEmployee() async {
    return _queryAdapter.queryList('SELECT * FROM Employee',
        mapper: (Map<String, dynamic> row) => Employee(
            row['Id'] as int,
            row['name'] as String,
            row['Address'] as String,
            row['Email'] as String,
            row['phonenumber'] as String,
            row['photo'] as String,
            row['SalaryId'] as int));
  }

  @override
  Future<Employee> getAllEmployeeById(int id) async {
    return _queryAdapter.query('SELECT * FROM Employee WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Employee(
            row['Id'] as int,
            row['name'] as String,
            row['Address'] as String,
            row['Email'] as String,
            row['phonenumber'] as String,
            row['photo'] as String,
            row['SalaryId'] as int));
  }

  @override
  Future<void> deleteAllEmployee() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Employee');
  }

  @override
  Future<int> insertEmployee(Employee Employee) {
    return _employeeInsertionAdapter.insertAndReturnId(
        Employee, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateEmployee(Employee Employee) async {
    await _employeeUpdateAdapter.update(Employee, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteEmployee(Employee Employee) async {
    await _employeeDeletionAdapter.delete(Employee);
  }
}

class _$SalaryDAO extends SalaryDAO {
  _$SalaryDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _salaryInsertionAdapter = InsertionAdapter(
            database,
            'Salary',
            (Salary item) => <String, dynamic>{
                  'Id': item.Id,
                  'BasicPay': item.BasicPay,
                  'TotalSalary': item.TotalSalary,
                  'WorkingHours': item.WorkingHours
                }),
        _salaryUpdateAdapter = UpdateAdapter(
            database,
            'Salary',
            ['Id'],
            (Salary item) => <String, dynamic>{
                  'Id': item.Id,
                  'BasicPay': item.BasicPay,
                  'TotalSalary': item.TotalSalary,
                  'WorkingHours': item.WorkingHours
                }),
        _salaryDeletionAdapter = DeletionAdapter(
            database,
            'Salary',
            ['Id'],
            (Salary item) => <String, dynamic>{
                  'Id': item.Id,
                  'BasicPay': item.BasicPay,
                  'TotalSalary': item.TotalSalary,
                  'WorkingHours': item.WorkingHours
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Salary> _salaryInsertionAdapter;

  final UpdateAdapter<Salary> _salaryUpdateAdapter;

  final DeletionAdapter<Salary> _salaryDeletionAdapter;

  @override
  Future<List<Salary>> getAllSalary() async {
    return _queryAdapter.queryList('SELECT * FROM Salary',
        mapper: (Map<String, dynamic> row) => Salary(
            row['Id'] as int,
            row['BasicPay'] as String,
            row['TotalSalary'] as String,
            row['WorkingHours'] as String));
  }

  @override
  Future<Salary> getAllSalaryById(int id) async {
    return _queryAdapter.query('SELECT * FROM Salary WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Salary(
            row['Id'] as int,
            row['BasicPay'] as String,
            row['TotalSalary'] as String,
            row['WorkingHours'] as String));
  }

  @override
  Future<void> deleteAllSalary() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Salary');
  }

  @override
  Future<int> insertSalary(Salary Salary) {
    return _salaryInsertionAdapter.insertAndReturnId(
        Salary, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSalary(Salary Salary) async {
    await _salaryUpdateAdapter.update(Salary, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSalary(Salary Salary) async {
    await _salaryDeletionAdapter.delete(Salary);
  }
}

class _$Farmdao extends Farmdao {
  _$Farmdao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _farmInsertionAdapter = InsertionAdapter(
            database,
            'Farm',
            (Farm item) => <String, dynamic>{
                  'FarmId': item.FarmId,
                  'date': item.date,
                  'farmName': item.farmName,
                  'farmAddress': item.farmAddress
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Farm> _farmInsertionAdapter;

  @override
  Future<List<Farm>> findAllFarm() async {
    return _queryAdapter.queryList('Select * From farm',
        mapper: (Map<String, dynamic> row) => Farm(row['date'] as String,
            row['farmName'] as String, row['farmAddress'] as String));
  }

  @override
  Future<Farm> findFarmById(int id) async {
    return _queryAdapter.query('SELECT * FROM farm WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Farm(row['date'] as String,
            row['farmName'] as String, row['farmAddress'] as String));
  }

  @override
  Future<int> insertFarm(Farm farm) {
    return _farmInsertionAdapter.insertAndReturnId(
        farm, OnConflictStrategy.abort);
  }
}

class _$SpecieDAO extends SpecieDAO {
  _$SpecieDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _specieInsertionAdapter = InsertionAdapter(
            database,
            'Specie',
            (Specie item) =>
                <String, dynamic>{'SpecieId': item.SpecieId, 'Name': item.Name},
            changeListener),
        _specieUpdateAdapter = UpdateAdapter(
            database,
            'Specie',
            ['SpecieId'],
            (Specie item) =>
                <String, dynamic>{'SpecieId': item.SpecieId, 'Name': item.Name},
            changeListener),
        _specieDeletionAdapter = DeletionAdapter(
            database,
            'Specie',
            ['SpecieId'],
            (Specie item) =>
                <String, dynamic>{'SpecieId': item.SpecieId, 'Name': item.Name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Specie> _specieInsertionAdapter;

  final UpdateAdapter<Specie> _specieUpdateAdapter;

  final DeletionAdapter<Specie> _specieDeletionAdapter;

  @override
  Stream<List<Specie>> getAllSpecie() {
    return _queryAdapter.queryListStream('SELECT * FROM Specie',
        queryableName: 'Specie',
        isView: false,
        mapper: (Map<String, dynamic> row) => Specie(row['Name'] as String));
  }

  @override
  Future<Specie> getAllSpecieById(int id) async {
    return _queryAdapter.query('SELECT * FROM Specie WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Specie(row['Name'] as String));
  }

  @override
  Future<void> deleteAllSpecie() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Specie');
  }

  @override
  Future<int> insertSpecie(Specie Specie) {
    return _specieInsertionAdapter.insertAndReturnId(
        Specie, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSpecie(Specie Specie) async {
    await _specieUpdateAdapter.update(Specie, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSpecie(Specie Specie) async {
    await _specieDeletionAdapter.delete(Specie);
  }
}

class _$AnimalDAO extends AnimalDAO {
  _$AnimalDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _animalInsertionAdapter = InsertionAdapter(
            database,
            'Animal',
            (Animal item) => <String, dynamic>{
                  'Id': item.Id,
                  'SpecieId': item.SpecieId,
                  'name': item.name,
                  'FatherName': item.FatherName,
                  'MotherName': item.MotherName,
                  'Sex': item.Sex,
                  'DOB': item.DOB,
                  'DateofPurchase': item.DateofPurchase,
                  'DateLost': item.DateLost,
                  'ReaasonLost': item.ReaasonLost,
                  'AnimalStatus': item.AnimalStatus,
                  'puchasefrom': item.puchasefrom,
                  'price': item.price,
                  'photo': item.photo
                }),
        _animalUpdateAdapter = UpdateAdapter(
            database,
            'Animal',
            ['Id'],
            (Animal item) => <String, dynamic>{
                  'Id': item.Id,
                  'SpecieId': item.SpecieId,
                  'name': item.name,
                  'FatherName': item.FatherName,
                  'MotherName': item.MotherName,
                  'Sex': item.Sex,
                  'DOB': item.DOB,
                  'DateofPurchase': item.DateofPurchase,
                  'DateLost': item.DateLost,
                  'ReaasonLost': item.ReaasonLost,
                  'AnimalStatus': item.AnimalStatus,
                  'puchasefrom': item.puchasefrom,
                  'price': item.price,
                  'photo': item.photo
                }),
        _animalDeletionAdapter = DeletionAdapter(
            database,
            'Animal',
            ['Id'],
            (Animal item) => <String, dynamic>{
                  'Id': item.Id,
                  'SpecieId': item.SpecieId,
                  'name': item.name,
                  'FatherName': item.FatherName,
                  'MotherName': item.MotherName,
                  'Sex': item.Sex,
                  'DOB': item.DOB,
                  'DateofPurchase': item.DateofPurchase,
                  'DateLost': item.DateLost,
                  'ReaasonLost': item.ReaasonLost,
                  'AnimalStatus': item.AnimalStatus,
                  'puchasefrom': item.puchasefrom,
                  'price': item.price,
                  'photo': item.photo
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Animal> _animalInsertionAdapter;

  final UpdateAdapter<Animal> _animalUpdateAdapter;

  final DeletionAdapter<Animal> _animalDeletionAdapter;

  @override
  Future<List<Animal>> getAllAnimal() async {
    return _queryAdapter.queryList('SELECT * FROM Animal',
        mapper: (Map<String, dynamic> row) => Animal(
            row['Id'] as int,
            row['name'] as String,
            row['AnimalStatus'] as String,
            row['DateLost'] as String,
            row['DateofPurchase'] as String,
            row['DOB'] as String,
            row['FatherName'] as String,
            row['MotherName'] as String,
            row['price'] as String,
            row['ReaasonLost'] as String,
            row['Sex'] as String,
            row['SpecieId'] as int,
            row['photo'] as String,
            row['puchasefrom'] as String));
  }

  @override
  Future<Animal> getAllAnimalById(int id) async {
    return _queryAdapter.query('SELECT * FROM Animal WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Animal(
            row['Id'] as int,
            row['name'] as String,
            row['AnimalStatus'] as String,
            row['DateLost'] as String,
            row['DateofPurchase'] as String,
            row['DOB'] as String,
            row['FatherName'] as String,
            row['MotherName'] as String,
            row['price'] as String,
            row['ReaasonLost'] as String,
            row['Sex'] as String,
            row['SpecieId'] as int,
            row['photo'] as String,
            row['puchasefrom'] as String));
  }

  @override
  Future<void> deleteAllAnimal() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Animal');
  }

  @override
  Future<int> insertAnimal(Animal Animal) {
    return _animalInsertionAdapter.insertAndReturnId(
        Animal, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAnimal(Animal Animal) async {
    await _animalUpdateAdapter.update(Animal, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteAnimal(Animal Animal) async {
    await _animalDeletionAdapter.delete(Animal);
  }
}

class _$AnimalMedicineDAO extends AnimalMedicineDAO {
  _$AnimalMedicineDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _animalMedicineInsertionAdapter = InsertionAdapter(
            database,
            'AnimalMedicine',
            (AnimalMedicine item) => <String, dynamic>{
                  'Id': item.Id,
                  'Name': item.Name,
                  'Type': item.Type,
                  'Reasons': item.Reasons,
                  'Symptoms': item.Symptoms
                }),
        _animalMedicineUpdateAdapter = UpdateAdapter(
            database,
            'AnimalMedicine',
            ['Id'],
            (AnimalMedicine item) => <String, dynamic>{
                  'Id': item.Id,
                  'Name': item.Name,
                  'Type': item.Type,
                  'Reasons': item.Reasons,
                  'Symptoms': item.Symptoms
                }),
        _animalMedicineDeletionAdapter = DeletionAdapter(
            database,
            'AnimalMedicine',
            ['Id'],
            (AnimalMedicine item) => <String, dynamic>{
                  'Id': item.Id,
                  'Name': item.Name,
                  'Type': item.Type,
                  'Reasons': item.Reasons,
                  'Symptoms': item.Symptoms
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AnimalMedicine> _animalMedicineInsertionAdapter;

  final UpdateAdapter<AnimalMedicine> _animalMedicineUpdateAdapter;

  final DeletionAdapter<AnimalMedicine> _animalMedicineDeletionAdapter;

  @override
  Future<List<AnimalMedicine>> getAllAnimalMedicine() async {
    return _queryAdapter.queryList('SELECT * FROM AnimalMedicine',
        mapper: (Map<String, dynamic> row) => AnimalMedicine(
            row['Id'] as int,
            row['Symptoms'] as String,
            row['Reasons'] as String,
            row['Name'] as String,
            row['Type'] as String));
  }

  @override
  Future<AnimalMedicine> getAllAnimalMedicineById(int id) async {
    return _queryAdapter.query('SELECT * FROM AnimalMedicine WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => AnimalMedicine(
            row['Id'] as int,
            row['Symptoms'] as String,
            row['Reasons'] as String,
            row['Name'] as String,
            row['Type'] as String));
  }

  @override
  Future<void> deleteAllAnimalMedicine() async {
    await _queryAdapter.queryNoReturn('DELETE FROM AnimalMedicine');
  }

  @override
  Future<int> insertAnimalMedicine(AnimalMedicine AniMedicine) {
    return _animalMedicineInsertionAdapter.insertAndReturnId(
        AniMedicine, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAnimalMedicine(AnimalMedicine AniMedicine) async {
    await _animalMedicineUpdateAdapter.update(
        AniMedicine, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteAnimalMedicine(AnimalMedicine AniMedicine) async {
    await _animalMedicineDeletionAdapter.delete(AniMedicine);
  }
}

class _$ExpenseDAO extends ExpenseDAO {
  _$ExpenseDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _expenseInsertionAdapter = InsertionAdapter(
            database,
            'Expense',
            (Expense item) => <String, dynamic>{
                  'Id': item.Id,
                  'name': item.name,
                  'Amount': item.Amount,
                  'date': item.date
                }),
        _expenseUpdateAdapter = UpdateAdapter(
            database,
            'Expense',
            ['Id'],
            (Expense item) => <String, dynamic>{
                  'Id': item.Id,
                  'name': item.name,
                  'Amount': item.Amount,
                  'date': item.date
                }),
        _expenseDeletionAdapter = DeletionAdapter(
            database,
            'Expense',
            ['Id'],
            (Expense item) => <String, dynamic>{
                  'Id': item.Id,
                  'name': item.name,
                  'Amount': item.Amount,
                  'date': item.date
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Expense> _expenseInsertionAdapter;

  final UpdateAdapter<Expense> _expenseUpdateAdapter;

  final DeletionAdapter<Expense> _expenseDeletionAdapter;

  @override
  Future<List<Expense>> getAllExpense() async {
    return _queryAdapter.queryList('SELECT * FROM Expense',
        mapper: (Map<String, dynamic> row) => Expense(
            row['Id'] as int,
            row['name'] as String,
            row['Amount'] as String,
            row['date'] as String));
  }

  @override
  Future<Expense> getAllExpenseById(int id) async {
    return _queryAdapter.query('SELECT * FROM Expense WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Expense(
            row['Id'] as int,
            row['name'] as String,
            row['Amount'] as String,
            row['date'] as String));
  }

  @override
  Future<void> deleteAllExpense() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Expense');
  }

  @override
  Future<int> insertExpense(Expense Expense) {
    return _expenseInsertionAdapter.insertAndReturnId(
        Expense, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateExpense(Expense Expense) async {
    await _expenseUpdateAdapter.update(Expense, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteExpense(Expense Expense) async {
    await _expenseDeletionAdapter.delete(Expense);
  }
}

class _$ExpenseTypeDAO extends ExpenseTypeDAO {
  _$ExpenseTypeDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _expenseTypeInsertionAdapter = InsertionAdapter(
            database,
            'ExpenseType',
            (ExpenseType item) =>
                <String, dynamic>{'ETypeId': item.ETypeId, 'name': item.name}),
        _expenseTypeUpdateAdapter = UpdateAdapter(
            database,
            'ExpenseType',
            ['ETypeId'],
            (ExpenseType item) =>
                <String, dynamic>{'ETypeId': item.ETypeId, 'name': item.name}),
        _expenseTypeDeletionAdapter = DeletionAdapter(
            database,
            'ExpenseType',
            ['ETypeId'],
            (ExpenseType item) =>
                <String, dynamic>{'ETypeId': item.ETypeId, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ExpenseType> _expenseTypeInsertionAdapter;

  final UpdateAdapter<ExpenseType> _expenseTypeUpdateAdapter;

  final DeletionAdapter<ExpenseType> _expenseTypeDeletionAdapter;

  @override
  Future<List<ExpenseType>> getAllExpense() async {
    return _queryAdapter.queryList('SELECT * FROM ExpenseType',
        mapper: (Map<String, dynamic> row) =>
            ExpenseType(row['name'] as String));
  }

  @override
  Future<ExpenseType> getAllExpenseTypeById(int id) async {
    return _queryAdapter.query('SELECT * FROM ExpenseType WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) =>
            ExpenseType(row['name'] as String));
  }

  @override
  Future<void> deleteAllExpenseType() async {
    await _queryAdapter.queryNoReturn('DELETE FROM ExpenseType');
  }

  @override
  Future<int> insertExpenseType(ExpenseType ExpenseType) {
    return _expenseTypeInsertionAdapter.insertAndReturnId(
        ExpenseType, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateExpenseType(ExpenseType ExpenseType) async {
    await _expenseTypeUpdateAdapter.update(
        ExpenseType, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteExpenseType(ExpenseType ExpenseType) async {
    await _expenseTypeDeletionAdapter.delete(ExpenseType);
  }
}

class _$SaleDAO extends SaleDAO {
  _$SaleDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _saleInsertionAdapter = InsertionAdapter(
            database,
            'Sale',
            (Sale item) => <String, dynamic>{
                  'Id': item.Id,
                  'date': item.date,
                  'name': item.name,
                  'itemName': item.itemName,
                  'Type': item.Type,
                  'ItemPrice': item.ItemPrice,
                  'purchasefrom': item.purchasefrom
                }),
        _saleUpdateAdapter = UpdateAdapter(
            database,
            'Sale',
            ['Id'],
            (Sale item) => <String, dynamic>{
                  'Id': item.Id,
                  'date': item.date,
                  'name': item.name,
                  'itemName': item.itemName,
                  'Type': item.Type,
                  'ItemPrice': item.ItemPrice,
                  'purchasefrom': item.purchasefrom
                }),
        _saleDeletionAdapter = DeletionAdapter(
            database,
            'Sale',
            ['Id'],
            (Sale item) => <String, dynamic>{
                  'Id': item.Id,
                  'date': item.date,
                  'name': item.name,
                  'itemName': item.itemName,
                  'Type': item.Type,
                  'ItemPrice': item.ItemPrice,
                  'purchasefrom': item.purchasefrom
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Sale> _saleInsertionAdapter;

  final UpdateAdapter<Sale> _saleUpdateAdapter;

  final DeletionAdapter<Sale> _saleDeletionAdapter;

  @override
  Future<List<Sale>> getAllSale() async {
    return _queryAdapter.queryList('SELECT * FROM Sale',
        mapper: (Map<String, dynamic> row) => Sale(
            row['Id'] as int,
            row['date'] as String,
            row['name'] as String,
            row['ItemPrice'] as String,
            row['itemName'] as String,
            row['Type'] as String,
            row['purchasefrom'] as String));
  }

  @override
  Future<Sale> getAllSaleById(int id) async {
    return _queryAdapter.query('SELECT * FROM Sale WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Sale(
            row['Id'] as int,
            row['date'] as String,
            row['name'] as String,
            row['ItemPrice'] as String,
            row['itemName'] as String,
            row['Type'] as String,
            row['purchasefrom'] as String));
  }

  @override
  Future<void> deleteAllSale() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Sale');
  }

  @override
  Future<int> insertSale(Sale Sale) {
    return _saleInsertionAdapter.insertAndReturnId(
        Sale, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSale(Sale Sale) async {
    await _saleUpdateAdapter.update(Sale, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSale(Sale Sale) async {
    await _saleDeletionAdapter.delete(Sale);
  }
}

class _$ContactDAO extends ContactDAO {
  _$ContactDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _contactInsertionAdapter = InsertionAdapter(
            database,
            'Contact',
            (Contact item) => <String, dynamic>{
                  'ContactId': item.ContactId,
                  'Contactname': item.Contactname,
                  'Address': item.Address,
                  'Email': item.Email,
                  'URL': item.URL,
                  'Phone': item.Phone
                }),
        _contactUpdateAdapter = UpdateAdapter(
            database,
            'Contact',
            ['ContactId'],
            (Contact item) => <String, dynamic>{
                  'ContactId': item.ContactId,
                  'Contactname': item.Contactname,
                  'Address': item.Address,
                  'Email': item.Email,
                  'URL': item.URL,
                  'Phone': item.Phone
                }),
        _contactDeletionAdapter = DeletionAdapter(
            database,
            'Contact',
            ['ContactId'],
            (Contact item) => <String, dynamic>{
                  'ContactId': item.ContactId,
                  'Contactname': item.Contactname,
                  'Address': item.Address,
                  'Email': item.Email,
                  'URL': item.URL,
                  'Phone': item.Phone
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Contact> _contactInsertionAdapter;

  final UpdateAdapter<Contact> _contactUpdateAdapter;

  final DeletionAdapter<Contact> _contactDeletionAdapter;

  @override
  Future<List<Contact>> getAllContact() async {
    return _queryAdapter.queryList('SELECT * FROM Contact',
        mapper: (Map<String, dynamic> row) => Contact(
            row['Contactname'] as String,
            row['Address'] as String,
            row['Phone'] as String,
            row['Email'] as String,
            row['URL'] as String));
  }

  @override
  Future<Contact> getAllContactById(int id) async {
    return _queryAdapter.query('SELECT * FROM Contact WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Contact(
            row['Contactname'] as String,
            row['Address'] as String,
            row['Phone'] as String,
            row['Email'] as String,
            row['URL'] as String));
  }

  @override
  Future<void> deleteAllContact() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Contact');
  }

  @override
  Future<int> insertContact(Contact Contact) {
    return _contactInsertionAdapter.insertAndReturnId(
        Contact, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateContact(Contact Contact) async {
    await _contactUpdateAdapter.update(Contact, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteContact(Contact Contact) async {
    await _contactDeletionAdapter.delete(Contact);
  }
}

class _$MachineDAO extends MachineDAO {
  _$MachineDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _machineInsertionAdapter = InsertionAdapter(
            database,
            'Machine',
            (Machine item) => <String, dynamic>{
                  'Id': item.Id,
                  'Machinename': item.Machinename,
                  'MachineType': item.MachineType,
                  'PurchaseDate': item.PurchaseDate,
                  'MachinePrice': item.MachinePrice
                }),
        _machineUpdateAdapter = UpdateAdapter(
            database,
            'Machine',
            ['Id'],
            (Machine item) => <String, dynamic>{
                  'Id': item.Id,
                  'Machinename': item.Machinename,
                  'MachineType': item.MachineType,
                  'PurchaseDate': item.PurchaseDate,
                  'MachinePrice': item.MachinePrice
                }),
        _machineDeletionAdapter = DeletionAdapter(
            database,
            'Machine',
            ['Id'],
            (Machine item) => <String, dynamic>{
                  'Id': item.Id,
                  'Machinename': item.Machinename,
                  'MachineType': item.MachineType,
                  'PurchaseDate': item.PurchaseDate,
                  'MachinePrice': item.MachinePrice
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Machine> _machineInsertionAdapter;

  final UpdateAdapter<Machine> _machineUpdateAdapter;

  final DeletionAdapter<Machine> _machineDeletionAdapter;

  @override
  Future<List<Machine>> getAllMachine() async {
    return _queryAdapter.queryList('SELECT * FROM Machine',
        mapper: (Map<String, dynamic> row) => Machine(
            row['Id'] as int,
            row['Machinename'] as String,
            row['MachineType'] as String,
            row['PurchaseDate'] as String,
            row['MachinePrice'] as String));
  }

  @override
  Future<Machine> getAllMachineById(int id) async {
    return _queryAdapter.query('SELECT * FROM Machine WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Machine(
            row['Id'] as int,
            row['Machinename'] as String,
            row['MachineType'] as String,
            row['PurchaseDate'] as String,
            row['MachinePrice'] as String));
  }

  @override
  Future<void> deleteAllMachine() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Machine');
  }

  @override
  Future<int> insertMachine(Machine Machine) {
    return _machineInsertionAdapter.insertAndReturnId(
        Machine, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMachine(Machine Machine) async {
    await _machineUpdateAdapter.update(Machine, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMachine(Machine Machine) async {
    await _machineDeletionAdapter.delete(Machine);
  }
}

class _$MilkProductionDAO extends MilkProductionDAO {
  _$MilkProductionDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _milkProductionInsertionAdapter = InsertionAdapter(
            database,
            'MilkProduction',
            (MilkProduction item) => <String, dynamic>{
                  'Id': item.Id,
                  'MilkType': item.MilkType,
                  'TotalMilkProduce': item.TotalMilkProduce,
                  'TotalMilkSale': item.TotalMilkSale,
                  'cattle': item.cattle,
                  'date': item.date
                }),
        _milkProductionUpdateAdapter = UpdateAdapter(
            database,
            'MilkProduction',
            ['Id'],
            (MilkProduction item) => <String, dynamic>{
                  'Id': item.Id,
                  'MilkType': item.MilkType,
                  'TotalMilkProduce': item.TotalMilkProduce,
                  'TotalMilkSale': item.TotalMilkSale,
                  'cattle': item.cattle,
                  'date': item.date
                }),
        _milkProductionDeletionAdapter = DeletionAdapter(
            database,
            'MilkProduction',
            ['Id'],
            (MilkProduction item) => <String, dynamic>{
                  'Id': item.Id,
                  'MilkType': item.MilkType,
                  'TotalMilkProduce': item.TotalMilkProduce,
                  'TotalMilkSale': item.TotalMilkSale,
                  'cattle': item.cattle,
                  'date': item.date
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MilkProduction> _milkProductionInsertionAdapter;

  final UpdateAdapter<MilkProduction> _milkProductionUpdateAdapter;

  final DeletionAdapter<MilkProduction> _milkProductionDeletionAdapter;

  @override
  Future<List<MilkProduction>> getAllMilkProduction() async {
    return _queryAdapter.queryList('SELECT * FROM MilkProduction',
        mapper: (Map<String, dynamic> row) => MilkProduction(
            row['Id'] as int,
            row['MilkType'] as String,
            row['TotalMilkProduce'] as String,
            row['TotalMilkSale'] as String,
            row['cattle'] as String,
            row['date'] as String));
  }

  @override
  Future<MilkProduction> getAllMilkProductionById(int id) async {
    return _queryAdapter.query('SELECT * FROM MilkProduction WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => MilkProduction(
            row['Id'] as int,
            row['MilkType'] as String,
            row['TotalMilkProduce'] as String,
            row['TotalMilkSale'] as String,
            row['cattle'] as String,
            row['date'] as String));
  }

  @override
  Future<void> deleteAllMilkProduction() async {
    await _queryAdapter.queryNoReturn('DELETE FROM MilkProduction');
  }

  @override
  Future<int> insertMilkProduction(MilkProduction MilkProduction) {
    return _milkProductionInsertionAdapter.insertAndReturnId(
        MilkProduction, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMilkProduction(MilkProduction MilkProduction) async {
    await _milkProductionUpdateAdapter.update(
        MilkProduction, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMilkProduction(MilkProduction MilkProduction) async {
    await _milkProductionDeletionAdapter.delete(MilkProduction);
  }
}
