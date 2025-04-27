import 'package:bloc/bloc.dart';
import 'package:confeitaria_marketplace/features/confeitarias/repositories/confeitaria_repository.dart';
import 'package:confeitaria_marketplace/features/confeitarias/models/confeitaria_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



part 'confeitaria_event.dart';
part 'confeitaria_state.dart';

class ConfeitariaBloc extends Bloc<ConfeitariaEvent, ConfeitariaState> {
  final ConfeitariaRepository _repository;

  ConfeitariaBloc(this._repository) : super(ConfeitariaInitial()) {
    on<LoadConfeitarias>(_onLoadConfeitarias);
    on<AddConfeitaria>(_onAddConfeitaria);
    on<UpdateConfeitaria>(_onUpdateConfeitaria);
    on<DeleteConfeitaria>(_onDeleteConfeitaria);
    on<GetConfeitariaById>(_onGetConfeitariaById);
    on<GetConfeitariasProximas>(_onGetConfeitariasProximas);
    on<BuscarEnderecoPorCep>(_onBuscarEnderecoPorCep);
    //on<FilterConfeitarias>(_onFilterConfeitarias);
  }

  Future<void> _onLoadConfeitarias(
    LoadConfeitarias event,
    Emitter<ConfeitariaState> emit,
  ) async {
    try {
      emit(ConfeitariaLoading());
      final confeitarias = await _repository.getAll(forceRefresh: event.forceRefresh);
      emit(ConfeitariaLoaded(confeitarias: confeitarias));
    } catch (e) {
      emit(ConfeitariaError('Falha ao carregar confeitarias: ${e.toString()}'));
      add(ResetConfeitariaState()); // Novo evento para resetar o estado
    }
  }

  Future<void> _onAddConfeitaria(
    AddConfeitaria event,
    Emitter<ConfeitariaState> emit,
  ) async {
    try {
      print('Adicionando confeitaria: ${event.confeitaria}');
      emit(ConfeitariaOperationInProgress());
      final novaConfeitaria = await _repository.add(event.confeitaria);
      emit(ConfeitariaOperationSuccess(
        'Confeitaria adicionada com sucesso!',
        confeitaria: novaConfeitaria,
      ));
      add(LoadConfeitarias(forceRefresh: true)); // Força recarregar dados atualizados
    } catch (e) {
      print('Erro ao adicionar confeitaria: $e');
      emit(ConfeitariaError('Falha ao adicionar confeitaria: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateConfeitaria(
  UpdateConfeitaria event,
  Emitter<ConfeitariaState> emit,
) async {
  try {
    if (event.confeitaria.id == null ) {
      emit(ConfeitariaError('ID da confeitaria não pode ser nulo ou vazio'));
      return;
    }

    emit(ConfeitariaOperationInProgress());

    // Realiza a atualização
    final updatedConfeitaria = await _repository.update(event.confeitaria);

    // Emissão de sucesso com o estado atualizado
    emit(ConfeitariaOperationSuccess(
      'Confeitaria atualizada com sucesso!',
      confeitaria: updatedConfeitaria,
    ));
    add(LoadConfeitarias(forceRefresh: true));  // Força a atualização das confeitarias na UI

  } catch (e) {
    emit(ConfeitariaError('Falha ao atualizar confeitaria: ${e.toString()}'));
  }
}



  Future<void> _onDeleteConfeitaria(
    DeleteConfeitaria event,
    Emitter<ConfeitariaState> emit,
  ) async {
    try {
      emit(ConfeitariaOperationInProgress());
      final id = int.tryParse(event.confeitariaId) ?? 0;
      if (id == 0) {
        emit(ConfeitariaError('ID inválido para remoção'));
        return;
      }
      await _repository.delete(id);
      emit(ConfeitariaOperationSuccess('Confeitaria removida com sucesso!'));
      
      // Atualiza a lista sem precisar recarregar tudo
      if (state is ConfeitariaLoaded) {
        final currentState = state as ConfeitariaLoaded;
        final updatedList = currentState.confeitarias
          .where((c) => c.id != event.confeitariaId)
          .toList();
        emit(ConfeitariaLoaded(confeitarias: updatedList));
      }
    } catch (e) {
      emit(ConfeitariaError('Falha ao remover confeitaria: ${e.toString()}'));
    }
  }

  Future<void> _onGetConfeitariaById(
    GetConfeitariaById event,
    Emitter<ConfeitariaState> emit,
  ) async {
    try {
      emit(ConfeitariaLoading());
      final id = int.tryParse(event.id) ?? 0;
      if (id == 0) {
        emit(ConfeitariaError('ID inválido'));
        return;
      }
      final confeitaria = await _repository.getById(id);
      
      if (confeitaria == null) {
        emit(ConfeitariaError('Confeitaria não encontrada'));
      } else {
        emit(ConfeitariaDetailLoaded(confeitaria: confeitaria));
      }
    } catch (e) {
      emit(ConfeitariaError('Falha ao buscar confeitaria: ${e.toString()}'));
    }
  }

  Future<void> _onGetConfeitariasProximas(
    GetConfeitariasProximas event,
    Emitter<ConfeitariaState> emit,
  ) async {
    try {
      emit(ConfeitariaLoading());
      final confeitarias = await _repository.getNearby(
        event.latitude,
        event.longitude,
        event.raioKm,
      );
      emit(ConfeitariaLoaded(confeitarias: confeitarias));
    } catch (e) {
      emit(ConfeitariaError('Falha ao buscar confeitarias próximas: ${e.toString()}'));
    }
  }

  Future<void> _onBuscarEnderecoPorCep(
    BuscarEnderecoPorCep event,
    Emitter<ConfeitariaState> emit,
  ) async {
    emit(EnderecoCarregando());
    try {
      final response = await http.get(
        Uri.parse('https://viacep.com.br/ws/${event.cep}/json/'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['erro'] == true) {
          emit(ErroAoBuscarEndereco('CEP não encontrado.'));
        } else {
          emit(EnderecoCarregado(
            rua: data['logradouro'] ?? '',
            bairro: data['bairro'] ?? '',
            cidade: data['localidade'] ?? '',
            estado: data['uf'] ?? '',
          ));
        }
      } else {
        emit(ErroAoBuscarEndereco('Erro ao buscar CEP.'));
      }
    } catch (e) {
      emit(ErroAoBuscarEndereco('Erro ao buscar CEP: $e'));
    }
  }


  /*
  Future<void> _onFilterConfeitarias(
    FilterConfeitarias event,
    Emitter<ConfeitariaState> emit,
  ) async {
    try {
      emit(ConfeitariaLoading());
      final confeitarias = await _repository.filter(
        nome: event.nome,
        cidade: event.cidade,
        ratingMinimo: event.ratingMinimo,
      );
      emit(ConfeitariaLoaded(confeitarias: confeitarias));
    } catch (e) {
      emit(ConfeitariaError('Falha ao filtrar confeitarias: ${e.toString()}'));
    }
  }*/
}