import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:confeitaria_marketplace/features/produtos/models/produto_model.dart';
import 'package:confeitaria_marketplace/features/produtos/repositories/produto_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProdutoRepository produtoRepository;
  final int confeitariaId;


  ProductBloc({
    required this.produtoRepository,
    required this.confeitariaId, required produtoDao,
  }) : super(const ProductState()) {
    on<AddImages>(_onAddImages);
    on<RemoveImage>(_onRemoveImage);
    on<SubmitProductForm>(_onSubmitProductForm);
    on<LoadProdutos>(_onLoadProdutos);
    on<UpdateProductForm>(_onUpdateProductForm);
    on<DeleteProduct>(_onDeleteProduct);
  }
  void _onAddImages(AddImages event, Emitter<ProductState> emit) {
    final updatedImages = List<XFile>.from(state.images)..addAll(event.images);
    emit(state.copyWith(images: updatedImages));
  }

  void _onRemoveImage(RemoveImage event, Emitter<ProductState> emit) {
    final updatedImages = List<XFile>.from(state.images)..remove(event.image);
    emit(state.copyWith(images: updatedImages));
  }

  Future<void> _onSubmitProductForm(SubmitProductForm event, Emitter<ProductState> emit) async {
    try {
      // Validação simples: Checar se todos os campos obrigatórios estão preenchidos
      if (event.name.isEmpty || event.value <= 0 || event.description.isEmpty) {
        emit(state.copyWith(submitted: false, error: 'Por favor, preencha todos os campos corretamente.'));
        return;
      }

      // Criando o modelo de produto com os dados do evento
      final produto = ProdutoModel(
        id: event.id ?? 0, // Se for um novo produto, o id será 0
        confeitariaId: event.confeitariaId,
        nome: event.name,
        valor: event.value,
        descricao: event.description,
        imagens: state.images.map((e) => e.path).toList(), // Convertendo imagens para paths
      );

      // Chama o repositório para salvar ou atualizar o produto
      if (event.id == null) {
        // Inserir novo produto
        await produtoRepository.inserir(produto);
      } else {
        // Atualizar produto existente
        await produtoRepository.atualizar(produto);
      }

      emit(state.copyWith(submitted: true, error: ''));
    } catch (e) {
      // Em caso de erro, pode exibir uma mensagem
      emit(state.copyWith(submitted: false, error: 'Erro ao salvar produto.'));
    }
  }

  Future _onLoadProdutos(LoadProdutos event, Emitter<ProductState> emit) async {
  try {
    emit(ProductLoading());
    // Chama o repositório para listar os produtos da confeitaria
    final produtos = await produtoRepository.listarPorConfeitaria(event.confeitariaId);
    emit(ProductLoaded(produtos: produtos));   
  } catch (e) {
    emit(state.copyWith(error: 'Erro ao carregar produtos'));
  }
}

Future<void> _onUpdateProductForm(UpdateProductForm event, Emitter<ProductState> emit) async {
  try {
    emit(state.copyWith(isLoading: true));

    // Atualiza o produto
    final produtoAtualizado = ProdutoModel(
      id: event.produtoId,
      confeitariaId: confeitariaId,
      nome: event.name,
      valor: event.value,
      descricao: event.description,
      imagens: event.imagesPaths,
    );

    await produtoRepository.atualizar(produtoAtualizado);

    add(LoadProdutos(confeitariaId));

    emit(state.copyWith(isLoading: false, submitted: true, error: ""));
  } catch (e) {
    emit(state.copyWith(isLoading: false, submitted: false, error: "Erro ao atualizar produto."));
  }
}


  Future<void> _onDeleteProduct(DeleteProduct event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      await produtoRepository.deletar(event.produtoId);
      final produtos = await produtoRepository.listarPorConfeitaria(confeitariaId);
      emit(ProductLoaded(produtos: produtos));
    } catch (e) {
      emit(ProductError('Erro ao deletar produto'));
    }
  }    
}

