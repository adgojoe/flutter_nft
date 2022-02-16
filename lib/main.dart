import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/contract_linking.dart';
import 'view/hello_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Inserting Provider as a parent of HelloUI()
    return ChangeNotifierProvider<ContractLinking>(
      create: (_) => ContractLinking(),
      child: MaterialApp(
        title: "Hello World",
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.cyan[400],
        ),
        home: HelloUI(),
      ),
    );
  }
}
