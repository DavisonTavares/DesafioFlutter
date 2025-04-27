import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confeitaria_marketplace/features/confeitarias/bloc/confeitaria_bloc.dart';
import 'package:confeitaria_marketplace/features/confeitarias/pages/form/confeitaria_dialog.dart';
import 'package:confeitaria_marketplace/features/confeitarias/pages/list/confeitaria_list_item.dart';

class ConfeitariaListPage extends StatelessWidget {
  const ConfeitariaListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONFEITARIAS'),
        backgroundColor: Colors.purple,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        shadowColor: Colors.black54,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),        
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddDialog(context),
          ),
        ],
      ),
      body: BlocBuilder<ConfeitariaBloc, ConfeitariaState>(
        builder: (context, state) {
          if (state is ConfeitariaLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ConfeitariaLoaded) {
            return ListView.builder(
              itemCount: state.confeitarias.length,
              itemBuilder: (context, index) => ConfeitariaListItem(
                confeitaria: state.confeitarias[index],
              ),
            );
          }
          if (state is ConfeitariaError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Nenhuma confeitaria encontrada'));
        },
      ),
    );
  }
  
  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddConfeitariaDialog(),
    );
  }
}