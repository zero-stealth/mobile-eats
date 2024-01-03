import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key, required this.image, required this.category, required this.descCategory, required this.vendors});
  final String image;
  final String category;
  final String descCategory;
  final List<String> vendors;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        height: 130,

        width: MediaQuery.of(context).size.width,
        child: Center(

          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Image.asset(image, fit: BoxFit.scaleDown,),
              ),
              const SizedBox(width: 12,),
              Flexible(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Color(ProjectColors.textColorGreen),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  ),
                 const SizedBox(height: 4,),
                  Text(
                    descCategory,
                    style: const TextStyle(
                        color: Color(ProjectColors.blackColorText),
                        fontSize: 12
                    ),
                  ),
                  const SizedBox(height: 4,),
                  const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Vendors",
                      style: TextStyle(
                          color: Color(ProjectColors.textColorGreen),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Flexible(
                    child: Text(
                      vendors.join(","),
                      style: const TextStyle(
                          color: Color(ProjectColors.blackColorText),
                          fontSize: 12
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
