import 'package:flutter_test/flutter_test.dart';
import 'package:vm_test/app/data/repositories/exam_repository_impl.dart';

void main() {
  late ExamRepositoryImpl examRepositoryImpl;

  setUp(() {
    examRepositoryImpl = ExamRepositoryImpl();
  });

  group('getRandomNumbers', () {
    test('should return a list of random numbers', () {
      final result = examRepositoryImpl.getRandomNumbers(5);
      expect(result.length, 5);
    });
  });

  group('checkOrder', () {
    test(
        'Deve retornar true quando a lista estiver ordenada em ordem crescente',
        () {
      final result = examRepositoryImpl.checkOrder([1, 2, 3, 4]);

      expect(result, true);
    });

    test(
        'Deve retornar falsa quando a lista NÃO estiver ordenada em ordem crescente',
        () {
      final result = examRepositoryImpl.checkOrder([1, 3, 2, 4]);

      expect(result, false);
    });
  });
}
