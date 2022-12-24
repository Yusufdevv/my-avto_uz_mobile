// import 'package:auto/core/exceptions/failures.dart';
// import 'package:auto/core/usecases/usecase.dart';
// import 'package:auto/core/utils/either.dart';
// import 'package:auto/features/ad/domain/entities/announcement/announcement.dart';
// import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
// import 'package:dio/dio.dart';

// class CreateAnnouncementUseCase extends UseCase<void, AnnouncementParams> {
//   final AdRepository repository;

//   CreateAnnouncementUseCase({required this.repository});

//   @override
//   Future<Either<Failure, void>> call(AnnouncementParams params) async {
//     final announcementFields = <String, dynamic>{
//       'make': params.announcementEntity.make,
//       'model': params.announcementEntity.model,
//       'generation': params.announcementEntity.generation,
//       'body_type': params.announcementEntity.bodyType,
//       'drive_type': params.announcementEntity.driveType,
//       'engine_type': params.announcementEntity.engineType,
//       'gearbox_type': params.announcementEntity.gearboxType,
//       'year': params.announcementEntity.year,
//       'modification_type': params.announcementEntity.modificationType,
//       'color': params.announcementEntity.color,
//       'purchase_date': params.announcementEntity.purchaseDate,
//       'description': params.announcementEntity.description,
//       'is_registered_locally': params.announcementEntity.isRegisteredLocally,
//       'contact_name': params.announcementEntity.contactName,
//       'contact_email': params.announcementEntity.contactEmail,
//       'contact_phone': params.announcementEntity.contactPhone,
//       'contact_available_from': params.announcementEntity.contactAvailableFrom,
//       'contact_available_to': params.announcementEntity.contactAvailableTo,
//       'region': params.announcementEntity.region,
//       'district': params.announcementEntity.district,
//       'price': params.announcementEntity.price,
//       'currency': params.announcementEntity.currency,
//       'distance_traveled': params.announcementEntity.distanceTraveled,
//       'registration_vin': params.announcementEntity.registrationVin,
//       'registration_plate': params.announcementEntity.registrationPlate,
//       'registration_certificate':
//           params.announcementEntity.registrationCertificate,
//       'registration_serial_number':
//           params.announcementEntity.registrationSerialNumber,
//       'registered_in_uzbekistan':
//           params.announcementEntity.registeredInUzbekistan,
//       'is_new': params.announcementEntity.isNew,
//       'licence_type': params.announcementEntity.licenceType,
//       'ownership': params.announcementEntity.ownership,
//       'location_url': params.announcementEntity.locationUrl,
//       'damaged_parts': [
//         ...params.announcementEntity.damagedParts.map((e) => e.toJson())
//       ]
//     };

//     final announcementFormData = FormData.fromMap(announcementFields);
//     for (final element in params.announcementEntity.gallery) {
//       final multiParFile = await MultipartFile.fromFile(element);
//       announcementFormData.files.add(MapEntry('gallery', multiParFile));
//     }

//     return repository.createAnnouncement(
//       announcementFormData: announcementFormData,
//     );
//   }
// }

// class AnnouncementParams {
//   final String? next;
//   // final AnnouncementEntity announcementEntity;

//   AnnouncementParams({
//     required this.announcementEntity,
//     this.next,
//   });
// }
