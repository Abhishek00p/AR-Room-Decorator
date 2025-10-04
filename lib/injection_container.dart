import 'package:get_it/get_it.dart';
import 'package:room_decorator/data/datasources/catalog_datasource.dart';
import 'package:room_decorator/data/datasources/mock_catalog_datasource.dart';
import 'package:room_decorator/data/datasources/mock_room_design_local_datasource.dart';
import 'package:room_decorator/data/datasources/room_design_local_datasource.dart';
import 'package:room_decorator/data/repositories/catalog_repository_impl.dart';
import 'package:room_decorator/data/repositories/room_design_repository_impl.dart';
import 'package:room_decorator/domain/repositories/catalog_repository.dart';
import 'package:room_decorator/domain/repositories/room_design_repository.dart';
import 'package:room_decorator/domain/usecases/catalog/get_catalog_items.dart';
import 'package:room_decorator/domain/usecases/catalog/get_paint_colors.dart';
import 'package:room_decorator/domain/usecases/room_design/delete_room_design.dart';
import 'package:room_decorator/domain/usecases/room_design/get_design_by_id.dart';
import 'package:room_decorator/domain/usecases/room_design/get_saved_designs.dart';
import 'package:room_decorator/domain/usecases/room_design/save_room_design.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use Cases
  sl.registerLazySingleton(() => GetCatalogItems(sl()));
  sl.registerLazySingleton(() => GetPaintColors(sl()));
  sl.registerLazySingleton(() => SaveRoomDesign(sl()));
  sl.registerLazySingleton(() => GetSavedDesigns(sl()));
  sl.registerLazySingleton(() => GetDesignById(sl()));
  sl.registerLazySingleton(() => DeleteRoomDesign(sl()));

  // Repositories
  sl.registerLazySingleton<CatalogRepository>(
    () => CatalogRepositoryImpl(dataSource: sl()),
  );
  sl.registerLazySingleton<RoomDesignRepository>(
    () => RoomDesignRepositoryImpl(localDataSource: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<CatalogDataSource>(
    () => MockCatalogDataSource(),
  );
  sl.registerLazySingleton<RoomDesignLocalDataSource>(
    () => MockRoomDesignLocalDataSource(),
  );
}