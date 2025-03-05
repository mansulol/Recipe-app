import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_app/models/create_edit_model.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/recipe_screen.dart';
import 'package:recipe_app/services/recipe_service.dart';
import 'package:recipe_app/utils/constants.dart';
import 'package:recipe_app/utils/helpers.dart';

class CreateEditScreen extends StatefulWidget {
  final bool isCreate;
  final String id;
  const CreateEditScreen({this.isCreate = true, this.id = '', super.key});

  @override
  CreateEditScreenState createState() => CreateEditScreenState();
}

class CreateEditScreenState extends State<CreateEditScreen> {
  RecipeModel? recipe;
  CreateEditModel createEditModel = CreateEditModel();

  // Text fields controllers
  late FormControllers formControllers = FormControllers();

  @override
  void initState() {
    super.initState();
    loadRecipe();
  }

  Future<void> loadRecipe() async {
    try {
      final data = await RecipeService().getOneRecipe(widget.id);
      setState(() {
        recipe = data;
        if (!widget.isCreate) {
          formControllers.loadFormControllers(data);
        }
      });
    } catch (e) {
      // Error handling needed
    }
  }

  @override
  Widget build(BuildContext context) {
    // CreateEditModel createEditData = CreateEditModel();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isCreate ? 'Create Recipe' : 'Edit Recipe',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w800,
            fontSize: AppTextStyles.titleApp.fontSize,
            fontFamily: AppFonts.primaryFont,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: formBody(
          context,
          formControllers,
          widget.isCreate,
          recipe,
          createEditModel,
        ),
      ),
    );
  }
}

Container formBody(
  BuildContext context,
  FormControllers formControllers,
  bool isCreate,
  RecipeModel? recipe,
  CreateEditModel handlerCreateEdit,
) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: formControllers.nameController,
              decoration: InputDecoration(
                hintText:
                    isCreate
                        ? "Enter the recipe name..."
                        : formControllers.nameController.text,
                labelText: "Name",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.pizzaSlice,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              controller: formControllers.descriptionController,
              decoration: InputDecoration(
                hintText: "Enter A Description",
                labelText: "Description",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.pencil,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              controller: formControllers.servingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "min - max",
                labelText: "Serving amount",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.userGroup,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              controller: formControllers.cookTimeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Duration in minutes...",
                labelText: "Cooking Time",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.clock,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              controller: formControllers.difficultyController,
              decoration: InputDecoration(
                hintText: "Easy - medium - hard",
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
              controller: formControllers.ingredientsController,
              decoration: InputDecoration(
                hintText: "Separate ingredients by comma...",
                labelText: "Ingredients",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.utensils,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              controller: formControllers.preparationController,
              maxLength: null,
              decoration: InputDecoration(
                hintText: "Separate steps by comma...",
                labelText: "Preparation",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.bowlFood,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              controller: formControllers.proteinController,
              maxLength: null,
              decoration: InputDecoration(
                hintText: "Ej: 3.1g",
                labelText: "Protein (g)",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.drumstickBite,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              controller: formControllers.carbsController,
              maxLength: null,
              decoration: InputDecoration(
                hintText: "Ej: 15.3g",
                labelText: "Carbohidrates (g)",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.bowlRice,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              controller: formControllers.fibreController,
              maxLength: null,
              decoration: InputDecoration(
                hintText: "Ej: 9.2g",
                labelText: "Fibre (g)",
                labelStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextStyles.subTitle.fontSize,
                ),
                prefixIcon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.leaf,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            await sendData(
              context,
              formControllers,
              isCreate,
              recipe?.id,
              handlerCreateEdit,
            );
          },
          child: Text(
            isCreate ? 'CREATE' : 'EDIT',
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ),
      ],
    ),
  );
}

void getFormData() {}

Future<RecipeModel> sendData(
  context,
  FormControllers formControllers,
  bool isCreate,
  id,
  CreateEditModel handlerCreateEdit,
) async {
  late RecipeModel response;

  handlerCreateEdit = CreateEditModel();

  handlerCreateEdit.name = formControllers.nameController.text;
  handlerCreateEdit.description = formControllers.descriptionController.text;
  handlerCreateEdit.ingredientsConverter(
    formControllers.ingredientsController.text,
  );
  handlerCreateEdit.preparationConverter(
    formControllers.preparationController.text,
  );
  handlerCreateEdit.servingConverter(formControllers.servingController.text);
  handlerCreateEdit.cookTime = int.parse(
    formControllers.cookTimeController.text.trim(),
  );
  handlerCreateEdit.dificultConverter(
    formControllers.difficultyController.text,
  );
  handlerCreateEdit.nutritionConverter(
    formControllers.proteinController.text,
    formControllers.carbsController.text,
    formControllers.fibreController.text,
  );

  try {
    if (isCreate) {
      response = await RecipeService().createRecipe(handlerCreateEdit);
      formControllers.clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      response = await RecipeService().updateRecipe(id, handlerCreateEdit);
      formControllers.clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) => RecipeScreen(id)),
      );
    }

    return response;
  } catch (e) {
    // Handling needed
    throw Exception("Error while trying sending data: $e");
  }
}
