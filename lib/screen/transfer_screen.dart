import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:transaction_money/constant/constant.dart';
import 'package:transaction_money/screen/Confirmation.dart';

class TransferScreen extends StatelessWidget {
  final String amount;
  TransferScreen({Key? key, required this.amount, }) : super(key: key);

List<String> items = ['Mohamed saeed','Ahmed Salem','Mohamed Sadek','Mohamed Shabaan','Yhaya Saeed','Saeed','Wael','Krar'];

var amountController = TextEditingController();
var formKey = GlobalKey<FormState>();
String? selectItem = 'Mohamed Saeed';

  @override
  Widget build(BuildContext context,) {
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
            AwesomeDropDown(dropDownList: items,
              selectedItem: '$selectItem',
            ),
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
                    else if (int.tryParse(value) !> int.parse(amount)){
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

                if(formKey.currentState!.validate())
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmScreen()));

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
  }
}
