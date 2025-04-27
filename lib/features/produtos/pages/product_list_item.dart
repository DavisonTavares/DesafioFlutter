import 'package:confeitaria_marketplace/features/confeitarias/models/confeitaria_model.dart';
import 'package:flutter/material.dart';
import 'package:confeitaria_marketplace/features/produtos/models/produto_model.dart';
import 'dart:io';

class ProductListItem extends StatelessWidget {
  final ProdutoModel produto;
  final ConfeitariaModel confeitaria; // Adicionando a variável confeitaria

  const ProductListItem({super.key, required this.produto, required this.confeitaria});

  @override
  Widget build(BuildContext context) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Carrossel de imagens (ou imagem única)
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: produto.imagens.isNotEmpty
              ? SizedBox(
                  height: 100,    
                  child: PageView.builder(
                    itemCount: produto.imagens.length,
                    itemBuilder: (context, index) {
                      return Image.file(
                        File(produto.imagens[index]),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                )
              : Container(
                  height: 80,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.image_not_supported, size: 40)),
                ),
        ),

        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                produto.nome,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,                
              ),
              if (produto.descricao != null && produto.descricao!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    produto.descricao!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              const SizedBox(height: 10),
              Text(
                "R\$ ${produto.valor.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.purple,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

}
