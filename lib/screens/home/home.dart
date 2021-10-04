// ignore_for_file: unnecessary_const

import 'package:e_banking/model/quick_action.dart';
import 'package:e_banking/model/transaction.dart';
import 'package:e_banking/screens/home/components/transaction_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../auth.dart';
import 'components/profile_header.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<QuickAction> actions = [
    QuickAction(
        title: 'Send', icon: Icons.attach_money, buttonColor: Colors.red[900]!),
    QuickAction(
        title: 'Pay', icon: Icons.payment, buttonColor: Colors.green[900]!),
    QuickAction(
        title: 'Wallet',
        icon: Icons.account_balance_wallet_rounded,
        buttonColor: Colors.blue[900]!),
  ];
  List<Transaction> transactions = [
    Transaction(
        amount: '\$1,109',
        time: DateTime(2021, 09, 29),
        title: 'Iphone 13, apple store lekki',
        type: TransactionType.debit,
        status: Status.successful),
    Transaction(
        amount: '\$15,109',
        time: DateTime(2021, 09, 26),
        title: 'September Base Salary',
        type: TransactionType.credit,
        status: Status.successful),
    Transaction(
      amount: '\$5,109',
      time: DateTime(2021, 09, 27),
      title: 'Dry Cleaner - ifunanaya olu',
      type: TransactionType.debit,
      status: Status.failed,
    ),
    Transaction(
      amount: '\$4.99',
      time: DateTime(2021, 09, 28),
      title: 'Apple Music subscription -2803879hegu79',
      type: TransactionType.debit,
      status: Status.successful,
    ),
    Transaction(
      amount: '\$4.86',
      time: DateTime(2021, 09, 27),
      title: 'Netflix subscription',
      type: TransactionType.debit,
      status: Status.successful,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final auth = Provider.of<Auth>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const ProfileHeader(),
              const SizedBox(height: 32),
              Text(
                'AVAILABLE BALANCES',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.65),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colors.secondary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Premier Savings - 3028006027',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      '\$130.58',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: actions
                    .map((action) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    action.buttonColor.withOpacity(0.35),
                                radius: 30,
                                child: Icon(action.icon),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                action.title,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.65),
                                ),
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 24),
              Text(
                'TRANSACTION HISTORY',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.65),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (_, i) =>
                      TransactionCard(transaction: transactions[i]),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
