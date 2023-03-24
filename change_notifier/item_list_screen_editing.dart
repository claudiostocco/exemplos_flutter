class ListaDeItens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListaDeItensProvider>(
      builder: (context, listaDeItensProvider, _) {
        final listaDeItens = listaDeItensProvider.listaDeItens;
        return ListView.builder(
          itemCount: listaDeItens.length,
          itemBuilder: (context, index) {
            final item = listaDeItens[index];
            return ListTile(
              title: TextField(
                controller: TextEditingController(text: item.nome),
                onChanged: (novoNome) {
                  final novoItem = Item(
                    id: item.id,
                    nome: novoNome,
                    descricao: item.descricao,
                  );
                  listaDeItensProvider.atualizarItem(index, novoItem);
                },
              ),
              subtitle: TextField(
                controller: TextEditingController(text: item.descricao),
                onChanged: (novaDescricao) {
                  final novoItem = Item(
                    id: item.id,
                    nome: item.nome,
                    descricao: novaDescricao,
                  );
                  listaDeItensProvider.atualizarItem(index, novoItem);
                },
              ),
            );
          },
        );
      },
    );
  }
}
