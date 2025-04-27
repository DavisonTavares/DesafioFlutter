import 'package:confeitaria_marketplace/features/produtos/bloc/product_bloc.dart';
import 'package:confeitaria_marketplace/features/produtos/pages/product_list_page.dart';
import 'package:confeitaria_marketplace/features/produtos/repositories/produto_repository.dart';
import 'package:flutter/material.dart';
import 'package:confeitaria_marketplace/features/confeitarias/models/confeitaria_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confeitaria_marketplace/features/confeitarias/bloc/confeitaria_bloc.dart';
import 'package:confeitaria_marketplace/features/confeitarias/pages/detail/confeitaria_detail_page.dart';
import 'package:confeitaria_marketplace/features/confeitarias/pages/form/confeitaria_dialog.dart';
import 'dart:io';
import 'package:confeitaria_marketplace/features/produtos/pages/product_form_page.dart';
import 'package:confeitaria_marketplace/shared/database/daos/produto_dao.dart';

class ConfeitariaListItem extends StatelessWidget {
  final ConfeitariaModel confeitaria;

  const ConfeitariaListItem({super.key, required this.confeitaria});

  @override
  Widget build(BuildContext context) {
    print('Construindo item da lista: ${confeitaria.nome}, ${confeitaria.imagens}');
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),  // Bordas mais arredondadas
      ),
      elevation: 4,  // Sombra suave para dar um toque moderno
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.white,  // Cor neutra de fundo
      child: InkWell(
        onTap: () => _navigateToDetail(context),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildImage(),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      confeitaria.nome,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600, 
                        color: Colors.black87,  
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      confeitaria.cidade,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400, 
                        color: Colors.grey.shade600, 
                      ),
                    ),
                  ],
                ),
              ),
              /*IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () => _confirmDelete(context),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  // Função para exibir a primeira imagem da lista, se disponível
  Widget _buildImage() {
    if (confeitaria.imagens.isNotEmpty) {
      String imagem = confeitaria.imagens.first;

      if (imagem.startsWith('http') || imagem.startsWith('https')) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),  // Borda arredondada para a imagem
          child: Image.network(
            imagem, // Usando URL da imagem
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        );
      } else {
        try {
          File imagemFile = File(imagem);
          if (imagemFile.existsSync()) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),  // Borda arredondada para a imagem
              child: Image.file(
                imagemFile, // Usando caminho local (arquivo físico)
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            );
          } else {
            return _buildDefaultImage();
          }
        } catch (e) {
          return _buildDefaultImage();
        }
      }
    } else {
      return _buildDefaultImage();
    }
  }

  // Imagem padrão caso não tenha imagem disponível
  Widget _buildDefaultImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Icon(Icons.cake, size: 60, color: Colors.blueGrey),
    );
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (_) => ProductBloc(
            confeitariaId: confeitaria.id ?? 0,
            produtoRepository: context.read<ProdutoRepository>(),
            produtoDao: context.read<ProdutoDao>(),
          )..add(LoadProdutos(confeitaria.id ?? 0)),
          child: ProductListPage(
            confeitaria: confeitaria,
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: Text('Excluir ${confeitaria.nome}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              context.read<ConfeitariaBloc>().add(
                DeleteConfeitaria((confeitaria.id).toString()),
              );
              Navigator.pop(context);
            },
            child: const Text('Excluir', style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }
}
