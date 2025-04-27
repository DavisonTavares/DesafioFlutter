import 'dart:io';

import 'package:confeitaria_marketplace/features/confeitarias/models/confeitaria_model.dart';
import 'package:confeitaria_marketplace/features/produtos/models/produto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../bloc/product_bloc.dart';

class ProductFormPage extends StatefulWidget {
  final ConfeitariaModel confeitaria;
  final ProdutoModel? produto;
  const ProductFormPage({Key? key, this.produto, required this.confeitaria}) : super(key: key);

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _nameController = TextEditingController();
  final _valueController = TextEditingController();
  final _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  List<String> _initialImages = []; // imagens que já existiam

  @override
  void initState() {
    super.initState();
    if (widget.produto != null) {
      _nameController.text = widget.produto!.nome;
      _valueController.text = widget.produto!.valor.toString();
      _descriptionController.text = widget.produto!.descricao ?? "";
      _initialImages = widget.produto!.imagens ?? [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final confeitaria = widget.confeitaria;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto == null ? "Novo Produto" : "Editar Produto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Nome do Produto", _nameController),
              const SizedBox(height: 16),
              _buildTextField("Valor", _valueController, keyboardType: TextInputType.number),
              const SizedBox(height: 16),
              _buildTextField("Descrição", _descriptionController, maxLines: 4),
              const SizedBox(height: 24),
              Text(
                "Imagens do Produto",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              _buildImagePicker(context),              
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: Text(widget.produto == null ? "Salvar Produto" : "Atualizar Produto"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _onSaveProduct,
                ),
              ),
              const SizedBox(height: 16),
              if (widget.produto != null) ...[
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.delete),
                    label: const Text("Excluir Produto"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _onDeleteProduct,
                  ),
                ),
              ],

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildImagePicker(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_initialImages.isNotEmpty || state.images.isNotEmpty)
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ..._initialImages.map((path) => Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(path),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.red, size: 20),
                            onPressed: () {
                              setState(() {
                                _initialImages.remove(path);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
                  ...state.images.map((image) => Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(image.path),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.red, size: 20),
                            onPressed: () {
                              context.read<ProductBloc>().add(RemoveImage(image));
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              )
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Center(child: Text("Nenhuma imagem adicionada")),
              ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _onPickImages,
                icon: const Icon(Icons.image_outlined),
                label: const Text("Adicionar Imagens"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.purple,
                  side: const BorderSide(color: Colors.purple),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _onPickImages() async {
    final picked = await _picker.pickMultiImage();
    if (picked.isNotEmpty) {
      context.read<ProductBloc>().add(AddImages(picked));
    }
  }

  void _onSaveProduct() {
    final confeitaria = widget.confeitaria;
    final name = _nameController.text.trim();
    final valueText = _valueController.text.trim();
    final description = _descriptionController.text.trim();
    final parsedValue = double.tryParse(valueText);

    if (name.isEmpty || parsedValue == null || parsedValue <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha todos os campos corretamente.")),
      );
      return;
    }

    final imagesPaths = [
      ..._initialImages,
      ...context.read<ProductBloc>().state.images.map((e) => e.path),
    ];

    if (widget.produto == null) {      
      context.read<ProductBloc>().add(SubmitProductForm(
        name: name,
        value: parsedValue,
        description: description,
        confeitariaId: confeitaria.id!,
        imagesPaths: imagesPaths,
      ));
    } else {
      // edição de produto
      context.read<ProductBloc>().add(UpdateProductForm(
        produtoId: widget.produto!.id!,
        name: name,
        value: parsedValue,
        description: description,
        imagesPaths: imagesPaths,
      ));
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Produto salvo com sucesso!")),
    );

    Navigator.pop(context);
  }

  Future<void> _onDeleteProduct() async {
    if (widget.produto == null) return;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: const Text('Tem certeza que deseja excluir este produto?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    context.read<ProductBloc>().add(DeleteProduct(widget.produto!.id!));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Produto excluído com sucesso!")),
    );

    Navigator.pop(context);
  }
}
