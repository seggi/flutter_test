import 'package:flutter_stest/colllers/manage_providers.dart';
import 'package:flutter_stest/core/medecine_model.dart';
import 'package:flutter_stest/screens/screen_list.dart';
import 'package:go_router/go_router.dart';

class PagesGenerator {
  static final router = GoRouter(routes: [
    GoRoute(
        path: '/',
        name: "start-screen",
        builder: (context, state) => const MedicineScreen(),
        routes: [
          GoRoute(
            path: 'search',
            name: "search",
            builder: (context, state) => const SearchScreen(),
          ),
          GoRoute(
            path: 'medicine-details',
            name: "medicine-details",
            builder: (context, state) {
              var image = state.extra! as MedicineModel;

              return MedicineDetailsScreen(
                data: image,
              );
            },
          ),
        ]),
  ]);

  // Call this method to navigate to the next screen
  static goTo(context,
      {String? name,
      String? pathName,
      Map<String, String> params = const {},
      Map<String, String> queryParams = const {},
      Object? extra,
      itemData = "notFound",
      provider = "notFound"}) {
    if (pathName != null) {
      ManageProviders.save[provider](context, itemData: itemData);
      return GoRouter.of(context).go(pathName, extra: extra);
    } else {
      ManageProviders.save[provider](context, itemData: itemData);
      return GoRouter.of(context).goNamed(name!,
          params: params, queryParams: queryParams, extra: extra);
    }
  }
}
