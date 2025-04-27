part of 'confeitaria_bloc.dart'; 

abstract class ConfeitariaEvent extends Equatable {
  const ConfeitariaEvent();

  @override
  List<Object?> get props => [];
}

// Evento: Carregar todas as confeitarias
class LoadConfeitarias extends ConfeitariaEvent {
  final bool forceRefresh; // Para atualização forçada

  const LoadConfeitarias({this.forceRefresh = false});

  @override
  List<Object?> get props => [forceRefresh];
}

// Evento: Adicionar nova confeitaria
class AddConfeitaria extends ConfeitariaEvent {
  final ConfeitariaModel confeitaria;

  const AddConfeitaria(this.confeitaria);

  @override
  List<Object> get props => [confeitaria];
}

// Evento: Atualizar confeitaria existente
class UpdateConfeitaria extends ConfeitariaEvent {
  final ConfeitariaModel confeitaria;

  const UpdateConfeitaria(this.confeitaria);

  @override
  List<Object> get props => [confeitaria];
}

// Evento: Remover confeitaria
class DeleteConfeitaria extends ConfeitariaEvent {
  final String confeitariaId;

  const DeleteConfeitaria(this.confeitariaId);

  @override
  List<Object> get props => [confeitariaId];
}

// Evento: Buscar confeitaria por ID
class GetConfeitariaById extends ConfeitariaEvent {
  final String id;

  const GetConfeitariaById(this.id);

  @override
  List<Object> get props => [id];
}

// Evento: Buscar confeitarias por localização
class GetConfeitariasProximas extends ConfeitariaEvent {
  final double latitude;
  final double longitude;
  final double raioKm;

  const GetConfeitariasProximas({
    required this.latitude,
    required this.longitude,
    required this.raioKm,
  });

  @override
  List<Object> get props => [latitude, longitude, raioKm];
}

// Evento: Filtrar confeitarias
class FilterConfeitarias extends ConfeitariaEvent {
  final String? nome;
  final String? cidade;
  final double? ratingMinimo;

  const FilterConfeitarias({
    this.nome,
    this.cidade,
    this.ratingMinimo,
  });

  @override
  List<Object?> get props => [nome, cidade, ratingMinimo];
}

class ResetConfeitariaState extends ConfeitariaEvent {}

class BuscarEnderecoPorCep extends ConfeitariaEvent {
  final String cep;
  BuscarEnderecoPorCep(this.cep);
}
