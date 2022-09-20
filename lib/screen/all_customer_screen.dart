import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:transaction_money/constant/constant.dart';
import 'package:transaction_money/constant/constant.dart';
import 'package:transaction_money/cubit/cubit.dart';
import 'package:transaction_money/cubit/states.dart';
import 'package:transaction_money/screen/customer_screen.dart';

class AllCustomerScreen extends StatefulWidget {
  const AllCustomerScreen({Key? key}) : super(key: key);

  @override
  State<AllCustomerScreen> createState() => _AllCustomerScreenState();
}

class _AllCustomerScreenState extends State<AllCustomerScreen> {
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state){},
        builder: (BuildContext context,AppStates state){
          // var data = AppCubit.get(context).data;
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff0c9869),
              title: Text('All Customer'),
            ),
            body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildItem(data![index],),
                      separatorBuilder: (context, index) => Divider(
                          thickness: 0.5,
                          indent: 20,
                          height: MediaQuery.of(context).size.height * 0.05,
                          endIndent: 20,
                          color: Colors.grey[300]),
                      itemCount: data.length),
                ));
              },
            ),
    );

  }
  Widget buildItem(Map model,) =>GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CustomerScreen(balance: model['balance'],email: model['email'],name: model['name'],phone: model['phone'],)));
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${model['name']}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${model['balance']}\$'),
          )
        ],
      ),
    ),
  );
}

