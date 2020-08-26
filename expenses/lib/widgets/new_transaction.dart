//let you detect the os
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
//used StatefulWidget here to not loose the record on rebuild
class NewTransaction extends StatefulWidget {
  final Function addTx;
NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController=TextEditingController();
  DateTime _selectedDate;

  final _amountController=TextEditingController();

void _submitData(){
  if(_amountController.text.isEmpty){
    return;
  }
  final enteredTitle=_titleController.text;
  final enteredAmount=double.parse(_amountController.text);
  if(enteredTitle.isEmpty || enteredAmount<=0 || _selectedDate==null){return;}
  // widget.addTx prevents textField autoclear before button press
  widget.addTx(enteredTitle,enteredAmount,_selectedDate,);
  //allw you to store by using keyboard tick ,no more need of pressing button we created
  Navigator.of(context).pop();

}
void _presentDatePicker(){
  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime.now()).then((pickedDate){
    if(pickedDate==null){
      return;
    }setState(() {
      _selectedDate=pickedDate;
    });

  });
}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom:MediaQuery.of(context).viewInsets.bottom +10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //Think of TextField as EditText
              //InputDecoration helps in decoration inside widget
              //labelText help user to know what to enter

              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                //onchange fire for every keystroke

                //onChanged: (value) =>print(titleController),
                controller: _titleController,
                onSubmitted: (_)=>_submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                //keyboardType change the keyboard type
                //TextInputType.number tells only number keyboard will come out
                keyboardType: TextInputType.number,
                onSubmitted:(_)=>_submitData() ,
                //onChanged: (value)=>print(amountController),
                controller: _amountController,
              ),
              Container(height: 70,
                child: Row(children:<Widget> [
                  Expanded(child: Text(_selectedDate==null?'No date chosen':'Picked Date:${ DateFormat.yMMMd().format(_selectedDate)}')),
                 Platform.isIOS?CupertinoButton(color:Colors.blue,onPressed: _presentDatePicker, child: Text('Choose Date'),): FlatButton(onPressed: _presentDatePicker, child: Text('Choose Date'),textColor: Colors.lightGreen,),
                ],),
              ),
              RaisedButton( //titleController.text will return correct vlaues
                onPressed: _submitData,
                child: Text('Add Transaction',style: TextStyle(fontWeight: FontWeight.bold),),
                color: Colors.purple,textColor: Colors.white,
              )
            ],

          ),
        ),
      ),
    );

  }}
