import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/contact_bloc.dart';
import 'package:tsirbunenpottery/features/contact/domain/bloc/contact_state.dart';
import 'package:tsirbunenpottery/features/contact/presentation/contact_view/contact_form.dart';
import 'package:tsirbunenpottery/features/contact/presentation/contact_view/photo_and_info.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_gaps.dart';
import 'package:tsirbunenpottery/widgets/footer/footer.dart';
import 'package:tsirbunenpottery/widgets/page_base/page_base.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      pageBody: BlocBuilder<ContactBloc, ContactState>(
          builder: (BuildContext context, ContactState state) {
        final width = MediaQuery.of(context).size.width;
        final isHorizontal = width > AppDimensions.wideScreenBreakpoint;
        final imageFileName = state.ownerPhotoFileName;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing25),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isHorizontal
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PhotoAndInfo(imageFileName: imageFileName),
                          AppGaps.h50,
                          const ContactForm(),
                        ],
                      )
                    : Column(
                        children: [
                          const ContactForm(),
                          AppGaps.v25,
                          PhotoAndInfo(imageFileName: imageFileName),
                        ],
                      ),
                const Footer(),
              ]),
        );
      }),
    );
  }
}
