import 'package:flutter/material.dart';
import 'package:recipe_app/utils/constants.dart';

class CreateEditScreen extends StatelessWidget {
  const CreateEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create/Edit recipe',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w800,
            fontSize: AppTextStyles.titleApp.fontSize,
            fontFamily: AppFonts.primaryFont,
          ),
        ),
      ),
      body: formBody(),
    );
  }
}

Container formBody() {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your name",
                labelText: "Name",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: Icon(Icons.account_circle),
                prefixIconColor: AppColors.primaryColor,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter A Description",
                labelText: "Description",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: Icon(Icons.edit),
                prefixIconColor: AppColors.primaryColor,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Duration of Serving",
                labelText: "Serving Time",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: Icon(Icons.access_time),
                prefixIconColor: AppColors.primaryColor,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Duration of The Cooking",
                labelText: "Cooking Time",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: Icon(Icons.coffee_maker_outlined),
                prefixIconColor: AppColors.primaryColor,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Dificulty of the Recipe",
                labelText: "Dificulty",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: Icon(Icons.star),
                prefixIconColor: AppColors.primaryColor,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter the Ingredients",
                labelText: "Ingredients",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: Icon(Icons.apple),
                prefixIconColor: AppColors.primaryColor,
              ),
            ),
            TextField(
              maxLength: null,
              decoration: InputDecoration(
                hintText: "Preparation Details",
                labelText: "Preparation",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: Icon(Icons.portable_wifi_off),
                prefixIconColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
           
          },
          child: Text('GUARDAR'),
        ),
      ],
    ),
  );
}
