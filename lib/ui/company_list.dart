import 'package:first_app/models/company_model.dart';
import 'package:flutter/material.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({Key? key}) : super(key: key);

  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  List<CompanyModel> companyList = [
    CompanyModel(name: "Google", description: "description about Google"),
    CompanyModel(name: "Amazon", description: "description about Amazon"),
    CompanyModel(name: "Microsoft", description: "description about Microsoft"),
    CompanyModel(name: "Netflix", description: "description about Netflix"),
    CompanyModel(name: "Facebook", description: "description about Facebook")
  ];

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    _addCompany(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 32.0, 20.0, 0.0),
                child: SizedBox(
                  height: 220.0,
                  width: 360.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Name of the company'),
                        controller: nameController,
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Description of the company'),
                        controller: descriptionController,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              companyList.add(CompanyModel(
                                  name: nameController.text.trim(),
                                  description:
                                      descriptionController.text.trim()));
                            });
                            Navigator.pop(context, false);
                          },
                          child: const Text('Add'))
                    ],
                  ),
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
          child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: SizedBox(
                    height: 32,
                    child: Center(
                      child: Text(
                        companyList[index].name,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/company_detail',
                        arguments: companyList[index]);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: companyList.length),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addCompany(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
