import 'package:madmudmobile/localization/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_bloc.dart';
import 'package:madmudmobile/app/general_state_bloc/general_state_state.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_bloc.dart';
import 'package:madmudmobile/features/products/domain/bloc/products_state.dart';
import 'package:madmudmobile/features/products/presentation/design_view/design_description.dart';
import 'package:madmudmobile/features/products/presentation/design_view/design_photos.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/widgets/page_base/page_base.dart';

const double spacing = 20.0;
const double limit = 600.0;

class DesignView extends StatelessWidget {
  final String id;

  const DesignView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      pageBody: BlocBuilder<GeneralStateBloc, GeneralState>(
          builder: (BuildContext context, GeneralState state) {
        final language = state.language;
        return BlocBuilder<ProductsBloc, ProductsState>(builder: (
          BuildContext context,
          ProductsState state,
        ) {
          final design = state.designsById[id];
          final designName = design?.names[language];
          final designNotFound = context.local(Translation.designNotFound);
          if (design == null || designName == null) {
            return Center(child: Text(designNotFound));
          }

          final pieces = state.piecesByDesignId(id);

          return LayoutBuilder(
            builder: (context, constraints) {
              bool hasRoomForRow = constraints.maxWidth > limit;

              return Container(
                margin: const EdgeInsets.all(20.0),
                child: hasRoomForRow
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DesignPhotos(pieces: pieces),
                          const SizedBox(width: spacing),
                          Flexible(
                            child: ConstrainedBox(
                              constraints:
                                  const BoxConstraints(maxWidth: limit),
                              child: DesignDescription(
                                  language: language, design: design),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DesignPhotos(pieces: pieces),
                          const SizedBox(height: spacing),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: DesignDescription(
                                language: language, design: design),
                          ),
                        ],
                      ),
              );
            },
          );
        });
      }),
    );
  }
}
