// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constant/my_text_field.dart';
import '../../constant/text_form.dart';

class SearchForNewUser extends StatefulWidget {
  const SearchForNewUser({Key? key}) : super(key: key);

  @override
  State<SearchForNewUser> createState() => _SearchForNewUserState();
}

class _SearchForNewUserState extends State<SearchForNewUser> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Card(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                ),
                hintText: 'Search...',
              ),
              onChanged: (val) {
                setState(
                  () {
                    name = val;
                  },
                );
              },
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: (name != "")
              ? FirebaseFirestore.instance
                  .collection('Booked')
                  .where("firstName", isGreaterThanOrEqualTo: name)
                  .snapshots()
              : FirebaseFirestore.instance.collection("Bookd").snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: false,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return Column(
                        children: [
                          const SizedBox(
                            height: 30.0,
                          ),
                          textData(
                            'FirstName',
                            18.0 * textScale,
                          ),
                          MyTextFormField(
                            controller: TextEditingController(
                              text: data['firstName'],
                            ),
                            enable: false,
                            hintText: '',
                            inputType: TextInputType.none,
                            validation: (value) {
                              return value;
                            },
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          textData(
                            'lastName',
                            18.0 * textScale,
                          ),
                          MyTextFormField(
                            controller: TextEditingController(
                              text: data['lastName'],
                            ),
                            enable: false,
                            hintText: '',
                            inputType: TextInputType.none,
                            validation: (value) {
                              return value;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          textData(
                            'Start Date',
                            18.0 * textScale,
                          ),
                          MyTextFormField(
                            controller: TextEditingController(
                              text: data['startDate'],
                            ),
                            enable: false,
                            hintText: '',
                            inputType: TextInputType.none,
                            validation: (value) {
                              return value;
                            },
                          ),
                          textData(
                            'End Date',
                            18.0 * textScale,
                          ),
                          MyTextFormField(
                            controller: TextEditingController(
                              text: data['endDate'],
                            ),
                            enable: false,
                            hintText: '',
                            inputType: TextInputType.none,
                            validation: (value) {
                              return value;
                            },
                          ),
                          textData(
                            'E _ Mail Address',
                            18.0 * textScale,
                          ),
                          MyTextFormField(
                            controller: TextEditingController(
                              text: data['name'],
                            ),
                            enable: false,
                            hintText: '',
                            inputType: TextInputType.none,
                            validation: (value) {
                              return value;
                            },
                          ),
                          textData(
                            'Phone Number',
                            18.0 * textScale,
                          ),
                          MyTextFormField(
                            controller: TextEditingController(
                              text: data['phoneNumber'],
                            ),
                            enable: false,
                            hintText: '',
                            inputType: TextInputType.none,
                            validation: (value) {
                              return value;
                            },
                          ),
                          textData(
                            'Translator',
                            18.0 * textScale,
                          ),
                          MyTextFormField(
                            controller: TextEditingController(
                              text: data['manTranslate'],
                            ),
                            enable: false,
                            hintText: '',
                            inputType: TextInputType.none,
                            validation: (value) {
                              return value;
                            },
                          ),
                          textData(
                            'Number of Adult',
                            18.0 * textScale,
                          ),
                          MyTextFormField(
                            controller: TextEditingController(
                              text: data['numberAdult'].toString(),
                            ),
                            enable: false,
                            hintText: '',
                            inputType: TextInputType.none,
                            validation: (value) {
                              return value;
                            },
                          ),
                          textData(
                            'Number of Child',
                            18.0 * textScale,
                          ),
                          MyTextFormField(
                            controller: TextEditingController(
                              text: data['numberChild'].toString(),
                            ),
                            enable: false,
                            hintText: '',
                            inputType: TextInputType.none,
                            validation: (value) {
                              return value;
                            },
                          ),
                          textData(
                            'Totail of Price of Adult',
                            18.0 * textScale,
                          ),
                          MyTextFormField(
                            controller: TextEditingController(
                              text: data['adult'].toString(),
                            ),
                            enable: false,
                            hintText: '',
                            inputType: TextInputType.none,
                            validation: (value) {
                              return value;
                            },
                          ),
                          textData(
                            'Totail of Price of Child',
                            18.0 * textScale,
                          ),
                          MyTextFormField(
                            controller: TextEditingController(
                              text: data['child'].toString(),
                            ),
                            enable: false,
                            hintText: '',
                            inputType: TextInputType.none,
                            validation: (value) {
                              return value;
                            },
                          ),
                          textData(
                            'Totail of Price of Trip',
                            18.0 * textScale,
                          ),
                          MyTextFormField(
                            controller: TextEditingController(
                              text: data['totailPrice'].toString(),
                            ),
                            enable: false,
                            hintText: '',
                            inputType: TextInputType.none,
                            validation: (value) {
                              return value;
                            },
                          ),
                        ],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
