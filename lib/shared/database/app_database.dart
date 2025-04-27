import 'dart:convert'; // Para jsonEncode/jsonDecode
import 'dart:io'; // Para File

import 'package:drift/drift.dart'; // Core do Drift
import 'package:drift/native.dart'; // Para database nativo
import 'package:path_provider/path_provider.dart'; // Para getApplicationDocumentsDirectory
import 'package:path/path.dart' as p; // Para join de paths

part 'app_database.g.dart'; // Arquivo gerado pelo build_runner


class ImagensConverter extends TypeConverter<List<String>, String> {
  const ImagensConverter();
  
  @override
  List<String> fromSql(String fromDb) {
    return jsonDecode(fromDb).cast<String>();
  }
  
  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}

@DataClassName('ConfeitariaData')
class Confeitarias extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 3, max: 100)();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get cep => text().withLength(min: 8, max: 9)();
  TextColumn get rua => text()();
  TextColumn get numero => text()();
  TextColumn get bairro => text()();
  TextColumn get cidade => text()();
  TextColumn get estado => text().withLength(min: 2, max: 2)();
  TextColumn get telefone => text().withLength(min: 10, max: 15)();
  TextColumn get imagens => text().nullable()();

  // Índices DEVEM ficar DENTRO da classe, como membros da classe
  @override
  List<TableIndex> get indexes => [
    TableIndex(name: 'idx_confeitaria_cep', columns: {#cep}),
    TableIndex(name: 'idx_confeitaria_cidade', columns: {#cidade}),
  ];
}

@DataClassName('ProdutoData')
class Produtos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get confeitariaId => integer().references(Confeitarias, #id, onDelete: KeyAction.cascade)();
  TextColumn get nome => text().withLength(min: 3, max: 100)();
  RealColumn get valor => real().withDefault(const Constant(0.0))();
  TextColumn get descricao => text().nullable()();
  TextColumn get imagens => text().map(const ImagensConverter())();

  // Índices como membros da classe
  @override
  List<TableIndex> get indexes => [
    TableIndex(name: 'idx_produto_confeitaria', columns: {#confeitariaId}),
    TableIndex(name: 'idx_produto_nome', columns: {#nome}),
  ];
}

@DriftDatabase(tables: [Confeitarias, Produtos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  
  @override
  int get schemaVersion => 1;
  
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Implementar quando tiver novas versões
      },
    );
  }
  
  // Métodos úteis
  Future<List<ProdutoData>> produtosDaConfeitaria(int id) async {
    return (select(produtos)..where((p) => p.confeitariaId.equals(id))).get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'confeitarias.sqlite'));
    return NativeDatabase(file);
  });
}
