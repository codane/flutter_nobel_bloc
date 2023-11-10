import 'package:flutter_nobel/presentation/bloc/laureate_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LaureateFetched', () {
    test('support value equality', () {
      expect(
        LaureateFetched(),
        equals(LaureateFetched())
      );
    });

    test('props are correct', () {
      expect(
        LaureateFetched().props,
        equals([]),
       );

    });
  });
}
