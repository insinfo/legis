import 'dart:async';
import 'package:angel_framework/angel_framework.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

//import 'package:riodasostrasapp_core/riodasostrasapp_core.dart';

class AuthMiddleware {
  Future<bool> handleRequestCrud(RequestContext req, ResponseContext res) async {
    try {
      //res.json({'message': StatusMessage.ACESSO_NAO_AUTORIZADO});
      //Authorization: Bearer
      /*if (req.headers['Authorization'] == null || req.headers['Authorization'] == '') {
        throw AngelHttpException.notAuthenticated(message: StatusMessage.ACESSO_NAO_AUTORIZADO);
      }
      var token = req.headers['Authorization'][0].toString().replaceAll('Bearer ', '');
      final JwtClaim decClaimSet = verifyJwtHS256Signature(token, AuthenticationController.key);
      decClaimSet.validate(issuer: 'jubarte.riodasostras.rj.gov.br');*/

      return true;
    } catch (e) {
      throw AngelHttpException.notAuthenticated(message: '$e');
    }
  }
}
