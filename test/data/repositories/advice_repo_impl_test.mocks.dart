// Mocks generated by Mockito 5.4.4 from annotations
// in custom_theme/test/data/repositories/advice_repo_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:custom_theme/data/datasources/advice_remote_datasource.dart'
    as _i4;
import 'package:custom_theme/domain/entities/advicer_entity.dart' as _i3;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAdviceEntity_1 extends _i1.SmartFake implements _i3.AdviceEntity {
  _FakeAdviceEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AdviceRemoteDatasourceImplementation].
///
/// See the documentation for Mockito's code generation for more information.
class MockAdviceRemoteDatasourceImplementation extends _i1.Mock
    implements _i4.AdviceRemoteDatasourceImplementation {
  @override
  _i2.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
        returnValueForMissingStub: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.Client);

  @override
  _i5.Future<_i3.AdviceEntity> getRandomAdviceFromAPI() => (super.noSuchMethod(
        Invocation.method(
          #getRandomAdviceFromAPI,
          [],
        ),
        returnValue: _i5.Future<_i3.AdviceEntity>.value(_FakeAdviceEntity_1(
          this,
          Invocation.method(
            #getRandomAdviceFromAPI,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.AdviceEntity>.value(_FakeAdviceEntity_1(
          this,
          Invocation.method(
            #getRandomAdviceFromAPI,
            [],
          ),
        )),
      ) as _i5.Future<_i3.AdviceEntity>);
}
