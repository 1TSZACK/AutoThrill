// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:convert';

import "package:http/http.dart" as http;

class RequestResult {
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";
const DOMAIN = "192.168.0.101:9000";
// // goto cmd type ipconfig go to wireless LAN  copy IPv4 address
//const DOMAIN = "172.16.68.47:8000";
Future<RequestResult> http_get(String route, [dynamic data]) async {
  var dataStr = jsonEncode(data);
  var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
  var result = await http.get(Uri.parse(url));
  return RequestResult(true, jsonDecode(result.body));
}

Future<RequestResult> http_post(String route, [dynamic data]) async {
  var url = "$PROTOCOL://$DOMAIN/$route";
  var dataStr = jsonEncode(data);
  var result = await http.post(Uri.parse(url),
      body: dataStr, headers: {"Content-Type": "application/json"});
  return RequestResult(true, jsonDecode(result.body));
}
