part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class AddImages extends ProductEvent {
  final List<XFile> images;

  const AddImages(this.images);

  @override
  List<Object> get props => [images];
}

class RemoveImage extends ProductEvent {
  final XFile image;

  const RemoveImage(this.image);

  @override
  List<Object> get props => [image];
}

class SubmitProductForm extends ProductEvent {
  final String name;
  final double value;
  final String description;
  final int? id;
  final int confeitariaId;
  final List<String> imagesPaths;

  const SubmitProductForm({
    required this.name,
    required this.value,
    required this.description,
    this.id,
    required this.confeitariaId,
    this.imagesPaths = const [],
  });

  @override
  List<Object> get props => [name, value, description, id ?? 0, confeitariaId];
}


class UpdateProductForm extends ProductEvent {
  final int produtoId;
  final String name;
  final double value;
  final String description;
  final List<String> imagesPaths;

  UpdateProductForm({
    required this.produtoId,
    required this.name,
    required this.value,
    required this.description,
    required this.imagesPaths,
  });
}

class LoadProdutos extends ProductEvent {
  final int confeitariaId;

  const LoadProdutos(this.confeitariaId);

  @override
  List<Object> get props => [confeitariaId];
}

class DeleteProduct extends ProductEvent {
  final int produtoId;

  const DeleteProduct(this.produtoId);

  @override
  List<Object> get props => [produtoId];
}