import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/transaction.dart';

//To beautify the Datefromat

import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return  widget.transactions.isEmpty
            ? LayoutBuilder(builder: (ctx,constraints){
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added here',
                    style: TextStyle(fontSize: 28),
                  )
                ],
              );
    })      : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text('Rs${widget.transactions[index].amount}')),
                        ),
                      ),
                      title: Text(
                        widget.transactions[index].title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(widget.transactions[index].date),
                      ),
                      //MediaQuery.of(context).size.width>460? FlatButton.icon( onPressed: () => deleteTx(transactions[index].id), icon:Icon(Icons.delete) , label: Text('Delete'),textColor: Colors.red,)helps to show diffrent ui based on screensize.
                      trailing:MediaQuery.of(context).size.width>460? FlatButton.icon( onPressed: () => widget.deleteTx(widget.transactions[index].id), icon:Icon(Icons.delete) , label:const Text('Delete'),textColor: Colors.red,):IconButton(
                          icon:const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () => widget.deleteTx(widget.transactions[index].id)),
                    ),
                  );
                },
                //counts the no widgets in it.
                itemCount: widget.transactions.length,
                //tx is a function here that execute for every transaction
    );
  }
}
