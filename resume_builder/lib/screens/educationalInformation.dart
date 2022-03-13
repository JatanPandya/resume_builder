import 'package:flutter/material.dart';
import 'package:resume_builder/data/saveResumeDetails.dart';
import 'package:resume_builder/screens/personalInformation.dart';

class educationalInformation extends StatefulWidget {
  @override
  _educationalInformationState createState() => _educationalInformationState();
}

class _educationalInformationState extends State<educationalInformation> {
  TextEditingController _txt_educational_Degree = new TextEditingController();
  TextEditingController _txt_educational_YOP = new TextEditingController();
  TextEditingController _txt_educational_Board = new TextEditingController();
  TextEditingController _txt_educational_Percentage =
      new TextEditingController();
  List _educationalInfo = [];

  List<TableRow> tableRows = [
    TableRow(children: [
      Text('Degree\nYOP'),
      Text('University/Board\nResult'),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Builder'),
      ),
      body: ListView(
        children: <Widget>[
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Educational Information'),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.text_snippet_outlined),
              hintText: 'What are your Qualifications?',
              labelText: 'Degree *',
            ),
            controller: _txt_educational_Degree,
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
              hintText: 'When did you achieve this degree?',
              labelText: 'Year of Passing *',
            ),
            controller: _txt_educational_YOP,
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
              hintText: 'Which was the University?',
              labelText: 'Board/University *',
            ),
            onSaved: (String? value) {},
            controller: _txt_educational_Board,
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'How was your Result?',
              labelText: 'Percentage *',
            ),
            onSaved: (String? value) {},
            controller: _txt_educational_Percentage,
            validator: (String? value) {
              return (value == null) ? 'Can not left blank' : null;
            },
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton.icon(
              onPressed: () => _addEducationalInformation(),
              icon: const Icon(Icons.save),
              label: const Text('Save')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              children: tableRows,
            ),
          ),
        ],
      ),
    );
  }

  _addEducationalInformation() {
    setState(() {
      _educationalInfo = [];
      _educationalInfo.add(saveResumeDetails.addEducationalInformation(
          _txt_educational_Degree.text,
          _txt_educational_YOP.text,
          _txt_educational_Board.text,
          _txt_educational_Percentage.text));
      _populateTableRows();
    });
    _txt_educational_Degree.text = '';
    _txt_educational_YOP.text = '';
    _txt_educational_Board.text = '';
    _txt_educational_Percentage.text = '';
    // _navigateToEducationalQualifications();
  }

  void _navigateToEducationalQualifications() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => personalInformation()));
  }

  List<TableRow> _populateTableRows() {
    for (int i = 0; i < _educationalInfo.length; i++) {
      print(_educationalInfo[i]);
      tableRows.add(
        TableRow(children: [
          Text(_educationalInfo[i]["Degree"] +
              '\n' +
              _educationalInfo[i]["YOP"]),
          Text(_educationalInfo[i]["Board"] +
              '\n' +
              _educationalInfo[i]["Percentage"]),
        ]),
      );
    }
    return tableRows;
  }
}
