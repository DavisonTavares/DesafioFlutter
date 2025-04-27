import 'package:drift/drift.dart';

class ProdutoModel {
  final int id;
  final int confeitariaId;
  final String nome;
  final double valor;
  final String? descricao;
  final List<String> imagens;

  ProdutoModel({
    required this.id,
    required this.confeitariaId,
    required this.nome,
    required this.valor,
    this.descricao,
    required this.imagens,
  });
}
