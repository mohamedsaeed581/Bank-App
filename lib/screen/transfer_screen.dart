import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_money/constant/constant.dart';
import 'package:transaction_money/cubit/cubit.dart';
import 'package:transaction_money/cubit/states.dart';
import 'package:transaction_money/model/model.dart';
import 'package:transaction_money/screen/Confirmation.dart';

class TransferScreen extends StatefulWidget {
  final int amount;
  final int id;
  final String name;
  TransferScreen({Key? key, required this.amount, required this.id, required this.name, }) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState(name,id,amount);
}

class _TransferScreenState extends State<TransferScreen> {
  String? name;
   int? amount;
   int? id;
  _TransferScreenState(String name, int id, int amount,){
    this.name = name;
    this.id = id;
    this.amount = amount;
    // selectItem = items[0] as String?;
  }
  var amountController = TextEditingController();

var formKey = GlobalKey<FormState>();
///'Mohamed saeed','Ahmed Salem','Mohamed Sadek','Mohamed Shabaan','Yhaya Saeed','Saeed','Wael','Krar'
  List items = [ {
    'id': '1',
    'name': 'Mohamed saeed',
    'balance': '${data[0]['balance']}',
  },
    {
      'id': '2',
      'name': 'Ahmed Salem',
      'balance': '${data[1]['balance']}',
    },
    {
      'id': '3',
      'name': 'Mohamed Sadek',
      'balance': '${data[2]['balance']}',
    },
    {
      'id': '4',
      'name': 'Mohamed Shabaan',
      'balance': '${data[3]['balance']}',
    },
    {
      'id': '6',
      'name': 'Yhaya Saeed',
      'balance': '${data[4]['balance']}',
    },
    {
      'id': '7',
      'name': 'Saeed',
      'balance': '${data[5]['balance']}',
    }, {
      'id': '8',
      'name': 'Wael',
      'balance': '${data[6]['balance']}',
    }, {
      'id': '9',
      'name': 'Krar',
      'balance': '${data[7]['balance']}',
    },
  ];

dynamic userId ;
  //String? selectItem = 'Mohamed Saeed';

  @override
  Widget build(BuildContext context,) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
       return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xff0c9869),
            title: Text('Transfer'),
          ),
          body: Form(
            key: formKey,
            child: Column(
              children: [
                Spacer(
                  flex: 4,
                ),
                Text(
                  'To',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(
                  flex: 1,
                ),
                DropdownButton(
                    value: userId,
                    items: items.map((e){
                  return DropdownMenuItem(child: Text(e['name']),value: e,);
                }).toList(),
                    onChanged: (dynamic val){
                      userId = val;
                }),
                // AwesomeDropDown(dropDownList: items,
                //  selectedItem: '$selectItem',
                //
                // ),


                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: TextFormField(
                //       style: Theme.of(context).textTheme.bodyText2,
                //       validator: (value) {
                //         if (value!.isEmpty) return ' must be not empty';
                //         return null;
                //       },
                //       onSaved: (value) {},
                //       onChanged: (value) {},
                //       keyboardType: TextInputType.text,
                //       decoration: InputDecoration(
                //         focusedBorder: OutlineInputBorder(),
                //         //labelText: 'Search',
                //         //hintText: 'Search',
                //         labelStyle: TextStyle(color: Color(0xff0c9869)),
                //         // prefixIcon: Icon(Icons.search, color: Color(0xff0c9869),),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20)),
                //       )),
                // ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  'Amount',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),

                  child: TextFormField(
                      controller: amountController,
                      style: Theme.of(context).textTheme.bodyText2,
                      validator: (value) {
                        if (value!.isEmpty) return ' must be not empty';
                        else if (int.tryParse(value) !> widget.amount){
                          return 'enter right amount';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                      onChanged: (value) {},
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          // borderRadius: BorderRadius.circular(25.0),
                        ),
                        //labelText: 'Search',
                        //hintText: 'Search',
                        labelStyle: TextStyle(color: Color(0xff0c9869)),
                        //prefixIcon: Icon(Icons.search, color: Color(0xff0c9869),),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )),
                ),
                ///
                ///
                // DropdownButton<String>(
                //     value: selectItem,
                //     items: items.map((item) => DropdownMenuItem<String>(
                //         value: item,
                //         child: Text(
                //           item,
                //           style: TextStyle(fontSize: 24),
                //         ))).toList(),
                //     onChanged: (item){
                //       setState(() {
                //         selectItem= item;
                //       });
                //     }),
                // AwesomeDropDown(dropDownList: items,
                //   selectedItem: '$selectItem',
                // ),

                Spacer(
                  flex: 1,
                ),
                ElevatedButton(
                  onPressed: () {
                    int newAmount = amount! - int.parse(amountController.text);
                    int newAmount2 = int.parse(userId['balance']) + int.parse(amountController.text);
                    print(newAmount + id!);
                    print('dddddd + ${userId['name']}');
                    print('balanceeee + ${userId['balance']}');
                    print('balanceeee + $newAmount2');
                    // print('iddddddddddd ${selectItem!.}');
                    if(formKey.currentState!.validate())
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmScreen()));
                      AppCubit.get(context).updateData(amount: newAmount, id: id!);
                      AppCubit.get(context).updateData(amount: newAmount2, id: int.parse(userId['id']));
                      print(int.parse(amountController.text));
                      print('$name');
                     // print('$selectItem');
                     AppCubit.get(context).insertToHistoryDatabase(balance:int.parse(amountController.text),fromName:'$name',toName: '${userId['name']}' );

                    }
                    else{}
                  },
                  child: Text(
                    'Transfer Money',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff0c9869),
                      minimumSize: Size(120, 60),
                      elevation: 10),
                ),
                Spacer(
                  flex: 4,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
