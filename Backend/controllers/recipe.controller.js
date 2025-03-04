const mongodb = require("mongodb");
const Recipe = require("../models/recipe.model");
const asyncHandler = require("express-async-handler");

// @desc    Create a new recipe
// @route   POST /api/recipes
// @access  Public
// This function creates a new recipe
exports.createRecipe = asyncHandler(async (req, res) => {
  const createBody = req.body;

  console.log('POST', createBody)

  const newRecipe = new Recipe(createBody);
  const savedRecipe = await newRecipe.save();

  res.status(201).json(savedRecipe);
});

// @desc    Get all recipes
// @route   GET /api/recipes
// @access  Public
// This function retrieves all the recipes
exports.getAllRecipes = asyncHandler(async (req, res) => {
  const recipes = await Recipe.find();
  res.status(200).json(recipes);
});

// @desc    Get one recipes
// @route   GET /api/recipes/:id
// @access  Public
// This function retrieves all the recipes based on a recipe ID
exports.getOneRecipe = asyncHandler(async (req, res) => {
  const id = req.params.id;
  const objectId = new mongodb.ObjectId(id)

  const recipes = await Recipe.findOne({ _id: objectId });
  res.status(200).json(recipes);
});

// @desc    Update one recipes
// @route   PUT /api/recipes/:id
// @access  Public
// This function updates a existing recipe based on its ID
exports.editRecipe = asyncHandler(async (req, res) => {
  const id = req.params.id;
  console.log('PUT', id)
  const {
    name,
    description,
    ingredients,
    preparation,
    serving,
    cookTime,
    difficulty,
    nutrition,
  } = req.body;

  const recipe = await Recipe.findById(id);

  if (!recipe) {
    return res.status(404).json({
      message: `(recipe controller) edit recipe: Receta con id: ${id} no encontrada, `,
    });
  }

  recipe.name = name;
  recipe.description = description;
  recipe.ingredients = ingredients;
  recipe.preparation = preparation;
  recipe.serving = serving;
  recipe.cookTime = cookTime;
  recipe.difficulty = difficulty;
  recipe.nutrition = nutrition;

  const updatedRecipe = await recipe.save();

  res.status(200).json(updatedRecipe);
});

// @desc    Delete a recipe
// @route   DELETE /api/recipes/:id
// @access  Public
// This function deletes a recipes by its ID
exports.deleteRecipe = asyncHandler(async (req, res) => {
  const id = req.params.id;
  const objectId = new mongodb.ObjectId(id)

  const deletedRecipe = await Recipe.deleteOne({ _id: objectId  });
  res.status(200).json(deletedRecipe);
});
