// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageModel implements DiagnosticableTreeMixin {

 String get id; String get accountId; String get msgid; String get intro; Map<String, String> get from; List<Map<String, String>> get to; List<String> get cc; List<String> get bcc; String get subject; bool get seen; bool get flagged; bool get isDeleted; Map<String, dynamic> get verifications; bool get retention; DateTime? get retentionDate; String get text; List<String> get html; bool get hasAttachments; List<Attachment> get attachments; int get size; String get downloadUrl; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageModelCopyWith<MessageModel> get copyWith => _$MessageModelCopyWithImpl<MessageModel>(this as MessageModel, _$identity);

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MessageModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('accountId', accountId))..add(DiagnosticsProperty('msgid', msgid))..add(DiagnosticsProperty('intro', intro))..add(DiagnosticsProperty('from', from))..add(DiagnosticsProperty('to', to))..add(DiagnosticsProperty('cc', cc))..add(DiagnosticsProperty('bcc', bcc))..add(DiagnosticsProperty('subject', subject))..add(DiagnosticsProperty('seen', seen))..add(DiagnosticsProperty('flagged', flagged))..add(DiagnosticsProperty('isDeleted', isDeleted))..add(DiagnosticsProperty('verifications', verifications))..add(DiagnosticsProperty('retention', retention))..add(DiagnosticsProperty('retentionDate', retentionDate))..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('html', html))..add(DiagnosticsProperty('hasAttachments', hasAttachments))..add(DiagnosticsProperty('attachments', attachments))..add(DiagnosticsProperty('size', size))..add(DiagnosticsProperty('downloadUrl', downloadUrl))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.msgid, msgid) || other.msgid == msgid)&&(identical(other.intro, intro) || other.intro == intro)&&const DeepCollectionEquality().equals(other.from, from)&&const DeepCollectionEquality().equals(other.to, to)&&const DeepCollectionEquality().equals(other.cc, cc)&&const DeepCollectionEquality().equals(other.bcc, bcc)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.seen, seen) || other.seen == seen)&&(identical(other.flagged, flagged) || other.flagged == flagged)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&const DeepCollectionEquality().equals(other.verifications, verifications)&&(identical(other.retention, retention) || other.retention == retention)&&(identical(other.retentionDate, retentionDate) || other.retentionDate == retentionDate)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.html, html)&&(identical(other.hasAttachments, hasAttachments) || other.hasAttachments == hasAttachments)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.size, size) || other.size == size)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,accountId,msgid,intro,const DeepCollectionEquality().hash(from),const DeepCollectionEquality().hash(to),const DeepCollectionEquality().hash(cc),const DeepCollectionEquality().hash(bcc),subject,seen,flagged,isDeleted,const DeepCollectionEquality().hash(verifications),retention,retentionDate,text,const DeepCollectionEquality().hash(html),hasAttachments,const DeepCollectionEquality().hash(attachments),size,downloadUrl,createdAt,updatedAt]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MessageModel(id: $id, accountId: $accountId, msgid: $msgid, intro: $intro, from: $from, to: $to, cc: $cc, bcc: $bcc, subject: $subject, seen: $seen, flagged: $flagged, isDeleted: $isDeleted, verifications: $verifications, retention: $retention, retentionDate: $retentionDate, text: $text, html: $html, hasAttachments: $hasAttachments, attachments: $attachments, size: $size, downloadUrl: $downloadUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MessageModelCopyWith<$Res>  {
  factory $MessageModelCopyWith(MessageModel value, $Res Function(MessageModel) _then) = _$MessageModelCopyWithImpl;
@useResult
$Res call({
 String id, String accountId, String msgid, String intro, Map<String, String> from, List<Map<String, String>> to, List<String> cc, List<String> bcc, String subject, bool seen, bool flagged, bool isDeleted, Map<String, dynamic> verifications, bool retention, DateTime? retentionDate, String text, List<String> html, bool hasAttachments, List<Attachment> attachments, int size, String downloadUrl, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$MessageModelCopyWithImpl<$Res>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._self, this._then);

  final MessageModel _self;
  final $Res Function(MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = null,Object? msgid = null,Object? intro = null,Object? from = null,Object? to = null,Object? cc = null,Object? bcc = null,Object? subject = null,Object? seen = null,Object? flagged = null,Object? isDeleted = null,Object? verifications = null,Object? retention = null,Object? retentionDate = freezed,Object? text = null,Object? html = null,Object? hasAttachments = null,Object? attachments = null,Object? size = null,Object? downloadUrl = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,msgid: null == msgid ? _self.msgid : msgid // ignore: cast_nullable_to_non_nullable
as String,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as Map<String, String>,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,cc: null == cc ? _self.cc : cc // ignore: cast_nullable_to_non_nullable
as List<String>,bcc: null == bcc ? _self.bcc : bcc // ignore: cast_nullable_to_non_nullable
as List<String>,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,seen: null == seen ? _self.seen : seen // ignore: cast_nullable_to_non_nullable
as bool,flagged: null == flagged ? _self.flagged : flagged // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,verifications: null == verifications ? _self.verifications : verifications // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,retention: null == retention ? _self.retention : retention // ignore: cast_nullable_to_non_nullable
as bool,retentionDate: freezed == retentionDate ? _self.retentionDate : retentionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,html: null == html ? _self.html : html // ignore: cast_nullable_to_non_nullable
as List<String>,hasAttachments: null == hasAttachments ? _self.hasAttachments : hasAttachments // ignore: cast_nullable_to_non_nullable
as bool,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<Attachment>,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageModel].
extension MessageModelPatterns on MessageModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageModel value)  $default,){
final _that = this;
switch (_that) {
case _MessageModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageModel value)?  $default,){
final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String accountId,  String msgid,  String intro,  Map<String, String> from,  List<Map<String, String>> to,  List<String> cc,  List<String> bcc,  String subject,  bool seen,  bool flagged,  bool isDeleted,  Map<String, dynamic> verifications,  bool retention,  DateTime? retentionDate,  String text,  List<String> html,  bool hasAttachments,  List<Attachment> attachments,  int size,  String downloadUrl,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that.id,_that.accountId,_that.msgid,_that.intro,_that.from,_that.to,_that.cc,_that.bcc,_that.subject,_that.seen,_that.flagged,_that.isDeleted,_that.verifications,_that.retention,_that.retentionDate,_that.text,_that.html,_that.hasAttachments,_that.attachments,_that.size,_that.downloadUrl,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String accountId,  String msgid,  String intro,  Map<String, String> from,  List<Map<String, String>> to,  List<String> cc,  List<String> bcc,  String subject,  bool seen,  bool flagged,  bool isDeleted,  Map<String, dynamic> verifications,  bool retention,  DateTime? retentionDate,  String text,  List<String> html,  bool hasAttachments,  List<Attachment> attachments,  int size,  String downloadUrl,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MessageModel():
return $default(_that.id,_that.accountId,_that.msgid,_that.intro,_that.from,_that.to,_that.cc,_that.bcc,_that.subject,_that.seen,_that.flagged,_that.isDeleted,_that.verifications,_that.retention,_that.retentionDate,_that.text,_that.html,_that.hasAttachments,_that.attachments,_that.size,_that.downloadUrl,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String accountId,  String msgid,  String intro,  Map<String, String> from,  List<Map<String, String>> to,  List<String> cc,  List<String> bcc,  String subject,  bool seen,  bool flagged,  bool isDeleted,  Map<String, dynamic> verifications,  bool retention,  DateTime? retentionDate,  String text,  List<String> html,  bool hasAttachments,  List<Attachment> attachments,  int size,  String downloadUrl,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MessageModel() when $default != null:
return $default(_that.id,_that.accountId,_that.msgid,_that.intro,_that.from,_that.to,_that.cc,_that.bcc,_that.subject,_that.seen,_that.flagged,_that.isDeleted,_that.verifications,_that.retention,_that.retentionDate,_that.text,_that.html,_that.hasAttachments,_that.attachments,_that.size,_that.downloadUrl,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageModel with DiagnosticableTreeMixin implements MessageModel {
  const _MessageModel({required this.id, required this.accountId, required this.msgid, this.intro = '', required final  Map<String, String> from, required final  List<Map<String, String>> to, final  List<String> cc = const [], final  List<String> bcc = const [], this.subject = '', required this.seen, this.flagged = false, required this.isDeleted, final  Map<String, dynamic> verifications = const {}, this.retention = false, this.retentionDate, this.text = '', final  List<String> html = const [], required this.hasAttachments, final  List<Attachment> attachments = const [], required this.size, required this.downloadUrl, required this.createdAt, required this.updatedAt}): _from = from,_to = to,_cc = cc,_bcc = bcc,_verifications = verifications,_html = html,_attachments = attachments;
  factory _MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

@override final  String id;
@override final  String accountId;
@override final  String msgid;
@override@JsonKey() final  String intro;
 final  Map<String, String> _from;
@override Map<String, String> get from {
  if (_from is EqualUnmodifiableMapView) return _from;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_from);
}

 final  List<Map<String, String>> _to;
@override List<Map<String, String>> get to {
  if (_to is EqualUnmodifiableListView) return _to;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_to);
}

 final  List<String> _cc;
@override@JsonKey() List<String> get cc {
  if (_cc is EqualUnmodifiableListView) return _cc;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cc);
}

 final  List<String> _bcc;
@override@JsonKey() List<String> get bcc {
  if (_bcc is EqualUnmodifiableListView) return _bcc;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bcc);
}

@override@JsonKey() final  String subject;
@override final  bool seen;
@override@JsonKey() final  bool flagged;
@override final  bool isDeleted;
 final  Map<String, dynamic> _verifications;
@override@JsonKey() Map<String, dynamic> get verifications {
  if (_verifications is EqualUnmodifiableMapView) return _verifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_verifications);
}

@override@JsonKey() final  bool retention;
@override final  DateTime? retentionDate;
@override@JsonKey() final  String text;
 final  List<String> _html;
@override@JsonKey() List<String> get html {
  if (_html is EqualUnmodifiableListView) return _html;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_html);
}

@override final  bool hasAttachments;
 final  List<Attachment> _attachments;
@override@JsonKey() List<Attachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override final  int size;
@override final  String downloadUrl;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageModelCopyWith<_MessageModel> get copyWith => __$MessageModelCopyWithImpl<_MessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MessageModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('accountId', accountId))..add(DiagnosticsProperty('msgid', msgid))..add(DiagnosticsProperty('intro', intro))..add(DiagnosticsProperty('from', from))..add(DiagnosticsProperty('to', to))..add(DiagnosticsProperty('cc', cc))..add(DiagnosticsProperty('bcc', bcc))..add(DiagnosticsProperty('subject', subject))..add(DiagnosticsProperty('seen', seen))..add(DiagnosticsProperty('flagged', flagged))..add(DiagnosticsProperty('isDeleted', isDeleted))..add(DiagnosticsProperty('verifications', verifications))..add(DiagnosticsProperty('retention', retention))..add(DiagnosticsProperty('retentionDate', retentionDate))..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('html', html))..add(DiagnosticsProperty('hasAttachments', hasAttachments))..add(DiagnosticsProperty('attachments', attachments))..add(DiagnosticsProperty('size', size))..add(DiagnosticsProperty('downloadUrl', downloadUrl))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.msgid, msgid) || other.msgid == msgid)&&(identical(other.intro, intro) || other.intro == intro)&&const DeepCollectionEquality().equals(other._from, _from)&&const DeepCollectionEquality().equals(other._to, _to)&&const DeepCollectionEquality().equals(other._cc, _cc)&&const DeepCollectionEquality().equals(other._bcc, _bcc)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.seen, seen) || other.seen == seen)&&(identical(other.flagged, flagged) || other.flagged == flagged)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&const DeepCollectionEquality().equals(other._verifications, _verifications)&&(identical(other.retention, retention) || other.retention == retention)&&(identical(other.retentionDate, retentionDate) || other.retentionDate == retentionDate)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._html, _html)&&(identical(other.hasAttachments, hasAttachments) || other.hasAttachments == hasAttachments)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.size, size) || other.size == size)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,accountId,msgid,intro,const DeepCollectionEquality().hash(_from),const DeepCollectionEquality().hash(_to),const DeepCollectionEquality().hash(_cc),const DeepCollectionEquality().hash(_bcc),subject,seen,flagged,isDeleted,const DeepCollectionEquality().hash(_verifications),retention,retentionDate,text,const DeepCollectionEquality().hash(_html),hasAttachments,const DeepCollectionEquality().hash(_attachments),size,downloadUrl,createdAt,updatedAt]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MessageModel(id: $id, accountId: $accountId, msgid: $msgid, intro: $intro, from: $from, to: $to, cc: $cc, bcc: $bcc, subject: $subject, seen: $seen, flagged: $flagged, isDeleted: $isDeleted, verifications: $verifications, retention: $retention, retentionDate: $retentionDate, text: $text, html: $html, hasAttachments: $hasAttachments, attachments: $attachments, size: $size, downloadUrl: $downloadUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MessageModelCopyWith<$Res> implements $MessageModelCopyWith<$Res> {
  factory _$MessageModelCopyWith(_MessageModel value, $Res Function(_MessageModel) _then) = __$MessageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String accountId, String msgid, String intro, Map<String, String> from, List<Map<String, String>> to, List<String> cc, List<String> bcc, String subject, bool seen, bool flagged, bool isDeleted, Map<String, dynamic> verifications, bool retention, DateTime? retentionDate, String text, List<String> html, bool hasAttachments, List<Attachment> attachments, int size, String downloadUrl, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$MessageModelCopyWithImpl<$Res>
    implements _$MessageModelCopyWith<$Res> {
  __$MessageModelCopyWithImpl(this._self, this._then);

  final _MessageModel _self;
  final $Res Function(_MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? msgid = null,Object? intro = null,Object? from = null,Object? to = null,Object? cc = null,Object? bcc = null,Object? subject = null,Object? seen = null,Object? flagged = null,Object? isDeleted = null,Object? verifications = null,Object? retention = null,Object? retentionDate = freezed,Object? text = null,Object? html = null,Object? hasAttachments = null,Object? attachments = null,Object? size = null,Object? downloadUrl = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_MessageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,msgid: null == msgid ? _self.msgid : msgid // ignore: cast_nullable_to_non_nullable
as String,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self._from : from // ignore: cast_nullable_to_non_nullable
as Map<String, String>,to: null == to ? _self._to : to // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,cc: null == cc ? _self._cc : cc // ignore: cast_nullable_to_non_nullable
as List<String>,bcc: null == bcc ? _self._bcc : bcc // ignore: cast_nullable_to_non_nullable
as List<String>,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,seen: null == seen ? _self.seen : seen // ignore: cast_nullable_to_non_nullable
as bool,flagged: null == flagged ? _self.flagged : flagged // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,verifications: null == verifications ? _self._verifications : verifications // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,retention: null == retention ? _self.retention : retention // ignore: cast_nullable_to_non_nullable
as bool,retentionDate: freezed == retentionDate ? _self.retentionDate : retentionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,html: null == html ? _self._html : html // ignore: cast_nullable_to_non_nullable
as List<String>,hasAttachments: null == hasAttachments ? _self.hasAttachments : hasAttachments // ignore: cast_nullable_to_non_nullable
as bool,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<Attachment>,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
