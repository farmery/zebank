import 'package:e_banking/model/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  TransactionCard({Key? key, required this.transaction}) : super(key: key);
  final Transaction transaction;
  final f = DateFormat('yyyy-MM-dd hh:mm');
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: colors.background),
        child: ListTile(
          minLeadingWidth: 25,
          leading: transaction.status == Status.successful
              ? const Icon(Icons.check_circle, color: Colors.green)
              : Icon(Icons.cancel, color: colors.error),
          title: Text(
            transaction.title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          subtitle: Text(
            f.format(transaction.time),
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.65),
            ),
          ),
          trailing: transaction.type == TransactionType.credit
              ? Text(
                  '+' + transaction.amount,
                  style: TextStyle(
                    color: colors.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  '-' + transaction.amount,
                  style: TextStyle(
                    color: colors.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
