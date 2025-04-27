part of 'confeitaria_bloc.dart'; 

// Todos os estados devem estender Equatable para comparação eficiente
abstract class ConfeitariaState extends Equatable {
  const ConfeitariaState();

  @override
  List<Object?> get props => [];
}

// Estado inicial e de carregamento
class ConfeitariaInitial extends ConfeitariaState {
  const ConfeitariaInitial();
}

class ConfeitariaLoading extends ConfeitariaState {
  const ConfeitariaLoading();
}

// Estado para lista carregada
class ConfeitariaLoaded extends ConfeitariaState {
  final List<ConfeitariaModel> confeitarias;
  final bool hasReachedMax; // Útil para paginação

  const ConfeitariaLoaded({
    required this.confeitarias,
    this.hasReachedMax = false,
  });

  // Cópia para imutabilidade
  ConfeitariaLoaded copyWith({
    List<ConfeitariaModel>? confeitarias,
    bool? hasReachedMax,
  }) {
    return ConfeitariaLoaded(
      confeitarias: confeitarias ?? this.confeitarias,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [confeitarias, hasReachedMax];
}

// Estado de erro
class ConfeitariaError extends ConfeitariaState {
  final String message;
  final int? statusCode; // Adicional para tratamento específico

  const ConfeitariaError(this.message, {this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

// Estado para operações em progresso
class ConfeitariaOperationInProgress extends ConfeitariaState {
  const ConfeitariaOperationInProgress();
}

// Estado para detalhes carregados
class ConfeitariaDetailLoaded extends ConfeitariaState {
  final ConfeitariaModel confeitaria;

  const ConfeitariaDetailLoaded({required this.confeitaria});

  @override
  List<Object> get props => [confeitaria];
}

// Estado para operações específicas
class ConfeitariaOperationSuccess extends ConfeitariaState {
  final String message;
  final ConfeitariaModel? confeitaria;

  const ConfeitariaOperationSuccess(this.message, {this.confeitaria});

  @override
  List<Object?> get props => [message, confeitaria];
}

// Estado para quando nenhuma confeitaria é encontrada
class ConfeitariaEmpty extends ConfeitariaState {}

// Estado para buscas específicas
class ConfeitariaSearchResults extends ConfeitariaState {
  final List<ConfeitariaModel> results;
  
  const ConfeitariaSearchResults(this.results);
}


class EnderecoCarregando extends ConfeitariaState {}

class EnderecoCarregado extends ConfeitariaState {
  final String rua;
  final String bairro;
  final String cidade;
  final String estado;

  EnderecoCarregado({
    required this.rua,
    required this.bairro,
    required this.cidade,
    required this.estado,
  });
}

class ErroAoBuscarEndereco extends ConfeitariaState {
  final String mensagem;
  ErroAoBuscarEndereco(this.mensagem);
}
