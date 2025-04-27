part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<XFile> images;
  final bool submitted;
  final String error;
  final List<ProdutoModel> produtos; 
  final bool isLoading;

  const ProductState({
    this.images = const [],
    this.submitted = false,
    this.error = '',
    this.isLoading = false,
    this.produtos = const [], // Inicializando a lista de produtos
  });

  ProductState copyWith({
    List<XFile>? images,
    bool? submitted,
    String? error,
    List<ProdutoModel>? produtos, 
    bool? isLoading,
  }) {
    return ProductState(
      images: images ?? this.images,
      submitted: submitted ?? this.submitted,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      produtos: produtos ?? this.produtos, // Atualizando a lista de produtos
    );
  }

  @override
  List<Object> get props => [images, submitted, error, produtos]; 
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProdutoModel> produtos;

  const ProductLoaded({required this.produtos});

  @override
  List<Object> get props => [produtos];
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object> get props => [message];
}