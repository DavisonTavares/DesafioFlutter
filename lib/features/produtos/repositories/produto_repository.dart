import 'package:confeitaria_marketplace/shared/database/app_database.dart';
import 'package:drift/drift.dart';
import 'package:confeitaria_marketplace/features/produtos/models/produto_model.dart';
import 'package:confeitaria_marketplace/shared/database/daos/produto_dao.dart';

class ProdutoRepository {
  final ProdutoDao produtoDao;

  ProdutoRepository(this.produtoDao);

  Future<List<ProdutoModel>> listarPorConfeitaria(int confeitariaId) async {
    try {
      // Usando ProdutoDao para listar produtos
      final produtos = await produtoDao.listarPorConfeitaria(confeitariaId);
      return produtos;
    } catch (e) {
      print('Erro ao listar produtos: $e');
      rethrow;
    }
  }

  Future<void> inserir(ProdutoModel produto) async {
    try {
      // Usando ProdutoDao para inserir produto
      await produtoDao.inserirProduto(produto);
    } catch (e) {
      print('Erro ao inserir produto: $e');
      rethrow;
    }
  }

  Future<void> atualizar(ProdutoModel produto) async {
    try {
      // Usando ProdutoDao para atualizar produto
      await produtoDao.atualizarProduto(produto);
    } catch (e) {
      print('Erro ao atualizar produto: $e');
      rethrow;
    }
  }

  Future<void> deletar(int id) async {
    try {
      // Usando ProdutoDao para deletar produto
      await produtoDao.deletarProduto(id);
    } catch (e) {
      print('Erro ao deletar produto: $e');
      rethrow;
    }
  }
}
