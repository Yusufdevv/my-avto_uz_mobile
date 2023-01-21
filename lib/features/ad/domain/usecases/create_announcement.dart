import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/models/announcement_to_post_model.dart';
import 'package:auto/features/ad/domain/entities/announcement/announcement_entity_to_post.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/reels/domain/entities/announcement_entity.dart';
import 'package:dio/dio.dart';

class CreateAnnouncementUseCase
    extends UseCase<void, AnnouncementToPostEntity> {
  final AdRepository repository;

  CreateAnnouncementUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(AnnouncementToPostEntity params) async {
    print('=> => => => PARAMS:    ${(params as AnnouncementToPostModel).toJson()}    <= <= <= <=');

    List<MultipartFile> images = [];

    for (final element in params.gallery) {
      final multiParFile = await MultipartFile.fromFile(
        element,
      );
      images.add(multiParFile);
    }
    print('=> => => => images:    $images    <= <= <= <=');
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
      'damaged_parts': [
        {"part": "rigth_front_door", "damage_type": "ideal"}
        
      ]
    };

    final announcementFormData = FormData.fromMap(announcementFields);

    return repository.createAnnouncement(
      announcementFormData: announcementFormData,
    );
  }
}
