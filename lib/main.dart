import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confeitaria_marketplace/shared/database/app_database.dart';
import 'package:confeitaria_marketplace/shared/database/daos/confeitaria_dao.dart';
import 'package:confeitaria_marketplace/shared/database/daos/produto_dao.dart';
import 'package:confeitaria_marketplace/features/confeitarias/repositories/confeitaria_repository.dart';
import 'package:confeitaria_marketplace/features/produtos/repositories/produto_repository.dart';
import 'package:confeitaria_marketplace/features/confeitarias/bloc/confeitaria_bloc.dart';
import 'package:confeitaria_marketplace/features/confeitarias/pages/list/confeitaria_list_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // Garante a inicialização dos bindings do Flutter
  WidgetsFlutterBinding.ensureInitialized();
  
  // Cria a instância do banco de dados
  final appDatabase = AppDatabase();
  
  // Cria o DAO passando o banco de dados
  final confeitariaDao = ConfeitariaDao(appDatabase);
  final produtoDao = ProdutoDao(appDatabase);
  runApp(MyApp(
    appDatabase: appDatabase,
    confeitariaDao: confeitariaDao,
    produtoDao: produtoDao,
  ));
}

class MyApp extends StatelessWidget {
  final AppDatabase appDatabase;
  final ConfeitariaDao confeitariaDao;
  final ProdutoDao produtoDao; // novo

  const MyApp({
    super.key,
    required this.appDatabase,
    required this.confeitariaDao,
    required this.produtoDao,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: appDatabase),
        RepositoryProvider.value(value: confeitariaDao),
        RepositoryProvider(
          create: (context) => ConfeitariaRepository(
            context.read<ConfeitariaDao>(),
          ),
        ),
        RepositoryProvider.value(value: produtoDao),
        RepositoryProvider(
          create: (context) => ProdutoRepository(
            context.read<ProdutoDao>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ConfeitariaBloc(
              context.read<ConfeitariaRepository>(),
            )..add(LoadConfeitarias()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Confeitaria Marketplace',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFF06292),
            ),
            useMaterial3: true,
          ),
          home: const ConfeitariaListPage(),
        ),
      ),
    );
  }
}
