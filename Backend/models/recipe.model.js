const mongoose = require("mongoose");

const RecipeSchema = new mongoose.Schema({
    // 'name' is a required field of type String
    // represents the name of the recipe
    name: {
      type: String,
      required: true,
    },
    // 'description' is a required field of type String
    // represents the description of the recipe
    description: {
      type: String,
      required: true,
    },
    // 'ingredients' is a required field of type String
    // represents the ingredients in a recipe
    ingredients: [
      {
        type: String,
        required: true,
      },
    ],
    // 'preparation' is a required field of type String
    // represents the steps for the preparation of a recipe
    preparation: [
      {
        type: String,
        required: true,
      },
    ],
    // 'serving' is a required field of type Number
    // represents the number of people who can feed of a single plate
    serving: {
      min: {
        type: Number,
        required: false,
      },
      max: {
        type: Number,
        required: true,
      },
    },
    // 'cookTime' is not a required field of type Number
    // represents the time that takes to cook a recipe
    cookTime: {
      type: Number,
      required: false,
    },
    // 'name' is not a required field of type Number
    // represents between 1-3 the dificulty of a recipe
    difficulty: {
      type: Number,
      required: false,
    },
    // 'nutrition' is a required field of type Number
    // represents the prots, carbs and fibre of a recipe
    nutrition: {
      protein: {
        type: Number,
        required: true,
      },
      carbs: {
        type: Number,
        required: true,
      },
      fibre: {
        type: Number,
        required: true,
      },
    },
  },
  { collection: 'recipes' },
  { timestamps: true }
);

module.exports = mongoose.model("recipes", RecipeSchema);
