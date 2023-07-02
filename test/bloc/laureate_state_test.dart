import 'package:flutter_nobel/bloc/laureate_bloc.dart';
import 'package:flutter_nobel/data/models/laureate_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LaureateState', () {
    const mockLaureateList = <LaureateModel>[];

    group('LaureateState, initial status', () {
      const mockInitialStatus = LaureateStatus.initial;

      LaureateState createLaureateStateInstance() {
        return const LaureateState(
          status: mockInitialStatus,
          laureatesList: mockLaureateList,
        );
      }

      test('supports value equality', () {
        expect(createLaureateStateInstance(),
            equals(createLaureateStateInstance()));
      });

      test('props are correct', () {
        expect(createLaureateStateInstance().props,
            equals([mockInitialStatus, mockLaureateList]));
      });

      test('returns object with updated status', () {
        expect(
          createLaureateStateInstance()
              .copyWith(status: LaureateStatus.success),
          const LaureateState(
              status: LaureateStatus.success, laureatesList: mockLaureateList),
        );
      });
    });

    group('LaureateState, success status', () {
      const mockSuccessStatus = LaureateStatus.success;

      createLaureateStateInstance() {
        return const LaureateState(status: mockSuccessStatus, laureatesList: mockLaureateList);
      }

      test('supports value equality', () {
        expect(createLaureateStateInstance(), equals(createLaureateStateInstance()));
      });

     });

    group('LaureateState, failure status', () {
      const mockFailureStatus = LaureateStatus.failure;

      createLaureateStateInstance() {
        return const LaureateState(status: mockFailureStatus, laureatesList: mockLaureateList);
      }

      test('supports value equality', () {
        expect(createLaureateStateInstance(), equals(createLaureateStateInstance()));
      });
     });
  });
}
