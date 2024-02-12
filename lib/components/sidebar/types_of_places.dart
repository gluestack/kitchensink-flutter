import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:kitchensink_gluestack/models/type_of_places.dart';

class KSTypesOfPlaces extends StatelessWidget {
  KSTypesOfPlaces({super.key});
  final List<TypeOfPlacesModel> _typeOfPlacesData = [
    TypeOfPlacesModel(label: 'Entire place', value: 'entirePlace'),
    TypeOfPlacesModel(label: 'Private room', value: 'privateRoom'),
    TypeOfPlacesModel(label: 'Shared room', value: 'sharedRoom'),
  ];
  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSVstackSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSHeading(
          text: "Type of place",
          size: GSSizes.$sm,
        ),
        GSCheckBoxGroup(
            values: [
              _typeOfPlacesData[0].value,
            ],
            child: GSVStack(
              crossAxisAlignment: CrossAxisAlignment.start,
              space: GSVstackSpaces.$lg,
              children: [
                for (int i = 0; i < _typeOfPlacesData.length; i++)
                  GSCheckBox(
                    size: GSCheckBoxSizes.$sm,
                    onChanged: (value) {},
                    icon: GSCheckBoxIndicator(
                        style: GSStyle(
                            margin: EdgeInsets.only(right: $GSSpace.$3)),
                        child: const GSCheckBoxIcon()),
                    value: _typeOfPlacesData[i].value,
                    label: GSCheckBoxLabel(text: _typeOfPlacesData[i].label),
                  ),
              ],
            ))
      ],
    );
  }
}
