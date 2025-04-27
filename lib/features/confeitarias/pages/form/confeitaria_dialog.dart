import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:confeitaria_marketplace/features/confeitarias/models/confeitaria_model.dart';
import 'package:confeitaria_marketplace/features/confeitarias/bloc/confeitaria_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddConfeitariaDialog extends StatefulWidget {
  final ConfeitariaModel? confeitaria; // Adicionando parâmetro opcional
  const AddConfeitariaDialog({super.key, this.confeitaria});

  @override
  State<AddConfeitariaDialog> createState() => _AddConfeitariaDialogState();
}

class _AddConfeitariaDialogState extends State<AddConfeitariaDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  final _cepController = TextEditingController();
  final _ruaController = TextEditingController();
  final _numeroController = TextEditingController();
  final _bairroController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();
  final _telefoneController = TextEditingController();

  bool _isLoadingLocation = false;
  bool _isLoadingAddress = false;

  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.confeitaria != null) {
      final c = widget.confeitaria!;
      _nomeController.text = c.nome;
      _latitudeController.text = c.latitude.toString();
      _longitudeController.text = c.longitude.toString();
      _cepController.text = c.cep;
      _ruaController.text = c.rua;
      _numeroController.text = c.numero;
      _bairroController.text = c.bairro;
      _cidadeController.text = c.cidade;
      _estadoController.text = c.estado;
      _telefoneController.text = c.telefone;
      if (c.imagens.isNotEmpty) {
        _image = XFile(c.imagens.first);
      }
      _isLoadingAddress = true;
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _cepController.dispose();
    _ruaController.dispose();
    _numeroController.dispose();
    _bairroController.dispose();
    _cidadeController.dispose();
    _estadoController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery, // Ou ImageSource.camera para usar a câmera
      );

      if (image != null) {
        setState(() {
          _image = image;
        });
        print('Imagem selecionada: ${image.path}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao selecionar a imagem: $e')),
      );
    }
  }

  // Função para exibir a imagem selecionada
  Widget _displayImage() {
    if (_image == null) {
      return const Text('Nenhuma imagem selecionada');
    } else {
      return Image.file(File(_image!.path)); // Exibe a imagem
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoadingLocation = true);

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ative o GPS para obter a localização')),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Permissão de localização negada')),
          );
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition();
      _latitudeController.text = position.latitude.toStringAsFixed(6);
      _longitudeController.text = position.longitude.toStringAsFixed(6);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao obter localização: $e')),
      );
      debugPrint('Erro ao obter localização: $e');
    } finally {
      setState(() => _isLoadingLocation = false);
    }
  }

  // Validações
  String? _validateRequired(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return fieldName != null
          ? '$fieldName é obrigatório'
          : 'Campo obrigatório';
    }
    return null;
  }

  String? _validateDouble(String? value, [String? fieldName]) {
    final requiredError = _validateRequired(value, fieldName);
    if (requiredError != null) return requiredError;

    if (double.tryParse(value!) == null) {
      return fieldName != null ? '$fieldName inválido' : 'Valor inválido';
    }
    return null;
  }

  String? _validateCEP(String? value) {
    final requiredError = _validateRequired(value, 'CEP');
    if (requiredError != null) return requiredError;

    if (!RegExp(r'^\d{5}-?\d{3}$').hasMatch(value!)) {
      return 'CEP inválido (formato: 12345-678)';
    }
    return null;
  }

  String? _validateTelefone(String? value) {
    final requiredError = _validateRequired(value, 'Telefone');
    if (requiredError != null) return requiredError;

    if (!RegExp(r'^\(?\d{2}\)?[\s-]?\d{4,5}-?\d{4}$').hasMatch(value!)) {
      return 'Telefone inválido (ex: (11) 91234-5678)';
    }
    return null;
  }

  String? _validateEstado(String? value) {
    final requiredError = _validateRequired(value, 'Estado');
    if (requiredError != null) return requiredError;

    final estadosBrasil = {
      'AC',
      'AL',
      'AP',
      'AM',
      'BA',
      'CE',
      'DF',
      'ES',
      'GO',
      'MA',
      'MT',
      'MS',
      'MG',
      'PA',
      'PB',
      'PR',
      'PE',
      'PI',
      'RJ',
      'RN',
      'RS',
      'RO',
      'RR',
      'SC',
      'SP',
      'SE',
      'TO'
    };

    if (!estadosBrasil.contains(value!.toUpperCase())) {
      return 'Insira a sigla do estado (ex: SP, RJ)';
    }
    return null;
  }

  String? _validateNumero(String? value) {
    final requiredError = _validateRequired(value, 'Número');
    if (requiredError != null) return requiredError;

    if (!RegExp(r'^\d+$').hasMatch(value!)) {
      return 'Apenas números são permitidos';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<ConfeitariaBloc, ConfeitariaState>(
      listener: (context, state) {
        if (state is ConfeitariaError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is ConfeitariaOperationSuccess) {
          Navigator.pop(context);
        } else if (state is EnderecoCarregado) {
          print(
              'Endereço carregado: ${state.rua}, ${state.bairro}, ${state.cidade}, ${state.estado}');
          _ruaController.text = state.rua ?? '';
          _bairroController.text = state.bairro ?? '';
          _cidadeController.text = state.cidade ?? '';
          _estadoController.text = state.estado ?? '';
          setState(() => _isLoadingAddress = true);
        } else if (state is ErroAoBuscarEndereco) {
          setState(() {
            _isLoadingAddress = false;
            _ruaController.clear();
            _bairroController.clear();
            _cidadeController.clear();
            _estadoController.clear();
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('CEP não encontrado')),
          );
        }
      },
      child: AlertDialog(
        title: Text(widget.confeitaria == null ? 'Adicionar Confeitaria' : 'Editar Confeitaria'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton.icon(
                    icon: _isLoadingLocation
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.location_on),
                    label: const Text('Usar minha localização atual'),
                    onPressed: _isLoadingLocation ? null : _getCurrentLocation,
                  ),
                ),
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) => _validateRequired(value, 'Nome'),
                ),
                TextFormField(
                  controller: _latitudeController,
                  decoration: const InputDecoration(labelText: 'Latitude'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) => _validateDouble(value, 'Latitude'),
                ),
                TextFormField(
                  controller: _longitudeController,
                  decoration: const InputDecoration(labelText: 'Longitude'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) => _validateDouble(value, 'Longitude'),
                ),
                TextFormField(
                  controller: _cepController,
                  decoration: const InputDecoration(labelText: 'CEP'),
                  validator: _validateCEP,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // Limpeza e verificação do CEP
                    final cepLimpo = value.replaceAll(RegExp(r'\D'), '');
                    // Verifica se o CEP tem 8 dígitos e dispara a ação apenas nesse caso
                    if (cepLimpo.length == 8) {
                      print('Buscando endereço para o CEP: $cepLimpo');
                      context
                          .read<ConfeitariaBloc>()
                          .add(BuscarEnderecoPorCep(cepLimpo));
                    }
                  },
                ),
                TextFormField(
                  controller: _telefoneController,
                  decoration: const InputDecoration(labelText: 'Telefone'),
                  validator: _validateTelefone,
                ),
                if (_isLoadingAddress) ...[
                  TextFormField(
                    controller: _ruaController,
                    decoration: const InputDecoration(labelText: 'Rua'),
                    validator: (value) => _validateRequired(value, 'Rua'),
                  ),
                  TextFormField(
                    controller: _numeroController,
                    decoration: const InputDecoration(labelText: 'Número'),
                    keyboardType: TextInputType.number,
                    validator: _validateNumero,
                  ),
                  TextFormField(
                    controller: _bairroController,
                    decoration: const InputDecoration(labelText: 'Bairro'),
                    validator: (value) => _validateRequired(value, 'Bairro'),
                  ),
                  TextFormField(
                    controller: _cidadeController,
                    decoration: const InputDecoration(labelText: 'Cidade'),
                    validator: (value) => _validateRequired(value, 'Cidade'),
                  ),
                  TextFormField(
                    controller: _estadoController,
                    decoration: const InputDecoration(labelText: 'Estado'),
                    validator: _validateEstado,
                  ),
                ],
                Padding(padding: const EdgeInsets.only(top: 16)),
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Selecionar Imagem'),
                  onPressed: _pickImage,
                ),
                // Exibir imagem selecionada
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: _displayImage(),
                ),
              ],
            ),
          ),
        ),
        actions: [
          BlocBuilder<ConfeitariaBloc, ConfeitariaState>(
            builder: (context, state) {
              final isLoading = state is ConfeitariaLoading;

              return Row(
                children: [
                  TextButton(
                    onPressed: isLoading ? null : () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
  onPressed: isLoading
      ? null
      : () {
          if (_formKey.currentState!.validate()) {
            try {
              final confeitaria = ConfeitariaModel(
                id: widget.confeitaria?.id, // Pega o ID existente se estiver editando
                nome: _nomeController.text,
                latitude: double.parse(_latitudeController.text),
                longitude: double.parse(_longitudeController.text),
                cep: _cepController.text,
                rua: _ruaController.text,
                numero: _numeroController.text,
                bairro: _bairroController.text,
                cidade: _cidadeController.text,
                estado: _estadoController.text.toUpperCase(),
                telefone: _telefoneController.text,
                imagens: _image?.path != null ? [_image!.path] : [],
              );

              if (widget.confeitaria == null) {
                // Se não tiver confeitaria, é um novo cadastro
                context.read<ConfeitariaBloc>().add(
                      AddConfeitaria(confeitaria),
                    );
              } else {
                // Se tiver confeitaria, é uma edição
                context.read<ConfeitariaBloc>().add(
                      UpdateConfeitaria(confeitaria),
                    );
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Erro ao processar os dados: $e')),
              );
            }
          }
        },
  child: isLoading
      ? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        )
      : Text(widget.confeitaria == null ? 'Salvar' : 'Atualizar'),
)

                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// Formata automaticamente para letras maiúsculas
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
