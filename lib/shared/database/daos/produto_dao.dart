import 'package:drift/drift.dart';
import 'package:confeitaria_marketplace/shared/database/app_database.dart';
import 'package:confeitaria_marketplace/features/produtos/models/produto_model.dart';

part 'produto_dao.g.dart';

@DriftAccessor(tables: [Produtos])
class ProdutoDao extends DatabaseAccessor<AppDatabase> with _$ProdutoDaoMixin {
  ProdutoDao(AppDatabase db) : super(db);

  // Buscar todos os produtos de uma confeitaria específica
  Future<List<ProdutoModel>> listarPorConfeitaria(int confeitariaId) async {
    final query = select(produtos)..where((tbl) => tbl.confeitariaId.equals(confeitariaId));
    final result = await query.get();

    return result.map((e) => ProdutoModel(
      id: e.id,
      confeitariaId: e.confeitariaId,
      nome: e.nome,
      valor: e.valor,
      descricao: e.descricao,
      imagens: e.imagens,
    )).toList();
  }

  // Inserir novo produto
  Future<int> inserirProduto(ProdutoModel produto) {
    return into(produtos).insert(ProdutosCompanion.insert(
      confeitariaId: produto.confeitariaId,
      nome: produto.nome,
      valor: Value(produto.valor),
      descricao: Value(produto.descricao),
      imagens: produto.imagens,
    ));
  }

  // Atualizar produto
  Future<bool> atualizarProduto(ProdutoModel produto) {
    return update(produtos).replace(ProdutosCompanion(
      id: Value(produto.id),
      confeitariaId: Value(produto.confeitariaId),
      nome: Value(produto.nome),
      valor: Value(produto.valor),
      descricao: Value(produto.descricao),
      imagens: Value(produto.imagens),
    ));
  }

  // Deletar produto
  Future<int> deletarProduto(int id) {
    return (delete(produtos)..where((tbl) => tbl.id.equals(id))).go();
  }
}
