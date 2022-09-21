import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_money/cubit/cubit.dart';
import 'package:transaction_money/cubit/states.dart';
import 'package:transaction_money/screen/all_customer_screen.dart';
import 'package:transaction_money/screen/history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: ( context, state) {  },
      builder: ( context,  state) {
        AppCubit.get(context).createDatabase();
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(flex: 1,),
              Image(image: AssetImage('assets/images/transaction.png')),
              Spacer(flex: 1,),
              Row(
                children: [
                  Spacer(flex: 1,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AllCustomerScreen()));
                      //insertDatabase();
                    },
                    child: Text('All Customer',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0c9869),
                        minimumSize: Size(120, 60),
                        elevation: 10),
                    ///30d3b4
                  ),
                  Spacer(flex: 1,),
                  ElevatedButton(
                    onPressed: () {
                      AppCubit.get(context).createDatabase();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen()));
                    },
                    child: Text('History',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0c9869),
                        minimumSize: Size(120, 60),
                        elevation: 10),
                  ),
                  Spacer(flex: 1,),
                ],
              ),
              Spacer(flex: 1,),
            ],
          ),
        ),
      );
      },

    );


  }
}
