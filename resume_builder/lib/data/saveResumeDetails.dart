import 'package:resume_builder/data/resumeDataModel.dart';

class saveResumeDetails {
  static Map _resumeDetails = {};
  static Map _educationalDetails = {};

  static Map savePersonalInformation(
      String name, String address, String mobileNumber, String emailId) {
    _resumeDetails['Name'] = name;
    _resumeDetails['Address'] = address;
    _resumeDetails['MobileNumber'] = mobileNumber;
    _resumeDetails['eMailId'] = emailId;
    print(_resumeDetails);
    return _resumeDetails;
  }

  static Map addEducationalInformation(
      String degree, String yop, String board, String percentage) {
    _educationalDetails['Degree'] = degree;
    _educationalDetails['YOP'] = yop;
    _educationalDetails['Board'] = board;
    _educationalDetails['Percentage'] = percentage;
    print(_educationalDetails);
    return _educationalDetails;
  }
}
