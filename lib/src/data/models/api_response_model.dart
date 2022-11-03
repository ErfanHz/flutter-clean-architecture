import 'package:clean_base/src/core/constants/messages.dart';

class ReturnResponse {
  int? statusCode;

  String message = '';

  PaginationModel? pagination;

  dynamic data;

  ReturnResponse({this.statusCode, this.data});

  bool get isOkStatus => statusCode == 200 || statusCode == 201;

  setNetworkErrorStatus() {
    statusCode = -1;
    message = ApplicationMessages.connectionFailed;
  }
}

class PaginationModel {
  int? page;
  int? rowsPerPage;
  int? rowsNumber;
  bool? descending;
  String? sortBy;
  String? search;
  Map? filters;

  PaginationModel({
    this.page,
    this.rowsPerPage,
    this.rowsNumber,
    this.descending,
    this.sortBy,
    this.search,
    this.filters,
  });

  PaginationModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    rowsPerPage = json['rowsPerPage'];
    rowsNumber = json['rowsNumber'];
    descending = json['descending'];
    sortBy = json['sortBy'];
    filters = json['filters'];
    search = json['search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (page != null) data['page'] = page;
    if (rowsPerPage != null) data['rowsPerPage'] = rowsPerPage;
    if (rowsNumber != null) data['rowsNumber'] = rowsNumber;
    if (descending != null) data['descending'] = descending;
    if (sortBy != null) data['sortBy'] = sortBy;
    if (filters != null) data['filters'] = filters;
    if (search != null) data['search'] = search;
    return data;
  }
}
