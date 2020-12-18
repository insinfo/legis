class StatusCode {
  String getClassName() {
    return 'StatusCode';
  }

  static const ERROR = -1;
  static const SUCCESS = 200; //ok
  static const CREATED = 201; //Criado
  static const ACCEPTED = 202; //Aceito
  static const UNAUTHORIZED_INFORMATION = 203; //Informações não autorizadas
  static const NO_CONTENT = 204; // No Content
  static const BAD_REQUEST = 400; //A solicitação não pôde ser entendida devido à sintaxe mal formada.
  static const UNAUTHORIZED = 401; //Não autorizado O pedido requer autenticação do usuário
  static const FORBIDDEN = 403;
  static const NOT_FOUND = 404;
  static const REQUEST_TIMEOUT = 408;
  static const INTERNAL_SERVER_ERROR = 500; //Internal Server Error
  static const CONFLICT = 409; //Internal Server Error
}
