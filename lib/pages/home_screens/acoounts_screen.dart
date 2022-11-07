import 'package:bnacash/widgets/suggested_list.dart';
import 'package:bnacash/widgets/todo_list.dart';
import 'package:bnacash/widgets/transaction_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bnacash/Controller/userController.dart';
import 'package:get/get.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UserController userController = Get.put(UserController());
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              
              children:  [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: TransactionContainer(),
                ),
                ToDoList(),
                SuggestedList(),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
