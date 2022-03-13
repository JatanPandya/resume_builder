class resumeDataModel {
  late String _userName;
  late String _userAddress;
  late String _userMobileNo;
  late String _usereMail;

  String get getName => this._userName;

  void set setName(String value) => this._userName = value;

  String get getAddress => this._userAddress;

  void set setAddress(String value) => this._userAddress = value;

  String get getMobileNo => this._userMobileNo;

  void set setMobileNo(String value) => this._userMobileNo = value;

  String get geteMail => this._usereMail;

  void set seteMail(String value) => this._usereMail = value;
}
