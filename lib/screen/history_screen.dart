import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_money/constant/constant.dart';
import 'package:transaction_money/cubit/cubit.dart';
import 'package:transaction_money/cubit/states.dart';
import 'package:transaction_money/screen/customer_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: ( context, state) {  },
      builder: ( context, state) {

        return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff0c9869),
              title: Text('History'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index) => buildItem(newData![index], context) ,
                  separatorBuilder: (context,index) => Divider(
                      thickness: 0.5,
                      indent: 20,
                      height: MediaQuery.of(context).size.height * 0.05,
                      endIndent: 20,color: Colors.grey[300]),
                  itemCount: newData.length),
            )
        );
      },
    );
  }
  Widget buildItem (Map model, context) => Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${model['fromName']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Spacer(flex: 1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_right_alt_outlined),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${model['toName']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${model['balance']}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),

        ],
      ),
    );

}
