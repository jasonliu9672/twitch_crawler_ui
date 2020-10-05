import 'package:flutter/material.dart';
import 'package:twitch_crawler_ui/models/transaction.dart';

class DataTablePage extends StatelessWidget {
  final List<Transaction> _transactions;
  DataTablePage(this._transactions);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'id',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'channel',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'start',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'end',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'transactionList',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'serverPool',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: _transactions != null
                  ? _transactions.map((transaction) {
                      DataRow(cells: <DataCell>[
                        DataCell(Text(transaction.id)),
                        DataCell(Text(transaction.channel)),
                        DataCell(Text(transaction.start)),
                        DataCell(Text(transaction.end)),
                        DataCell(Text(transaction.transactionList.toString())),
                        DataCell(Text(transaction.serverPool.toString())),
                      ]);
                    }).toList()
                  : [])),
    );
  }
}
