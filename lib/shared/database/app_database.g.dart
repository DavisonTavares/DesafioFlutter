// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ConfeitariasTable extends Confeitarias
    with TableInfo<$ConfeitariasTable, ConfeitariaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConfeitariasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _cepMeta = const VerificationMeta('cep');
  @override
  late final GeneratedColumn<String> cep = GeneratedColumn<String>(
      'cep', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 8, maxTextLength: 9),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ruaMeta = const VerificationMeta('rua');
  @override
  late final GeneratedColumn<String> rua = GeneratedColumn<String>(
      'rua', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<String> numero = GeneratedColumn<String>(
      'numero', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bairroMeta = const VerificationMeta('bairro');
  @override
  late final GeneratedColumn<String> bairro = GeneratedColumn<String>(
      'bairro', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cidadeMeta = const VerificationMeta('cidade');
  @override
  late final GeneratedColumn<String> cidade = GeneratedColumn<String>(
      'cidade', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
      'estado', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 2),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _telefoneMeta =
      const VerificationMeta('telefone');
  @override
  late final GeneratedColumn<String> telefone = GeneratedColumn<String>(
      'telefone', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 15),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _imagensMeta =
      const VerificationMeta('imagens');
  @override
  late final GeneratedColumn<String> imagens = GeneratedColumn<String>(
      'imagens', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nome,
        latitude,
        longitude,
        cep,
        rua,
        numero,
        bairro,
        cidade,
        estado,
        telefone,
        imagens
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'confeitarias';
  @override
  VerificationContext validateIntegrity(Insertable<ConfeitariaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('cep')) {
      context.handle(
          _cepMeta, cep.isAcceptableOrUnknown(data['cep']!, _cepMeta));
    } else if (isInserting) {
      context.missing(_cepMeta);
    }
    if (data.containsKey('rua')) {
      context.handle(
          _ruaMeta, rua.isAcceptableOrUnknown(data['rua']!, _ruaMeta));
    } else if (isInserting) {
      context.missing(_ruaMeta);
    }
    if (data.containsKey('numero')) {
      context.handle(_numeroMeta,
          numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta));
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('bairro')) {
      context.handle(_bairroMeta,
          bairro.isAcceptableOrUnknown(data['bairro']!, _bairroMeta));
    } else if (isInserting) {
      context.missing(_bairroMeta);
    }
    if (data.containsKey('cidade')) {
      context.handle(_cidadeMeta,
          cidade.isAcceptableOrUnknown(data['cidade']!, _cidadeMeta));
    } else if (isInserting) {
      context.missing(_cidadeMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('telefone')) {
      context.handle(_telefoneMeta,
          telefone.isAcceptableOrUnknown(data['telefone']!, _telefoneMeta));
    } else if (isInserting) {
      context.missing(_telefoneMeta);
    }
    if (data.containsKey('imagens')) {
      context.handle(_imagensMeta,
          imagens.isAcceptableOrUnknown(data['imagens']!, _imagensMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConfeitariaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConfeitariaData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      cep: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cep'])!,
      rua: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rua'])!,
      numero: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}numero'])!,
      bairro: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bairro'])!,
      cidade: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cidade'])!,
      estado: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}estado'])!,
      telefone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telefone'])!,
      imagens: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}imagens']),
    );
  }

  @override
  $ConfeitariasTable createAlias(String alias) {
    return $ConfeitariasTable(attachedDatabase, alias);
  }
}

class ConfeitariaData extends DataClass implements Insertable<ConfeitariaData> {
  final int id;
  final String nome;
  final double latitude;
  final double longitude;
  final String cep;
  final String rua;
  final String numero;
  final String bairro;
  final String cidade;
  final String estado;
  final String telefone;
  final String? imagens;
  const ConfeitariaData(
      {required this.id,
      required this.nome,
      required this.latitude,
      required this.longitude,
      required this.cep,
      required this.rua,
      required this.numero,
      required this.bairro,
      required this.cidade,
      required this.estado,
      required this.telefone,
      this.imagens});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['cep'] = Variable<String>(cep);
    map['rua'] = Variable<String>(rua);
    map['numero'] = Variable<String>(numero);
    map['bairro'] = Variable<String>(bairro);
    map['cidade'] = Variable<String>(cidade);
    map['estado'] = Variable<String>(estado);
    map['telefone'] = Variable<String>(telefone);
    if (!nullToAbsent || imagens != null) {
      map['imagens'] = Variable<String>(imagens);
    }
    return map;
  }

  ConfeitariasCompanion toCompanion(bool nullToAbsent) {
    return ConfeitariasCompanion(
      id: Value(id),
      nome: Value(nome),
      latitude: Value(latitude),
      longitude: Value(longitude),
      cep: Value(cep),
      rua: Value(rua),
      numero: Value(numero),
      bairro: Value(bairro),
      cidade: Value(cidade),
      estado: Value(estado),
      telefone: Value(telefone),
      imagens: imagens == null && nullToAbsent
          ? const Value.absent()
          : Value(imagens),
    );
  }

  factory ConfeitariaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConfeitariaData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      cep: serializer.fromJson<String>(json['cep']),
      rua: serializer.fromJson<String>(json['rua']),
      numero: serializer.fromJson<String>(json['numero']),
      bairro: serializer.fromJson<String>(json['bairro']),
      cidade: serializer.fromJson<String>(json['cidade']),
      estado: serializer.fromJson<String>(json['estado']),
      telefone: serializer.fromJson<String>(json['telefone']),
      imagens: serializer.fromJson<String?>(json['imagens']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'cep': serializer.toJson<String>(cep),
      'rua': serializer.toJson<String>(rua),
      'numero': serializer.toJson<String>(numero),
      'bairro': serializer.toJson<String>(bairro),
      'cidade': serializer.toJson<String>(cidade),
      'estado': serializer.toJson<String>(estado),
      'telefone': serializer.toJson<String>(telefone),
      'imagens': serializer.toJson<String?>(imagens),
    };
  }

  ConfeitariaData copyWith(
          {int? id,
          String? nome,
          double? latitude,
          double? longitude,
          String? cep,
          String? rua,
          String? numero,
          String? bairro,
          String? cidade,
          String? estado,
          String? telefone,
          Value<String?> imagens = const Value.absent()}) =>
      ConfeitariaData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        cep: cep ?? this.cep,
        rua: rua ?? this.rua,
        numero: numero ?? this.numero,
        bairro: bairro ?? this.bairro,
        cidade: cidade ?? this.cidade,
        estado: estado ?? this.estado,
        telefone: telefone ?? this.telefone,
        imagens: imagens.present ? imagens.value : this.imagens,
      );
  ConfeitariaData copyWithCompanion(ConfeitariasCompanion data) {
    return ConfeitariaData(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      cep: data.cep.present ? data.cep.value : this.cep,
      rua: data.rua.present ? data.rua.value : this.rua,
      numero: data.numero.present ? data.numero.value : this.numero,
      bairro: data.bairro.present ? data.bairro.value : this.bairro,
      cidade: data.cidade.present ? data.cidade.value : this.cidade,
      estado: data.estado.present ? data.estado.value : this.estado,
      telefone: data.telefone.present ? data.telefone.value : this.telefone,
      imagens: data.imagens.present ? data.imagens.value : this.imagens,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConfeitariaData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('cep: $cep, ')
          ..write('rua: $rua, ')
          ..write('numero: $numero, ')
          ..write('bairro: $bairro, ')
          ..write('cidade: $cidade, ')
          ..write('estado: $estado, ')
          ..write('telefone: $telefone, ')
          ..write('imagens: $imagens')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, latitude, longitude, cep, rua,
      numero, bairro, cidade, estado, telefone, imagens);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConfeitariaData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.cep == this.cep &&
          other.rua == this.rua &&
          other.numero == this.numero &&
          other.bairro == this.bairro &&
          other.cidade == this.cidade &&
          other.estado == this.estado &&
          other.telefone == this.telefone &&
          other.imagens == this.imagens);
}

class ConfeitariasCompanion extends UpdateCompanion<ConfeitariaData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> cep;
  final Value<String> rua;
  final Value<String> numero;
  final Value<String> bairro;
  final Value<String> cidade;
  final Value<String> estado;
  final Value<String> telefone;
  final Value<String?> imagens;
  const ConfeitariasCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.cep = const Value.absent(),
    this.rua = const Value.absent(),
    this.numero = const Value.absent(),
    this.bairro = const Value.absent(),
    this.cidade = const Value.absent(),
    this.estado = const Value.absent(),
    this.telefone = const Value.absent(),
    this.imagens = const Value.absent(),
  });
  ConfeitariasCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required double latitude,
    required double longitude,
    required String cep,
    required String rua,
    required String numero,
    required String bairro,
    required String cidade,
    required String estado,
    required String telefone,
    this.imagens = const Value.absent(),
  })  : nome = Value(nome),
        latitude = Value(latitude),
        longitude = Value(longitude),
        cep = Value(cep),
        rua = Value(rua),
        numero = Value(numero),
        bairro = Value(bairro),
        cidade = Value(cidade),
        estado = Value(estado),
        telefone = Value(telefone);
  static Insertable<ConfeitariaData> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? cep,
    Expression<String>? rua,
    Expression<String>? numero,
    Expression<String>? bairro,
    Expression<String>? cidade,
    Expression<String>? estado,
    Expression<String>? telefone,
    Expression<String>? imagens,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (cep != null) 'cep': cep,
      if (rua != null) 'rua': rua,
      if (numero != null) 'numero': numero,
      if (bairro != null) 'bairro': bairro,
      if (cidade != null) 'cidade': cidade,
      if (estado != null) 'estado': estado,
      if (telefone != null) 'telefone': telefone,
      if (imagens != null) 'imagens': imagens,
    });
  }

  ConfeitariasCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<String>? cep,
      Value<String>? rua,
      Value<String>? numero,
      Value<String>? bairro,
      Value<String>? cidade,
      Value<String>? estado,
      Value<String>? telefone,
      Value<String?>? imagens}) {
    return ConfeitariasCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      cep: cep ?? this.cep,
      rua: rua ?? this.rua,
      numero: numero ?? this.numero,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      telefone: telefone ?? this.telefone,
      imagens: imagens ?? this.imagens,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (cep.present) {
      map['cep'] = Variable<String>(cep.value);
    }
    if (rua.present) {
      map['rua'] = Variable<String>(rua.value);
    }
    if (numero.present) {
      map['numero'] = Variable<String>(numero.value);
    }
    if (bairro.present) {
      map['bairro'] = Variable<String>(bairro.value);
    }
    if (cidade.present) {
      map['cidade'] = Variable<String>(cidade.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (telefone.present) {
      map['telefone'] = Variable<String>(telefone.value);
    }
    if (imagens.present) {
      map['imagens'] = Variable<String>(imagens.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfeitariasCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('cep: $cep, ')
          ..write('rua: $rua, ')
          ..write('numero: $numero, ')
          ..write('bairro: $bairro, ')
          ..write('cidade: $cidade, ')
          ..write('estado: $estado, ')
          ..write('telefone: $telefone, ')
          ..write('imagens: $imagens')
          ..write(')'))
        .toString();
  }
}

class $ProdutosTable extends Produtos
    with TableInfo<$ProdutosTable, ProdutoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProdutosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _confeitariaIdMeta =
      const VerificationMeta('confeitariaId');
  @override
  late final GeneratedColumn<int> confeitariaId = GeneratedColumn<int>(
      'confeitaria_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES confeitarias (id) ON DELETE CASCADE'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _valorMeta = const VerificationMeta('valor');
  @override
  late final GeneratedColumn<double> valor = GeneratedColumn<double>(
      'valor', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _descricaoMeta =
      const VerificationMeta('descricao');
  @override
  late final GeneratedColumn<String> descricao = GeneratedColumn<String>(
      'descricao', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> imagens =
      GeneratedColumn<String>('imagens', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($ProdutosTable.$converterimagens);
  @override
  List<GeneratedColumn> get $columns =>
      [id, confeitariaId, nome, valor, descricao, imagens];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'produtos';
  @override
  VerificationContext validateIntegrity(Insertable<ProdutoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('confeitaria_id')) {
      context.handle(
          _confeitariaIdMeta,
          confeitariaId.isAcceptableOrUnknown(
              data['confeitaria_id']!, _confeitariaIdMeta));
    } else if (isInserting) {
      context.missing(_confeitariaIdMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('valor')) {
      context.handle(
          _valorMeta, valor.isAcceptableOrUnknown(data['valor']!, _valorMeta));
    }
    if (data.containsKey('descricao')) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProdutoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProdutoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      confeitariaId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}confeitaria_id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      valor: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}valor'])!,
      descricao: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descricao']),
      imagens: $ProdutosTable.$converterimagens.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}imagens'])!),
    );
  }

  @override
  $ProdutosTable createAlias(String alias) {
    return $ProdutosTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterimagens =
      const ImagensConverter();
}

class ProdutoData extends DataClass implements Insertable<ProdutoData> {
  final int id;
  final int confeitariaId;
  final String nome;
  final double valor;
  final String? descricao;
  final List<String> imagens;
  const ProdutoData(
      {required this.id,
      required this.confeitariaId,
      required this.nome,
      required this.valor,
      this.descricao,
      required this.imagens});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['confeitaria_id'] = Variable<int>(confeitariaId);
    map['nome'] = Variable<String>(nome);
    map['valor'] = Variable<double>(valor);
    if (!nullToAbsent || descricao != null) {
      map['descricao'] = Variable<String>(descricao);
    }
    {
      map['imagens'] =
          Variable<String>($ProdutosTable.$converterimagens.toSql(imagens));
    }
    return map;
  }

  ProdutosCompanion toCompanion(bool nullToAbsent) {
    return ProdutosCompanion(
      id: Value(id),
      confeitariaId: Value(confeitariaId),
      nome: Value(nome),
      valor: Value(valor),
      descricao: descricao == null && nullToAbsent
          ? const Value.absent()
          : Value(descricao),
      imagens: Value(imagens),
    );
  }

  factory ProdutoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProdutoData(
      id: serializer.fromJson<int>(json['id']),
      confeitariaId: serializer.fromJson<int>(json['confeitariaId']),
      nome: serializer.fromJson<String>(json['nome']),
      valor: serializer.fromJson<double>(json['valor']),
      descricao: serializer.fromJson<String?>(json['descricao']),
      imagens: serializer.fromJson<List<String>>(json['imagens']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'confeitariaId': serializer.toJson<int>(confeitariaId),
      'nome': serializer.toJson<String>(nome),
      'valor': serializer.toJson<double>(valor),
      'descricao': serializer.toJson<String?>(descricao),
      'imagens': serializer.toJson<List<String>>(imagens),
    };
  }

  ProdutoData copyWith(
          {int? id,
          int? confeitariaId,
          String? nome,
          double? valor,
          Value<String?> descricao = const Value.absent(),
          List<String>? imagens}) =>
      ProdutoData(
        id: id ?? this.id,
        confeitariaId: confeitariaId ?? this.confeitariaId,
        nome: nome ?? this.nome,
        valor: valor ?? this.valor,
        descricao: descricao.present ? descricao.value : this.descricao,
        imagens: imagens ?? this.imagens,
      );
  ProdutoData copyWithCompanion(ProdutosCompanion data) {
    return ProdutoData(
      id: data.id.present ? data.id.value : this.id,
      confeitariaId: data.confeitariaId.present
          ? data.confeitariaId.value
          : this.confeitariaId,
      nome: data.nome.present ? data.nome.value : this.nome,
      valor: data.valor.present ? data.valor.value : this.valor,
      descricao: data.descricao.present ? data.descricao.value : this.descricao,
      imagens: data.imagens.present ? data.imagens.value : this.imagens,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProdutoData(')
          ..write('id: $id, ')
          ..write('confeitariaId: $confeitariaId, ')
          ..write('nome: $nome, ')
          ..write('valor: $valor, ')
          ..write('descricao: $descricao, ')
          ..write('imagens: $imagens')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, confeitariaId, nome, valor, descricao, imagens);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProdutoData &&
          other.id == this.id &&
          other.confeitariaId == this.confeitariaId &&
          other.nome == this.nome &&
          other.valor == this.valor &&
          other.descricao == this.descricao &&
          other.imagens == this.imagens);
}

class ProdutosCompanion extends UpdateCompanion<ProdutoData> {
  final Value<int> id;
  final Value<int> confeitariaId;
  final Value<String> nome;
  final Value<double> valor;
  final Value<String?> descricao;
  final Value<List<String>> imagens;
  const ProdutosCompanion({
    this.id = const Value.absent(),
    this.confeitariaId = const Value.absent(),
    this.nome = const Value.absent(),
    this.valor = const Value.absent(),
    this.descricao = const Value.absent(),
    this.imagens = const Value.absent(),
  });
  ProdutosCompanion.insert({
    this.id = const Value.absent(),
    required int confeitariaId,
    required String nome,
    this.valor = const Value.absent(),
    this.descricao = const Value.absent(),
    required List<String> imagens,
  })  : confeitariaId = Value(confeitariaId),
        nome = Value(nome),
        imagens = Value(imagens);
  static Insertable<ProdutoData> custom({
    Expression<int>? id,
    Expression<int>? confeitariaId,
    Expression<String>? nome,
    Expression<double>? valor,
    Expression<String>? descricao,
    Expression<String>? imagens,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (confeitariaId != null) 'confeitaria_id': confeitariaId,
      if (nome != null) 'nome': nome,
      if (valor != null) 'valor': valor,
      if (descricao != null) 'descricao': descricao,
      if (imagens != null) 'imagens': imagens,
    });
  }

  ProdutosCompanion copyWith(
      {Value<int>? id,
      Value<int>? confeitariaId,
      Value<String>? nome,
      Value<double>? valor,
      Value<String?>? descricao,
      Value<List<String>>? imagens}) {
    return ProdutosCompanion(
      id: id ?? this.id,
      confeitariaId: confeitariaId ?? this.confeitariaId,
      nome: nome ?? this.nome,
      valor: valor ?? this.valor,
      descricao: descricao ?? this.descricao,
      imagens: imagens ?? this.imagens,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (confeitariaId.present) {
      map['confeitaria_id'] = Variable<int>(confeitariaId.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (valor.present) {
      map['valor'] = Variable<double>(valor.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (imagens.present) {
      map['imagens'] = Variable<String>(
          $ProdutosTable.$converterimagens.toSql(imagens.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProdutosCompanion(')
          ..write('id: $id, ')
          ..write('confeitariaId: $confeitariaId, ')
          ..write('nome: $nome, ')
          ..write('valor: $valor, ')
          ..write('descricao: $descricao, ')
          ..write('imagens: $imagens')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ConfeitariasTable confeitarias = $ConfeitariasTable(this);
  late final $ProdutosTable produtos = $ProdutosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [confeitarias, produtos];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('confeitarias',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('produtos', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$ConfeitariasTableCreateCompanionBuilder = ConfeitariasCompanion
    Function({
  Value<int> id,
  required String nome,
  required double latitude,
  required double longitude,
  required String cep,
  required String rua,
  required String numero,
  required String bairro,
  required String cidade,
  required String estado,
  required String telefone,
  Value<String?> imagens,
});
typedef $$ConfeitariasTableUpdateCompanionBuilder = ConfeitariasCompanion
    Function({
  Value<int> id,
  Value<String> nome,
  Value<double> latitude,
  Value<double> longitude,
  Value<String> cep,
  Value<String> rua,
  Value<String> numero,
  Value<String> bairro,
  Value<String> cidade,
  Value<String> estado,
  Value<String> telefone,
  Value<String?> imagens,
});

final class $$ConfeitariasTableReferences
    extends BaseReferences<_$AppDatabase, $ConfeitariasTable, ConfeitariaData> {
  $$ConfeitariasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProdutosTable, List<ProdutoData>>
      _produtosRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.produtos,
              aliasName: $_aliasNameGenerator(
                  db.confeitarias.id, db.produtos.confeitariaId));

  $$ProdutosTableProcessedTableManager get produtosRefs {
    final manager = $$ProdutosTableTableManager($_db, $_db.produtos)
        .filter((f) => f.confeitariaId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_produtosRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ConfeitariasTableFilterComposer
    extends Composer<_$AppDatabase, $ConfeitariasTable> {
  $$ConfeitariasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cep => $composableBuilder(
      column: $table.cep, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rua => $composableBuilder(
      column: $table.rua, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get numero => $composableBuilder(
      column: $table.numero, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bairro => $composableBuilder(
      column: $table.bairro, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cidade => $composableBuilder(
      column: $table.cidade, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get estado => $composableBuilder(
      column: $table.estado, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get telefone => $composableBuilder(
      column: $table.telefone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagens => $composableBuilder(
      column: $table.imagens, builder: (column) => ColumnFilters(column));

  Expression<bool> produtosRefs(
      Expression<bool> Function($$ProdutosTableFilterComposer f) f) {
    final $$ProdutosTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.produtos,
        getReferencedColumn: (t) => t.confeitariaId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProdutosTableFilterComposer(
              $db: $db,
              $table: $db.produtos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ConfeitariasTableOrderingComposer
    extends Composer<_$AppDatabase, $ConfeitariasTable> {
  $$ConfeitariasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cep => $composableBuilder(
      column: $table.cep, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rua => $composableBuilder(
      column: $table.rua, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get numero => $composableBuilder(
      column: $table.numero, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bairro => $composableBuilder(
      column: $table.bairro, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cidade => $composableBuilder(
      column: $table.cidade, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get estado => $composableBuilder(
      column: $table.estado, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get telefone => $composableBuilder(
      column: $table.telefone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagens => $composableBuilder(
      column: $table.imagens, builder: (column) => ColumnOrderings(column));
}

class $$ConfeitariasTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConfeitariasTable> {
  $$ConfeitariasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get cep =>
      $composableBuilder(column: $table.cep, builder: (column) => column);

  GeneratedColumn<String> get rua =>
      $composableBuilder(column: $table.rua, builder: (column) => column);

  GeneratedColumn<String> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  GeneratedColumn<String> get bairro =>
      $composableBuilder(column: $table.bairro, builder: (column) => column);

  GeneratedColumn<String> get cidade =>
      $composableBuilder(column: $table.cidade, builder: (column) => column);

  GeneratedColumn<String> get estado =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<String> get telefone =>
      $composableBuilder(column: $table.telefone, builder: (column) => column);

  GeneratedColumn<String> get imagens =>
      $composableBuilder(column: $table.imagens, builder: (column) => column);

  Expression<T> produtosRefs<T extends Object>(
      Expression<T> Function($$ProdutosTableAnnotationComposer a) f) {
    final $$ProdutosTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.produtos,
        getReferencedColumn: (t) => t.confeitariaId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProdutosTableAnnotationComposer(
              $db: $db,
              $table: $db.produtos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ConfeitariasTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ConfeitariasTable,
    ConfeitariaData,
    $$ConfeitariasTableFilterComposer,
    $$ConfeitariasTableOrderingComposer,
    $$ConfeitariasTableAnnotationComposer,
    $$ConfeitariasTableCreateCompanionBuilder,
    $$ConfeitariasTableUpdateCompanionBuilder,
    (ConfeitariaData, $$ConfeitariasTableReferences),
    ConfeitariaData,
    PrefetchHooks Function({bool produtosRefs})> {
  $$ConfeitariasTableTableManager(_$AppDatabase db, $ConfeitariasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConfeitariasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConfeitariasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConfeitariasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<String> cep = const Value.absent(),
            Value<String> rua = const Value.absent(),
            Value<String> numero = const Value.absent(),
            Value<String> bairro = const Value.absent(),
            Value<String> cidade = const Value.absent(),
            Value<String> estado = const Value.absent(),
            Value<String> telefone = const Value.absent(),
            Value<String?> imagens = const Value.absent(),
          }) =>
              ConfeitariasCompanion(
            id: id,
            nome: nome,
            latitude: latitude,
            longitude: longitude,
            cep: cep,
            rua: rua,
            numero: numero,
            bairro: bairro,
            cidade: cidade,
            estado: estado,
            telefone: telefone,
            imagens: imagens,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nome,
            required double latitude,
            required double longitude,
            required String cep,
            required String rua,
            required String numero,
            required String bairro,
            required String cidade,
            required String estado,
            required String telefone,
            Value<String?> imagens = const Value.absent(),
          }) =>
              ConfeitariasCompanion.insert(
            id: id,
            nome: nome,
            latitude: latitude,
            longitude: longitude,
            cep: cep,
            rua: rua,
            numero: numero,
            bairro: bairro,
            cidade: cidade,
            estado: estado,
            telefone: telefone,
            imagens: imagens,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ConfeitariasTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({produtosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (produtosRefs) db.produtos],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (produtosRefs)
                    await $_getPrefetchedData<ConfeitariaData,
                            $ConfeitariasTable, ProdutoData>(
                        currentTable: table,
                        referencedTable: $$ConfeitariasTableReferences
                            ._produtosRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ConfeitariasTableReferences(db, table, p0)
                                .produtosRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.confeitariaId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ConfeitariasTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ConfeitariasTable,
    ConfeitariaData,
    $$ConfeitariasTableFilterComposer,
    $$ConfeitariasTableOrderingComposer,
    $$ConfeitariasTableAnnotationComposer,
    $$ConfeitariasTableCreateCompanionBuilder,
    $$ConfeitariasTableUpdateCompanionBuilder,
    (ConfeitariaData, $$ConfeitariasTableReferences),
    ConfeitariaData,
    PrefetchHooks Function({bool produtosRefs})>;
typedef $$ProdutosTableCreateCompanionBuilder = ProdutosCompanion Function({
  Value<int> id,
  required int confeitariaId,
  required String nome,
  Value<double> valor,
  Value<String?> descricao,
  required List<String> imagens,
});
typedef $$ProdutosTableUpdateCompanionBuilder = ProdutosCompanion Function({
  Value<int> id,
  Value<int> confeitariaId,
  Value<String> nome,
  Value<double> valor,
  Value<String?> descricao,
  Value<List<String>> imagens,
});

final class $$ProdutosTableReferences
    extends BaseReferences<_$AppDatabase, $ProdutosTable, ProdutoData> {
  $$ProdutosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ConfeitariasTable _confeitariaIdTable(_$AppDatabase db) =>
      db.confeitarias.createAlias(
          $_aliasNameGenerator(db.produtos.confeitariaId, db.confeitarias.id));

  $$ConfeitariasTableProcessedTableManager get confeitariaId {
    final $_column = $_itemColumn<int>('confeitaria_id')!;

    final manager = $$ConfeitariasTableTableManager($_db, $_db.confeitarias)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_confeitariaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ProdutosTableFilterComposer
    extends Composer<_$AppDatabase, $ProdutosTable> {
  $$ProdutosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get valor => $composableBuilder(
      column: $table.valor, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get descricao => $composableBuilder(
      column: $table.descricao, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get imagens => $composableBuilder(
          column: $table.imagens,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$ConfeitariasTableFilterComposer get confeitariaId {
    final $$ConfeitariasTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.confeitariaId,
        referencedTable: $db.confeitarias,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ConfeitariasTableFilterComposer(
              $db: $db,
              $table: $db.confeitarias,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProdutosTableOrderingComposer
    extends Composer<_$AppDatabase, $ProdutosTable> {
  $$ProdutosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get valor => $composableBuilder(
      column: $table.valor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get descricao => $composableBuilder(
      column: $table.descricao, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagens => $composableBuilder(
      column: $table.imagens, builder: (column) => ColumnOrderings(column));

  $$ConfeitariasTableOrderingComposer get confeitariaId {
    final $$ConfeitariasTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.confeitariaId,
        referencedTable: $db.confeitarias,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ConfeitariasTableOrderingComposer(
              $db: $db,
              $table: $db.confeitarias,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProdutosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProdutosTable> {
  $$ProdutosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<double> get valor =>
      $composableBuilder(column: $table.valor, builder: (column) => column);

  GeneratedColumn<String> get descricao =>
      $composableBuilder(column: $table.descricao, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get imagens =>
      $composableBuilder(column: $table.imagens, builder: (column) => column);

  $$ConfeitariasTableAnnotationComposer get confeitariaId {
    final $$ConfeitariasTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.confeitariaId,
        referencedTable: $db.confeitarias,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ConfeitariasTableAnnotationComposer(
              $db: $db,
              $table: $db.confeitarias,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProdutosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProdutosTable,
    ProdutoData,
    $$ProdutosTableFilterComposer,
    $$ProdutosTableOrderingComposer,
    $$ProdutosTableAnnotationComposer,
    $$ProdutosTableCreateCompanionBuilder,
    $$ProdutosTableUpdateCompanionBuilder,
    (ProdutoData, $$ProdutosTableReferences),
    ProdutoData,
    PrefetchHooks Function({bool confeitariaId})> {
  $$ProdutosTableTableManager(_$AppDatabase db, $ProdutosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProdutosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProdutosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProdutosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> confeitariaId = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<double> valor = const Value.absent(),
            Value<String?> descricao = const Value.absent(),
            Value<List<String>> imagens = const Value.absent(),
          }) =>
              ProdutosCompanion(
            id: id,
            confeitariaId: confeitariaId,
            nome: nome,
            valor: valor,
            descricao: descricao,
            imagens: imagens,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int confeitariaId,
            required String nome,
            Value<double> valor = const Value.absent(),
            Value<String?> descricao = const Value.absent(),
            required List<String> imagens,
          }) =>
              ProdutosCompanion.insert(
            id: id,
            confeitariaId: confeitariaId,
            nome: nome,
            valor: valor,
            descricao: descricao,
            imagens: imagens,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ProdutosTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({confeitariaId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (confeitariaId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.confeitariaId,
                    referencedTable:
                        $$ProdutosTableReferences._confeitariaIdTable(db),
                    referencedColumn:
                        $$ProdutosTableReferences._confeitariaIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ProdutosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProdutosTable,
    ProdutoData,
    $$ProdutosTableFilterComposer,
    $$ProdutosTableOrderingComposer,
    $$ProdutosTableAnnotationComposer,
    $$ProdutosTableCreateCompanionBuilder,
    $$ProdutosTableUpdateCompanionBuilder,
    (ProdutoData, $$ProdutosTableReferences),
    ProdutoData,
    PrefetchHooks Function({bool confeitariaId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ConfeitariasTableTableManager get confeitarias =>
      $$ConfeitariasTableTableManager(_db, _db.confeitarias);
  $$ProdutosTableTableManager get produtos =>
      $$ProdutosTableTableManager(_db, _db.produtos);
}
