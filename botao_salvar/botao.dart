RaisedButton(
  onPressed: () async {
    final response = await enviarDadosEditados(dadosEditados);
    if (response.statusCode == 200) {
      // atualizar a lista de itens
      final listaAtualizada = await obterListaDeItens();
      listaDeItensProvider.atualizarLista(listaAtualizada);
      // exibir mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dados salvos com sucesso!'),
        ),
      );
    } else {
      // exibir mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Não foi possível salvar os dados.'),
        ),
      );
    }
  },
  child: Text('Salvar'),
);
