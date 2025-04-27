import 'package:confeitaria_marketplace/features/confeitarias/pages/detail/confeitaria_detail_page.dart';
import 'package:confeitaria_marketplace/features/produtos/pages/product_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confeitaria_marketplace/features/produtos/bloc/product_bloc.dart';
import 'package:confeitaria_marketplace/features/produtos/pages/product_list_item.dart';
import 'package:confeitaria_marketplace/shared/database/daos/produto_dao.dart';
import 'package:confeitaria_marketplace/features/produtos/models/produto_model.dart';
import 'package:confeitaria_marketplace/features/produtos/repositories/produto_repository.dart';
import 'package:confeitaria_marketplace/features/confeitarias/models/confeitaria_model.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';

class ProductListPage extends StatelessWidget {
  final ConfeitariaModel confeitaria;

  const ProductListPage({super.key, required this.confeitaria});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 350,
                  child: Stack(
                    children: [
                      buildImageCarousel(confeitaria),
                      Positioned(
                        top: 40,
                        left: 16,
                        right: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                iconSize: 20,
                                color: Colors.white,
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                            Row(
                              children: [                                
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.add),
                                    iconSize: 20,
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => BlocProvider.value(
                                            value: context.read<ProductBloc>(),
                                            child: ProductFormPage(
                                                confeitaria: confeitaria),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 200,
                        left: 16,
                        right: 16,
                        bottom: -56,
                        child: _buildDetails(context, confeitaria),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                //_buildMap(confeitaria),
                _productList(confeitaria),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildImageCarousel(ConfeitariaModel confeitaria) {
    if (confeitaria.imagens.isEmpty) {
      return const SizedBox(
        height: 250,
        child: Center(child: Icon(Icons.cake, size: 80, color: Colors.purple)),
      );
    }

    String imagePath = confeitaria.imagens.first; // apenas a primeira imagem
    File imageFile = File(imagePath);
    return Image(
      image: FileImage(imageFile),
      fit: BoxFit.cover,
      width: double.infinity,
      height: 250,
    );
  }

  // Detalhes da confeitaria com bordas arredondadas sobrepondo a imagem
  Widget _buildDetails(BuildContext context, ConfeitariaModel confeitaria) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Cartão com nome e cidade
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
            child: Column(
              children: [
                Text(
                  confeitaria.nome,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                const SizedBox(height: 8),
                Text(
                  confeitaria.cidade,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // Ícone circular sobreposto
          Positioned(
            top: -30,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfeitariaDetailPage(
                        confeitariaId: confeitaria,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.cake,
                    size: 38,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _productList(ConfeitariaModel confeitaria) {
  return BlocBuilder<ProductBloc, ProductState>(
    builder: (context, state) {
      if (state is ProductLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is ProductLoaded) {
        final produtos = state.produtos
            .where((produto) => produto.confeitariaId == confeitaria.id)
            .toList();

        if (produtos.isEmpty) {
          return const Center(child: Text("Nenhum produto cadastrado."));
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: produtos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final produto = produtos[index];
            return GestureDetector(
              onTap: () {
                // Aqui você pode adicionar a navegação ou ação desejada
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<ProductBloc>(),
                      child: ProductFormPage(
                          produto: produto, confeitaria: confeitaria),
                    ),
                  ),
                );
              },
              child: ProductListItem(
                produto: produto,
                confeitaria: confeitaria, // Passando a confeitaria atual
              ),
            );
          },
        );
      } else if (state is ProductError) {
        return Center(child: Text("Erro: ${state.message}"));
      }

      return const SizedBox.shrink();
    },
  );
}




/*
Scaffold(
          body: 




        
    },
  );*/