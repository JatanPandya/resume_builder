import 'package:flutter/material.dart';
import 'package:resume_builder/data/saveResumeDetails.dart';
import 'package:resume_builder/screens/educationalInformation.dart';

class personalInformation extends StatefulWidget {
  @override
  _personalInformationState createState() => _personalInformationState();
}

class _personalInformationState extends State<personalInformation> {
  TextEditingController _txt_personal_Name = new TextEditingController();
  TextEditingController _txt_personal_Address = new TextEditingController();
  TextEditingController _txt_personal_MobileNo = new TextEditingController();
  TextEditingController _txt_personal_Email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Builder'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Personal Information'),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
            controller: _txt_personal_Name,
            onSaved: (String? value) {},
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.pin_drop_outlined),
              hintText: 'Where do people Find you?',
              labelText: 'Address *',
            ),
            controller: _txt_personal_Address,
            onSaved: (String? value) {},
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: 'What is your Mobile number?',
              labelText: 'Mobile Number *',
            ),
            onSaved: (String? value) {},
            controller: _txt_personal_MobileNo,
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Where can people drop e-Mails for you?',
              labelText: 'Email ID *',
            ),
            onSaved: (String? value) {},
            controller: _txt_personal_Email,
            validator: (String? value) {
              return (value == null) ? 'Can not left blank' : null;
            },
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton.icon(
              onPressed: () => _savePersonalInformation(),
              icon: Icon(Icons.save),
              label: Text('Save'))
        ],
      ),
    );
  }

  _savePersonalInformation() {
    saveResumeDetails.savePersonalInformation(
        _txt_personal_Name.text,
        _txt_personal_Address.text,
        _txt_personal_MobileNo.text,
        _txt_personal_Email.text);
    _navigateToEducationalQualifications();
  }

  void _navigateToEducationalQualifications() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => educationalInformation()));
  }
}
