class SendOtpResponseModel {
  String? phoneNumber;

  SendOtpResponseModel({this.phoneNumber});

  SendOtpResponseModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
