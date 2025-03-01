const express = require("express");
const router = express.Router();
const {
  createRecipe,
  getAllRecipes,
  getOneRecipe,
  editRecipe,
  deleteRecipe,
} = require("../controllers/recipe.controller");

// @route   GET /api/recipes/:id
// @desc    Get recipes by recipe ID
// @route   PUT /api/recipes/:id
// @desc    Update a recipe by ID
// @route   DELETE /api/recipes/:id
// @desc    Delete a recipe by ID
// @access  Public (without auth middleware)
// Chained  .get(), .put(), .delete() methods for the route '/:id'
router.route("/:id")
  .get(getOneRecipe)
  .put(editRecipe)
  .delete(deleteRecipe);

// @route   GET /api/recipes/
// @desc    Get all recipes
// @route   POST /api/recipes/
// @desc    Create a new recipe
// @access  Public (without auth middleware)
// Chained  .get(), .post(), methods for the base route '/'
router.route("/")
  .get(getAllRecipes)
  .post(createRecipe);

module.exports = router;
