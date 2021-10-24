import 'package:first_app/models/company_model.dart';
import 'package:flutter/material.dart';

class CompanyDetail extends StatelessWidget {
  const CompanyDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final company = ModalRoute.of(context)!.settings.arguments as CompanyModel;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 128.0, 32.0, 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Center(
                  child: Text(company.name,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue))),
              const SizedBox(height: 10),
              Center(
                  child: Text(company.description,
                      style: const TextStyle(fontSize: 16)))
            ],
          ),
        ),
      ),
    );
  }
}
