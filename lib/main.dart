import 'package:first_app/ui/company_detail.dart';
import 'package:first_app/ui/company_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/company_list',
      routes: {
        '/company_list': (context) => CompanyList(),
        '/company_detail': (context) => CompanyDetail()
      },
    );
  }
}
