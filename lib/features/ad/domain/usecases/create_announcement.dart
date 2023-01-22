import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/models/announcement_to_post_model.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:dio/dio.dart';

class CreateAnnouncementUseCase extends UseCase<void, AnnouncementToPostModel> {
  final AdRepository repository;

  CreateAnnouncementUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(AnnouncementToPostModel params) async {
    List<MultipartFile> images = [];

    for (final element in params.gallery) {
      final multiParFile = await MultipartFile.fromFile(
        element,
      );
      images.add(multiParFile);
    }

    Map<String, dynamic> damages = <String, dynamic>{};

    for (int i = 0; i < params.damagedParts.length; i++) {
      damages[params.damagedParts[i].part] = params.damagedParts[i].damageType;
    }
    final announcementFields = <String, dynamic>{
      'make': params.make,
      'model': params.model,
      'generation': params.generation,
      'body_type': params.bodyType,
      'drive_type': params.driveType,
      'engine_type': params.engineType,
      'gearbox_type': params.gearboxType,
      'year': params.year,
      'modification_type': params.modificationType,
      'color': params.color,
      'purchase_date': params.purchaseDate,
      'description': params.description,
      'is_registered_locally': params.isRegisteredLocally,
      'contact_name': params.contactName,
      'contact_email': params.contactEmail,
      'contact_phone': params.contactPhone,
      'contact_available_from': params.contactAvailableFrom,
      'contact_available_to': params.contactAvailableTo,
      'region': params.region,
      'district': params.district,
      'price': params.price,
      'currency': params.currency,
      'distance_traveled': params.distanceTraveled,
      'registration_vin': params.registrationVin,
      'registration_plate': params.registrationPlate,
      'registration_certificate': params.registrationCertificate,
      'registration_serial_number': params.registrationSerialNumber,
      'registered_in_uzbekistan': params.registeredInUzbekistan,
      'is_new': params.isNew,
      'licence_type': params.licenceType,
      'ownership': params.ownership,
      'location_url': params.locationUrl,
      'gallery': images,
      'damaged_parts': damages,
    };

    final announcementFormData = FormData.fromMap(announcementFields);
print('=> => => =>  boundary:   ${announcementFormData.boundary}    <= <= <= <=');
print('=> => => =>   filds:   ${announcementFormData.fields}    <= <= <= <=');

print('=> => => =>  files length:   ${announcementFormData.files.length}    <= <= <= <=');
print('=> => => =>   length:   ${announcementFormData.length}    <= <= <= <=');
    return repository.createAnnouncement(
      announcementFormData: announcementFormData,
    );
  }
}
