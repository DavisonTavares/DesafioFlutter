import 'package:drift/drift.dart';
import 'package:confeitaria_marketplace/shared/database/app_database.dart';
import 'package:confeitaria_marketplace/features/confeitarias/models/confeitaria_model.dart';

part 'confeitaria_dao.g.dart';

@DriftAccessor(tables: [Confeitarias])
class ConfeitariaDao extends DatabaseAccessor<AppDatabase> 
    with _$ConfeitariaDaoMixin {
  ConfeitariaDao(AppDatabase db) : super(db);

  // ==== Métodos CRUD ====

  /// Insere uma confeitaria e retorna o ID
  Future<int> insertConfeitaria(ConfeitariaModel model) async {
    return await into(confeitarias).insert(model.toCompanion());
  }

  /// Busca todas as confeitarias (ordenadas por nome)
  Future<List<ConfeitariaModel>> getAllConfeitarias() async {
    final query = select(confeitarias)..orderBy([(t) => OrderingTerm(expression: t.nome)]);
    final results = await query.get();
    return results.map((data) => ConfeitariaModel.fromData(data)).toList();
  }

  /// Busca por ID
  Future<ConfeitariaModel?> getConfeitariaById(int id) async {
    final data = await (select(confeitarias)..where((t) => t.id.equals(id))).getSingleOrNull();
    return data != null ? ConfeitariaModel.fromData(data) : null;
  }

  /// Atualiza uma confeitaria
  Future<void> updateConfeitaria(ConfeitariaModel model) async {
    await update(confeitarias).replace(model.toCompanion());
  }

  /// Remove uma confeitaria (em cascata para produtos)
  Future<void> deleteConfeitaria(int id) async {
    await (delete(confeitarias)..where((t) => t.id.equals(id))).go();
  }

  // ==== Métodos Específicos ====

  /// Busca confeitarias próximas (exemplo simplificado)
  Future<List<ConfeitariaModel>> getConfeitariasProximas(
    double latitude, 
    double longitude, 
    double raioKm,
  ) async {
    final query = select(confeitarias)
      ..where((t) =>
        t.latitude.isBetweenValues(latitude - raioKm, latitude + raioKm) &
        t.longitude.isBetweenValues(longitude - raioKm, longitude + raioKm),
      );

    final results = await query.get();
    return results.map((data) => ConfeitariaModel.fromData(data)).toList();
  }
}