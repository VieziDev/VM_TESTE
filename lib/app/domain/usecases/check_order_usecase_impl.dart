import 'package:vm_test/app/domain/repositories/exam_repository.dart';
import 'package:vm_test/core/usecases/usecase.dart';

// Implementação do caso de uso CheckOrderUseCase
class CheckOrderUseCaseImpl implements CheckOrderUseCase {
  final ExamRepository repository;

  // Construtor que recebe o repositório como dependência
  CheckOrderUseCaseImpl(this.repository);

  @override
  bool execute(List<int> numbers) {
    // Verifica se a lista de números está vazia e lança um erro se estiver
    if (numbers.isEmpty) {
      throw ArgumentError("Numbers list cannot be empty");
    }
    // Chama o método checkOrder do repositório para verificar a ordem dos números
    return repository.checkOrder(numbers);
  }
}
