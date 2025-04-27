import 'dart:convert';
import 'package:confeitaria_marketplace/shared/database/app_database.dart'; // Para ConfeitariaData
import 'package:equatable/equatable.dart';
import 'package:drift/drift.dart'; 

class ConfeitariaModel extends Equatable {
  final int? id;
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
  final List<String> imagens;

  const ConfeitariaModel({
    this.id,
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
    this.imagens = const [],
  });

  // Converte de ConfeitariaData (Drift) para Model
  factory ConfeitariaModel.fromData(ConfeitariaData data) {
    return ConfeitariaModel(
      id: data.id,
      nome: data.nome,
      latitude: data.latitude,
      longitude: data.longitude,
      cep: data.cep,
      rua: data.rua,
      numero: data.numero,
      bairro: data.bairro,
      cidade: data.cidade,
      estado: data.estado,
      telefone: data.telefone,
      imagens: data.imagens != null ? List<String>.from(jsonDecode(data.imagens!)) : [],
    );
  }

  // Converte para ConfeitariasCompanion (Drift)
  ConfeitariasCompanion toCompanion() {
    return ConfeitariasCompanion(
      id: id != null ? Value(id!) : const Value.absent(),
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
      imagens: imagens.isNotEmpty ? Value(jsonEncode(imagens)) : const Value.absent(),
    );
  }

  // Para atualizações parciais
  ConfeitariaModel copyWith({
    int? id,
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
    List<String>? imagens,
  }) {
    return ConfeitariaModel(
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

  // Formatação para exibição
  String get enderecoFormatado => '$rua, $numero - $bairro, $cidade/$estado';

  // Para comparação de objetos (Equatable)
  @override
  List<Object?> get props => [
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
        imagens,
      ];

  // Para debug
  @override
  String toString() => 'ConfeitariaModel($id, $nome, $enderecoFormatado, $imagens)';
}