import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:confeitaria_marketplace/features/confeitarias/models/confeitaria_model.dart';
import 'package:confeitaria_marketplace/features/confeitarias/bloc/confeitaria_bloc.dart';
import 'package:confeitaria_marketplace/features/confeitarias/pages/form/confeitaria_dialog.dart';
import 'package:confeitaria_marketplace/features/confeitarias/pages/list/confeitaria_list_page.dart';
import 'package:confeitaria_marketplace/features/confeitarias/repositories/confeitaria_repository.dart';

class ConfeitariaDetailPage extends StatefulWidget {
  final ConfeitariaModel confeitariaId;
  const ConfeitariaDetailPage({super.key, required this.confeitariaId});

  @override
  State<ConfeitariaDetailPage> createState() => _ConfeitariaDetailPageState();
}

class _ConfeitariaDetailPageState extends State<ConfeitariaDetailPage> {
  final Completer<GoogleMapController> _mapController = Completer();

  Widget build(BuildContext context) {
  return BlocBuilder<ConfeitariaBloc, ConfeitariaState>(
    builder: (context, state) {
      if (state is ConfeitariaLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is ConfeitariaLoaded) {
        final cafeteria = state.confeitarias.firstWhere(
          (c) => c.id == widget.confeitariaId.id,
          orElse: () => widget.confeitariaId, // fallback se não encontrar no bloc
        );

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 640,
                  child: Stack(
                    children: [
                      buildImageCarousel(cafeteria),
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
                                icon: const Icon(Icons.edit),
                                iconSize: 20,
                                color: Colors.white,
                                onPressed: () {
                                  _showAddDialog(context, cafeteria); // Passando a confeitaria para edição
                                }),
                            ),
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
                                icon: const Icon(Icons.delete),
                                iconSize: 20,
                                color: Colors.white,
                                onPressed: () => _confirmDelete(context, cafeteria),
                                ),
                            ),                                
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 350,
                        left: 16,
                        right: 16,
                        bottom: -56,
                        child: _buildDetails(context, cafeteria),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildMap(cafeteria),
              ],
            ),
          ),
        );
      } else {
        return const Center(child: Text('Erro ao carregar confeitaria'));
      }
    },
  );
}




  // Carrossel de imagens
  Widget buildImageCarousel(ConfeitariaModel confeitaria) {
    return CarouselSlider.builder(
      itemCount: confeitaria.imagens.isEmpty ? 1 : confeitaria.imagens.length,
      itemBuilder: (context, index, realIndex) {
        if (confeitaria.imagens.isEmpty) {
          return const Icon(Icons.cake, size: 40);
        }

        String imagePath = confeitaria.imagens[index];
        File imageFile = File(imagePath);
        return Image(
          image: FileImage(imageFile),
          fit: BoxFit.cover,
          width: double.infinity,
        );
      },
      options: CarouselOptions(
        height: 400,
        viewportFraction: 1.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }

  // Detalhes da confeitaria com bordas arredondadas sobrepondo a imagem
  Widget _buildDetails(BuildContext context, ConfeitariaModel confeitaria) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoCard(
          context,
          title: 'Endereço',
          icon: Icons.location_on,
          details: '${confeitaria.rua}, ${confeitaria.numero}\nBairro: ${confeitaria.bairro}\nCidade/Estado: ${confeitaria.cidade}/${confeitaria.estado}',
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          context,
          title: 'Contato',
          icon: Icons.phone,
          details: confeitaria.telefone,
        ),
      ],
    ),
  );
}

Widget _buildInfoCard(BuildContext context, {required String title, required IconData icon, required String details}) {
  return Container(
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
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 28, color: Colors.purple),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          details,
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    ),
  );
}

  // Mapa interativo com a localização da confeitaria
  Widget _buildMap(ConfeitariaModel confeitaria) {
    final LatLng position = LatLng(confeitaria.latitude, confeitaria.longitude);

    return SizedBox(
      height: 200,
      width: double.infinity,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: position,
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('confeitaria'),
            position: position,
            infoWindow: InfoWindow(title: confeitaria.nome),
          ),
        },
        onMapCreated: (GoogleMapController controller) {
          _mapController.complete(controller);
        },
        myLocationEnabled: true,
        compassEnabled: true,
      ),
    );
  }

  void _showAddDialog(BuildContext context, ConfeitariaModel? confeitaria) {
  showDialog(
    context: context,
    builder: (context) => AddConfeitariaDialog(
      confeitaria: confeitaria, // Passando a confeitaria para edição
    ),
  );
}

void _confirmDelete(BuildContext context, ConfeitariaModel confeitaria) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Confirmar exclusão'),
      content: Text('Excluir ${confeitaria.nome}?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Fechar a caixa de diálogo
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            // Disparar o evento de exclusão
            context.read<ConfeitariaBloc>().add(
              DeleteConfeitaria(confeitaria.id.toString()), // Certifique-se de que o ID seja passado corretamente
            );
            Navigator.pop(context); // Fechar a caixa de diálogo

            // Atualizar a lista na página atual
            context.read<ConfeitariaBloc>().add(LoadConfeitarias(forceRefresh: true));

            // Voltar para a página anterior sem criar uma nova instância
            Navigator.pop(context);
            Navigator.pop(context);

          },
          child: const Text('Excluir'),
        ),
      ],
    ),
  );
}

}
