import 'dart:math';
import 'package:vm_test/app/domain/repositories/exam_repository.dart';

// Implementação do repositório
class ExamRepositoryImpl implements ExamRepository {
  // Gera uma lista de números aleatórios únicos
  @override
  List<int> getRandomNumbers(int quantity) {
    final random = Random();
    final numbers = <int>{}; // Utiliza um Set para garantir números únicos
    // Adiciona números aleatórios à lista até que ela tenha a quantidade desejada
    while (numbers.length < quantity) {
      numbers.add(random.nextInt(100));
    }

    return numbers.toList();
  }

  // Verifica se a lista de números está em ordem crescente
  @override
  bool checkOrder(List<int> numbers) {
    for (int i = 0; i < numbers.length - 1; i++) {
      // Ordem crescente
      if (numbers[i] > numbers[i + 1]) return false;
    }
    return true;
  }
}
