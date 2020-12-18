import 'dart:io';
import 'package:dartdap/dartdap.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class AuthenticationController {
  static const key = '7Fsxc2A865V67';

  static void authenticate(RequestContext req, ResponseContext res) async {
    try {
      await req.parseBody();
      final Map<String, dynamic> payload = req.bodyAsMap;
      if (!payload.containsKey('username')) {
        throw AngelHttpException.badRequest(message: 'Faltando login.');
      }
      if (!payload.containsKey('password')) {
        throw AngelHttpException.badRequest(message: 'Faltando senha.');
      }
      final username = payload['username'].toString();
      final password = payload['password'].toString();
      /*final ad = ActiveDirectoryService();
      await ad.authenticate(username, password);
      final servidorRepository = ServidorRepository();
      final usuarioJubarte = await servidorRepository.getByLogin(username);
      if (usuarioJubarte == null) {
        throw AngelHttpException.badRequest(message: 'Usuário inexistente');
      }*/
      //$expirationSec = 32400; //32400 segundo = 9 horas
      const expiresInDays = 365 * 3;
      final expiry = DateTime.now().add(const Duration(days: expiresInDays));

      final claimSet = JwtClaim(
        //subject: 'kleak',
        issuer: 'jubarte.riodasostras.rj.gov.br',
        issuedAt: DateTime.now(), //Emitido em timestamp de geracao do token
        notBefore: DateTime.now().subtract(const Duration(milliseconds: 1)), // token nao é valido Antes de
        // audience: <String>['jubarte.riodasostras.rj.gov.br'],
        otherClaims: <String, dynamic>{
          'idSistema': 1,
          /*'idPessoa': usuarioJubarte.idPessoa,
          'idOrganograma': usuarioJubarte.idOrganograma,
          'cpfPessoa': usuarioJubarte.cpf,
          'userAgent': ''*/
        },
        expiry: expiry,
        maxAge: const Duration(days: expiresInDays), //3 anos
      );

      final String token = issueJwtHS256(claimSet, key);
      /*final usuario = Usuario();
      usuario.usuarioJubarte = usuarioJubarte;
      usuario.username = usuarioJubarte.login;
      usuario.accessToken = token;
      usuario.expiresIn = expiry;*/

      /*final json = CoreUtils.myJsonEncode(usuario.toMap());
      res.headers['Content-Type'] = 'application/json;charset=utf-8';
      res.write(json);*/
    } on SocketException {
      //catch (e)
      throw AngelHttpException.notAuthenticated(message: 'Erro de conexão');
    } on LdapResultInvalidCredentialsException {
      throw AngelHttpException.notAuthenticated(message: 'Senha Incorreta');
    } catch (e) {
      throw AngelHttpException.notAuthenticated(message: '$e');
    }
  }

  static void checkToken(RequestContext req, ResponseContext res) async {
    try {
      await req.parseBody();
      final Map<String, dynamic> payload = req.bodyAsMap;
      if (!payload.containsKey('accessToken')) {
        throw AngelHttpException.badRequest(message: 'Faltando token.');
      }

      final token = payload['accessToken'].toString();

      final JwtClaim decClaimSet = verifyJwtHS256Signature(token, key);
      // print(decClaimSet);

      decClaimSet.validate(issuer: 'jubarte.riodasostras.rj.gov.br');

      /* if (decClaimSet.jwtId != null) {
        print(decClaimSet.jwtId);
      }
      if (decClaimSet.containsKey('idPessoa')) {
        final v = decClaimSet['idPessoa'];
        print(v);
      }

      final json = CoreUtils.myJsonEncode({'login': true});
      res.headers['Content-Type'] = 'application/json;charset=utf-8';
      res.write(json);*/
    } on JwtException catch (e) {
      throw AngelHttpException.notAuthenticated(message: 'JwtException $e');
    } catch (e) {
      throw AngelHttpException.notAuthenticated(message: '$e');
    }
  }

  //valida QrCode da carteira da guarda e cracha do servidor
  static void validateQrCode(RequestContext req, ResponseContext res) async {
    try {
      await req.parseBody();
      final Map<String, dynamic> payload = req.bodyAsMap;

      if (!payload.containsKey('qrcode')) {
        throw AngelHttpException.badRequest(message: 'Faltando qrcode.');
      }
      final token = payload['qrcode'].toString();
      final JwtClaim decClaimSet = verifyJwtHS256Signature(token, key);
      // print(decClaimSet);
      decClaimSet.validate(issuer: 't', audience: 'j');
      if (decClaimSet.containsKey('cpfPessoa')) {
        final cpf = decClaimSet['cpfPessoa'].toString();

        /*final servidorRepository = ServidorRepository();
        final usuarioJubarte = await servidorRepository.getByCpf(cpf);
        if (usuarioJubarte == null) {
          throw AngelHttpException.badRequest(message: 'QrCode Inválido');
        }
        final json = CoreUtils.myJsonEncode(usuarioJubarte.toMap());
        res.headers['Content-Type'] = 'application/json;charset=utf-8';
        res.write(json);*/
      } else {
        throw AngelHttpException.badRequest(message: 'QrCode Inválido');
      }
    } on JwtException catch (e) {
      throw AngelHttpException.badRequest(message: 'QrCode Inválido');
    } catch (e) {
      throw AngelHttpException.badRequest(message: '$e');
    }
  }
}
