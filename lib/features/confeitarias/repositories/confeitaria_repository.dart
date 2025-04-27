import 'package:confeitaria_marketplace/shared/database/daos/confeitaria_dao.dart';
import 'package:confeitaria_marketplace/features/confeitarias/models/confeitaria_model.dart';

class ConfeitariaRepository {
  final ConfeitariaDao _dao;

  ConfeitariaRepository(this._dao);

  Future<List<ConfeitariaModel>> getAll({bool forceRefresh = false}) async {
    try {
      return await _dao.getAllConfeitarias();
    } catch (e) {
      throw RepositoryException('Falha ao buscar confeitarias: $e');
    }
  }

  Future<ConfeitariaModel> add(ConfeitariaModel confeitaria) async {
    try {
      final id = await _dao.insertConfeitaria(confeitaria);
      return confeitaria.copyWith(id: id);
    } catch (e) {
      throw RepositoryException('Falha ao adicionar confeitaria: $e');
    }
  }

  Future<ConfeitariaModel> update(ConfeitariaModel confeitaria) async {
    try {
      if (confeitaria.id == null) {
        throw RepositoryException('ID da confeitaria não pode ser nulo para atualização');
      }
      await _dao.updateConfeitaria(confeitaria);
      return confeitaria;
    } catch (e) {
      throw RepositoryException('Falha ao atualizar confeitaria: $e');
    }
  }

  Future<void> delete(int id) async {  // Alterado para int
    try {
      await _dao.deleteConfeitaria(id);
    } catch (e) {
      throw RepositoryException('Falha ao remover confeitaria: $e');
    }
  }

  // Métodos adicionais recomendados
  Future<ConfeitariaModel?> getById(int id) async {
    try {
      return await _dao.getConfeitariaById(id);
    } catch (e) {
      throw RepositoryException('Falha ao buscar confeitaria por ID: $e');
    }
  }

  Future<List<ConfeitariaModel>> getNearby(double lat, double lng, double radius) async {
    try {
      return await _dao.getConfeitariasProximas(lat, lng, radius);
    } catch (e) {
      throw RepositoryException('Falha ao buscar confeitarias próximas: $e');
    }
  }
}

class RepositoryException implements Exception {
  final String message;
  RepositoryException(this.message);

  @override
  String toString() => 'RepositoryException: $message';
}