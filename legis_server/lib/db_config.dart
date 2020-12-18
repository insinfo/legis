class DbConfig {
  DbConfig({this.username, this.password, this.host, this.port, this.database});
  String username;
  String password;
  String host;
  int port;
  String database;
}

final mongodbConInfo = DbConfig(
  database: 'legis',
  username: 'sisadmin',
  password: 's1sadm1n',
  host: 'localhost',
  port: 27017,
);
