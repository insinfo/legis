import 'package:aqueduct/aqueduct.dart';

class AuthMiddleware extends Controller {
  @override
  Future<RequestOrResponse> handle(Request request) async {
    if (true == false) {
      return request;
    }

    return Response.unauthorized();
  }
}
