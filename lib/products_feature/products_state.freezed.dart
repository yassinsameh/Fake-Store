// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductsState {
  AsyncValue<List<Product>> get products => throw _privateConstructorUsedError;
  AsyncValue<Map<int, Product>> get cart => throw _privateConstructorUsedError;
  Map<int, int> get tempProductSelection => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) then) =
      _$ProductsStateCopyWithImpl<$Res, ProductsState>;
  @useResult
  $Res call(
      {AsyncValue<List<Product>> products,
      AsyncValue<Map<int, Product>> cart,
      Map<int, int> tempProductSelection});
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res, $Val extends ProductsState>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? cart = null,
    Object? tempProductSelection = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Product>>,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<int, Product>>,
      tempProductSelection: null == tempProductSelection
          ? _value.tempProductSelection
          : tempProductSelection // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsStateImplCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$$ProductsStateImplCopyWith(
          _$ProductsStateImpl value, $Res Function(_$ProductsStateImpl) then) =
      __$$ProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<Product>> products,
      AsyncValue<Map<int, Product>> cart,
      Map<int, int> tempProductSelection});
}

/// @nodoc
class __$$ProductsStateImplCopyWithImpl<$Res>
    extends _$ProductsStateCopyWithImpl<$Res, _$ProductsStateImpl>
    implements _$$ProductsStateImplCopyWith<$Res> {
  __$$ProductsStateImplCopyWithImpl(
      _$ProductsStateImpl _value, $Res Function(_$ProductsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? cart = null,
    Object? tempProductSelection = null,
  }) {
    return _then(_$ProductsStateImpl(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Product>>,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<int, Product>>,
      tempProductSelection: null == tempProductSelection
          ? _value._tempProductSelection
          : tempProductSelection // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// @nodoc

class _$ProductsStateImpl
    with DiagnosticableTreeMixin
    implements _ProductsState {
  const _$ProductsStateImpl(
      {this.products = const AsyncValue.loading(),
      this.cart = const AsyncValue.loading(),
      final Map<int, int> tempProductSelection = const {}})
      : _tempProductSelection = tempProductSelection;

  @override
  @JsonKey()
  final AsyncValue<List<Product>> products;
  @override
  @JsonKey()
  final AsyncValue<Map<int, Product>> cart;
  final Map<int, int> _tempProductSelection;
  @override
  @JsonKey()
  Map<int, int> get tempProductSelection {
    if (_tempProductSelection is EqualUnmodifiableMapView)
      return _tempProductSelection;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tempProductSelection);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductsState(products: $products, cart: $cart, tempProductSelection: $tempProductSelection)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductsState'))
      ..add(DiagnosticsProperty('products', products))
      ..add(DiagnosticsProperty('cart', cart))
      ..add(DiagnosticsProperty('tempProductSelection', tempProductSelection));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsStateImpl &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.cart, cart) || other.cart == cart) &&
            const DeepCollectionEquality()
                .equals(other._tempProductSelection, _tempProductSelection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products, cart,
      const DeepCollectionEquality().hash(_tempProductSelection));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      __$$ProductsStateImplCopyWithImpl<_$ProductsStateImpl>(this, _$identity);
}

abstract class _ProductsState implements ProductsState {
  const factory _ProductsState(
      {final AsyncValue<List<Product>> products,
      final AsyncValue<Map<int, Product>> cart,
      final Map<int, int> tempProductSelection}) = _$ProductsStateImpl;

  @override
  AsyncValue<List<Product>> get products;
  @override
  AsyncValue<Map<int, Product>> get cart;
  @override
  Map<int, int> get tempProductSelection;
  @override
  @JsonKey(ignore: true)
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
