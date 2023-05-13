import 'package:http/http.dart';

// global service errors and functions
class GlobalServiceFunctions {
  // checks response code and returns true if it is 200
  bool responseCode200(Response response) {
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // checks response code and returns true if it is 300
  bool responseCode300(Response response) {
    if (response.statusCode == 300) {
      return true;
    } else {
      throw 'Multiple Choices - Redirection - 300';
    }
  }

  // checks response code and returns true if it is 400
  bool responseCode400(Response response) {
    if (response.statusCode == 400) {
      return true;
    } else {
      throw 'Bad Request - Client Error - 400';
    }
  }

  // checks response code and returns true if it is 500
  bool responseCode500(Response response) {
    if (response.statusCode == 500) {
      return true;
    } else {
      throw 'Internal Server Error - Server Error - 500';
    }
  }
}
