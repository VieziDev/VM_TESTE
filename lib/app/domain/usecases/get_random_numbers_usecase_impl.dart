import 'package:vm_test/app/domain/repositories/exam_repository.dart';
import 'package:vm_test/core/usecases/usecase.dart';

// Implementação do caso de uso para obter números aleatórios
class GetRandomNumbersUseCaseImpl implements GetRandomNumbersUseCase {
  final ExamRepository repository;

  // Construtor que recebe o repositório como dependência
  GetRandomNumbersUseCaseImpl(this.repository);

  @override
  List<int> execute(int quantity) {
    // Verifica se a quantidade é maior que 0
    if (quantity <= 0) {
      throw ArgumentError("Quantity must be greater than 0");
    }
    // Retorna a lista de números aleatórios do repositório
    return repository.getRandomNumbers(quantity);
  }
}
