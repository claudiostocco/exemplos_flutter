Future<http.Response> enviarDadosEditados(dynamic dados) async {
  final url = 'https://servico-rest.com.br/editar';
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode(dados);
  final response = await http.post(url, headers: headers, body: body);
  return response;
}