
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:transaction_money/constant/constant.dart';
import 'package:transaction_money/cubit/states.dart';

class AppCubit extends Cubit<AppStates>{

  static AppCubit get(context) => BlocProvider.of(context);

  AppCubit() : super(AppInititalState());


  late Database database;
  void createDatabase() {
    openDatabase(
      'bankk.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'CREATE TABLE User (id INTEGER PRIMARY KEY, name TEXT,phone TEXT,email TEXT, balance INTEGER,transactions TEXT)');
        print('table created');
        database.execute(
            'CREATE TABLE Trans (id INTEGER PRIMARY KEY, fromName TEXT,toName TEXT, balance INTEGER)');
        print('table created');
        database.transaction((txn) async {
          await txn
              .rawInsert(
              'INSERT INTO User(name,phone,balance,email) VALUES("Mohamed Saeed","01021293583","80000","mohamedsead581@gmail.com")')
              .then((value) {
            print("$value inserted successfully");
          }).catchError((error) {
            print("error when inserting  Record ${error.toString()}");
          });
          await txn
              .rawInsert(
              'INSERT INTO User(name,phone,balance,email) VALUES("Ahmed Salem","01231255583","50000","ahmedsalem20@gmail.com")')
              .then((value) {
            print("$value inserted successfully");
          }).catchError((error) {
            print("error when inserting  Record ${error.toString()}");
          });
          await txn
              .rawInsert(
              'INSERT INTO User(name,phone,balance,email) VALUES("Mohamed Sadek","0152525981","20000","mohamedsadek201@gmail.com")')
              .then((value) {
            print("$value inserted successfully");
          }).catchError((error) {
            print("error when inserting  Record ${error.toString()}");
          });
          await txn
              .rawInsert(
              'INSERT INTO User(name,phone,balance,email) VALUES("Mohamed Shabaan","0115566801","30000","Shabaan@gmail.com")')
              .then((value) {
            print("$value inserted successfully");
          }).catchError((error) {
            print("error when inserting  Record ${error.toString()}");
          }); await txn
              .rawInsert(
              'INSERT INTO User(name,phone,balance,email) VALUES("Yhaya Saeed","01064334480","10000","yahyasaeed@gmail.com")')
              .then((value) {
            print("$value inserted successfully");
          }).catchError((error) {
            print("error when inserting  Record ${error.toString()}");
          });await txn
              .rawInsert(
              'INSERT INTO User(name,phone,balance,email) VALUES("Saeed","01064334480","1500","Saeed@gmail.com")')
              .then((value) {
            print("$value inserted successfully");
          }).catchError((error) {
            print("error when inserting  Record ${error.toString()}");
          });await txn
              .rawInsert(
              'INSERT INTO User(name,phone,balance,email) VALUES("Wael","01064334480","1000","Wael520@gmail.com")')
              .then((value) {
            print("$value inserted successfully");
          }).catchError((error) {
            print("error when inserting  Record ${error.toString()}");
          });await txn
              .rawInsert(
              'INSERT INTO User(name,phone,balance,email) VALUES("Krar","01064334480","15000","Krar2065@gmail.com")')
              .then((value) {
            print("$value inserted successfully");
          }).catchError((error) {
            print("error when inserting  Record ${error.toString()}");
          });
        });
      },
      onOpen: (database) {
        getDataFromDataBase(database);
        getDataFromHistoryDataBase(database);
       // emit(AppGetDatabaseState());

        print('database opened');
      },
    ).then((value) {
      database = value;

       emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase() async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
          'INSERT INTO User(name,phone,balance,email) VALUES("Mohamed Saeed","01021293583","12000","mohamedsead581@gmail.com")')
          .then((value) {
        print("$value inserted successfully");
        emit(AppInsertDatabaseState());

        getDataFromDataBase(database);
      }).catchError((error) {
        print("error when inserting  Record ${error.toString()}");
      });
      return null;
    });
  }

 void getDataFromDataBase(database) async {
    data = [];
   emit(AppGetDatabaseLoadingState());
     database.rawQuery('SELECT * FROM User').then((value) {
       data = value;
       print(data);
     value.forEach((element){
       print(element['balance']);
     });
       emit(AppGetDatabaseState());


     });
    print(data);
  }

  void updateData (
  {
  required int amount,
  required int id,
}) async{
     database.rawUpdate('UPDATE User SET balance = ? WHERE id = ?',
    [amount,id],
    ).then((value) {
      getDataFromDataBase(database);
      emit(AppUpdateDatabaseState());

     });
  }

  insertToHistoryDatabase({
    required String fromName,
    required String toName,
    required int balance,
}) async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
          'INSERT INTO Trans(fromName,toName ,balance ) VALUES("$fromName","$toName","$balance")')
          .then((value) {
        print("$value inserted successfully history");
        emit(AppInsertDatabaseState());

        getDataFromHistoryDataBase(database);
      }).catchError((error) {
        print("error when inserting  Record ${error.toString()}");
      });
      return null;
    });
  }

  void getDataFromHistoryDataBase(database) async {
    newData = [];
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM Trans').then((value) {
      newData = value;
      print(newData);
      value.forEach((element){
        print(element['balance']);
      });
      emit(AppGetDatabaseState());


    });
    print(newData);
  }


}










///
///   Future<void> createDatabase() async {
//     databasee =
//     await openDatabase('bank.db', version: 1, onCreate: (database, version) {
//       database
//           .execute(
//           'CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT, phone TEXT,email TEXT, accountnumber TEXT, balance INTEGER )')
//           .then((value) {
//             print('create database');
//       })
//           .catchError((error) {
//         print('error when create table ${error.toString()}');
//       });
//       database
//           .execute(
//           'CREATE TABLE trans (Tid INTEGER PRIMARY KEY, TSname TEXT, TRname TEXT, balance INTEGER )')
//           .then((value) {})
//           .catchError((error) {
//         print('error when create table ${error.toString()}');
//       });
//     }, onOpen: (databasee) {
//       getDataFromDatabase(databasee);
//       print('database opened');
//     });
//   }
//
//   Future insertDatabase() async {
//     return await databasee?.transaction((txn) async {
//
//      int id1 =  await txn
//           .rawInsert(
//         'INSERT INTO user(name,phone,email,accountnumber,balance) VALUES("Mohamed Saeed","01021293583","mohamedsead581@gmail.com","1#22","30000")',
//       );
//
//       // int id2 = await txn.rawInsert(
//       //   'INSERT INTO user(name,phone,email,accountnumber,balance) VALUES("Ahmed Salem","01032515351","Ahmedsalem1@gmail.com","1#23","10000")',
//       //
//       // );
//       // int id3 = await txn.rawInsert(
//       //   'INSERT INTO user(name,phone,email,accountnumber,balance) VALUES("Mohamed Sadek","01221293583","mohamedsadek51@gmail.com","1#24","20000")',
//       //
//       // );
//       // int id4 = await txn.rawInsert(
//       //   'INSERT INTO user(name,phone,email,accountnumber,balance) VALUES("Mohamed Shabaan","01121293583","mohamedshabaan5@gmail.com","1#25","50000")',
//       //
//       // );
//       // int id5 =await txn.rawInsert(
//       //   'INSERT INTO user(name,phone,email,accountnumber,balance) VALUES("Yahya Saeed","01064334480","yahyasead11@gmail.com","1#26","6000")',
//       //
//       // );
//       // int id6 = await txn.rawInsert(
//       //   'INSERT INTO user(name,phone,email,accountnumber,balance) VALUES("Saeed Maher","01021553683","saeedmaher88@gmail.com","1#27","8000")',
//       //
//       // );
//       // int id7 = await txn.rawInsert(
//       //   'INSERT INTO user(name,phone,email,accountnumber,balance) VALUES("Saeed","01005122957","saeedabdelrazk581@gmail.com","1#28","100000")',
//       //
//       // );
//       // int id8 = await txn.rawInsert(
//       //   'INSERT INTO user(name,phone,email,accountnumber,balance) VALUES("Sherif Ashraf ","01221293683","sherifashraf81@gmail.com","1#29","15000")',
//       //
//       // );
//       // int id9 = await txn.rawInsert(
//       //   'INSERT INTO user(name,phone,email,accountnumber,balance) VALUES("Karar","0122983583","ahmedkarar91@gmail.com","1#30","3000")',
//       //
//       // );
//       // int id10 = await txn.rawInsert(
//       //   'INSERT INTO user(name,phone,email,accountnumber,balance) VALUES("Mohamed Ahmed","01021293583","mohamedahmed581@gmail.com","1#31","4000")',
//       //
//       // );
//       // int id11 =await txn.rawInsert(
//       //   'INSERT INTO user(name,phone,email,accountnumber,balance) VALUES("Mohamed Saeed","01021293583","mohamedsead581@gmail.com","1#32","30000")',
//       //
//       // );
//     });
//   }
//
//   Future<List<Map>> getDataFromDatabase(databasee) async {
//     List<Map> users = await databasee.rawQuery('SELECT * FROM user');
//     print(users);
//     print('geeeeeeeeeeeeeet');
//
//     return users;
//   }