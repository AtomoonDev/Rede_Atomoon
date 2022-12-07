import 'dart:convert';
import 'package:atomoon/models/api_response.dart';
import 'package:atomoon/models/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(
      String user, String password) async {
    try {
      const urlAPI = 'https://localhost:5555/api/login/auth';
      Map params = {'username': user, 'senha': password};
      var body = json.encode(params);

      var response = await http.post(Uri.parse(urlAPI),
          headers: {"Content-Type": "application/json"}, body: body);

      print("${response.statusCode}");

      Map listaResposta = json.decode(response.body);
      if (response.statusCode == 200) {
        final usuario = Usuario.fromJson(listaResposta);
        return ApiResponse.statusOk(usuario);
      }
      return ApiResponse.error("Erro ao fazer o login");
    } catch (error, exception) {
      print("Erro : $error > $exception ");
      return ApiResponse.error("Sem comunicação ... tente mais tarde... ");
    }
  }
}
