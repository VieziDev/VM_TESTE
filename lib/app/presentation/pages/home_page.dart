import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vm_test/app/domain/usecases/check_order_usecase_impl.dart';
import 'package:vm_test/app/domain/usecases/get_random_numbers_usecase_impl.dart';
import 'package:vm_test/injection_container.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _controller = TextEditingController();

  final ValueNotifier<List<int>> _numbersNotifier =
      ValueNotifier([]); // Notificador para a lista de números

  final ValueNotifier<bool?> _isSortedNotifier =
      ValueNotifier(null); // Notificador para o estado de ordenação

  // Gera uma lista de números aleatórios
  void _generateNumbers(int quantity) {
    _numbersNotifier.value =
        getIt<GetRandomNumbersUseCaseImpl>().execute(quantity);
    _isSortedNotifier.value = null;
  }

  // Verifica se a lista está ordenada
  void _checkOrder() {
    _isSortedNotifier.value =
        getIt<CheckOrderUseCaseImpl>().execute(_numbersNotifier.value);
  }

  // Reordena os números na lista
  void _reorderNumbers(int oldIndex, int newIndex) {
    final numbers = List<int>.from(_numbersNotifier.value);
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final int item = numbers.removeAt(oldIndex);
    numbers.insert(newIndex, item);
    _numbersNotifier.value = numbers;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
      appBar: AppBar(title: const Text("Exam App")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(labelText: "Quantidade"),
                keyboardType: TextInputType.number,
              ),
              ValueListenableBuilder<List<int>>(
                valueListenable: _numbersNotifier,
                builder: (context, numbers, _) {
                  if (numbers.isEmpty) return const SizedBox.shrink();
                  return ReorderableListView(
                    shrinkWrap: true,
                    buildDefaultDragHandles: true,
                    onReorder: _reorderNumbers,
                    children: [
                      for (int index = 0; index < numbers.length; index++)
                        ListTile(
                          key: ValueKey(numbers[index]),
                          trailing: const Icon(Icons.drag_handle),
                          tileColor: index.isEven
                              ? evenItemColor
                              : oddItemColor, // Cor alternada para itens pares e ímpares
                          title: Text(numbers[index].toString()),
                        ),
                    ],
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  final quantity = int.tryParse(_controller.text);
                  if (quantity != null) {
                    _generateNumbers(quantity); // Gera a lista de números
                  }
                },
                child: const Text("Gerar Lista"),
              ),
              ElevatedButton(
                onPressed: _checkOrder, // Verifica a ordem da lista
                child: const Text("Validar Ordem"),
              ),
              ValueListenableBuilder<bool?>(
                valueListenable: _isSortedNotifier,
                builder: (context, isSorted, _) {
                  if (isSorted == null) return const SizedBox.shrink();
                  return Text(
                    isSorted
                        ? "A lista está ordenada!"
                        : "A lista NÃO está ordenada!",
                    style: TextStyle(
                      color: isSorted ? Colors.green : Colors.red,
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget customizado para permitir o início do arrastar imediatamente
class MyDragStartListener extends ReorderableDelayedDragStartListener {
  const MyDragStartListener({
    super.key,
    required super.child,
    required super.index,
    super.enabled,
  });

  @override
  MultiDragGestureRecognizer createRecognizer() {
    return DelayedMultiDragGestureRecognizer(
      delay:
          const Duration(milliseconds: 100), // Atraso para iniciar o arrastar
      debugOwner: this,
    );
  }
}
