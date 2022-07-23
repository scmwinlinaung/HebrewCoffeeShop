import 'dart:io';

class AppConfig {
  AppConfig() {
    String host = "127.0.0.1";
    if (Platform.isAndroid) {
      host = '10.0.2.2';
    }
    params['dev'] = AppConfigParams(
        host: host, version: "1.0.0", owner: "Boolean Tech", port: "8081");

    // params['ropsten'] = AppConfigParams(
    //     "https://ropsten.infura.io/v3/628074215a2449eb960b4fe9e95feb09",
    //     "wss://ropsten.infura.io/ws/v3/628074215a2449eb960b4fe9e95feb09",
    //     "0x5060b60cb8Bd1C94B7ADEF4134555CDa7B45c461");
  }

  Map<String, AppConfigParams> params = <String, AppConfigParams>{};
}

class AppConfigParams {
  AppConfigParams(
      {required this.host,
      required this.version,
      required this.owner,
      required this.port});
  final String host;
  final String version;
  final String owner;
  final String port;
}
