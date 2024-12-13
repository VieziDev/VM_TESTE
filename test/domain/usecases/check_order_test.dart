import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vm_test/app/domain/repositories/exam_repository.dart';
import 'package:vm_test/app/domain/usecases/check_order_usecase_impl.dart';

class MockExamRepository extends Mock implements ExamRepository {}

void main() {
  late CheckOrderUseCaseImpl getRandomNumbersUseCase;
  late MockExamRepository mockExamRepository;

  setUp(() {
    mockExamRepository = MockExamRepository();
    getRandomNumbersUseCase = CheckOrderUseCaseImpl(mockExamRepository);
  });

  group('execute', () {
    test(
        'Deve retornar TRUE caso a lista de números esteja ordenada corretamente',
        () {
      // Arrange
      when(() => mockExamRepository.checkOrder([1, 2, 3, 4, 5]))
          .thenReturn(true);
      // Act
      final result = getRandomNumbersUseCase.execute([1, 2, 3, 4, 5]);
      // Assert
      expect(result, true);
    });

    test(
        'Deve retornar FALSE caso a lista de números não esteja ordenada corretamente',
        () {
      // Arrange
      when(() => mockExamRepository.checkOrder([1, 2, 3, 5, 4]))
          .thenReturn(false);
      // Act
      final result = getRandomNumbersUseCase.execute([1, 2, 3, 5, 4]);

      expect(result, false);
    });
  });
}
