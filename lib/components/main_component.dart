import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:kitchensink_gluestack/components/ks_resp_row_col_custom.dart';
import 'package:kitchensink_gluestack/components/list_your_place_modal/modal.dart';
import 'package:kitchensink_gluestack/components/stacked_card.dart';
import 'package:kitchensink_gluestack/models/stacked_card.dart';

List<String> titles = [
  "Tropical",
  "Amazing views",
  "Caves",
  "Mansions",
  "Amazing pools",
  "Cabins",
  "Beachfront",
  "Countryside",
  "Tiny homes",
  "National parks",
];

List<StackedCardModel> stackedCardData = [
  StackedCardModel(
      imageUrl: 'assets/images/image16.png',
      price: '\$1,481',
      rating: 4.9,
      location: "401 Platte River Rd, Gothenburg, United States",
      buttonText: 'Explore',
      title: 'ImageView Inn'),
  StackedCardModel(
      imageUrl: 'assets/images/image17.png',
      price: '\$1,381',
      rating: 4.89,
      location: "1502 Silica Ave, Sacramento California",
      buttonText: 'Explore',
      title: 'Spinner Resort'),
  StackedCardModel(
      imageUrl: 'assets/images/image18.png',
      price: '\$2,481',
      rating: 4.6,
      location: "2945 Entry Point Blvd, Kissimmee, Florida",
      buttonText: 'Explore',
      title: 'DropDown Den'),
];

class KSMainComponent extends StatelessWidget {
  const KSMainComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSVstackSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //r1
        KSRespRowCol(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const GSHeading(size: GSSizes.$xl, text: 'New this week'),
            GSBox(
              style: GSStyle(
                padding: const EdgeInsets.only(top: 9),
              ),
              child: GSButton(
                variant: GSButtonVariants.outline,
                action: GSButtonActions.secondary,
                child: GSHStack(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GSBox(
                        style:
                            GSStyle(padding: const EdgeInsets.only(right: 5)),
                        child: GSButtonIcon(
                          icon: Icons.list,
                          iconSize: GSSizes.$2xl,
                          style: GSStyle(
                            dark: GSStyle(color: $GSColors.textLight200),
                          ),
                        ),
                      ),
                      const GSButtonText(
                        text: 'List your place',
                      ),
                    ]),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return const ListYourPlaceModal();
                      });
                },
              ),
            ),
          ],
        ),
        //r2
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GSHStack(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 1; i < 10; i++)
                GSBox(
                  style: GSStyle(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GSImage(
                        fit: BoxFit.cover,
                        size: GSImageSizes.$2xl,
                        path: 'assets/images/image$i.png',
                        imageType: GSImageType.asset),
                  ),
                ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GSButtonGroup(buttons: [
            for (String title in titles) ...[
              GSButton(
                  action: GSButtonActions.secondary,
                  variant: GSButtonVariants.link,
                  onPressed: () {},
                  child: GSButtonText(
                    text: title,
                    style: GSStyle(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: $GSColors.textLight900,
                      ),
                      dark: GSStyle(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: $GSColors
                              .textDark50, //Error: Auto dark mode does not work, have to force declare like
                        ),
                      ),
                    ),
                  ))
            ]
          ]),
        ),

        KSRespRowCol(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < stackedCardData.length; i++)
              KSStackedCard(
                stackedCardModel: stackedCardData[i],
              ),
          ],
        )
      ],
    );
  }
}
