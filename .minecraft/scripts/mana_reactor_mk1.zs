import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;

val mr = RecipeBuilder.newBuilder("convert", "mana_reactor_mk1", 1);
mr.addManaInput(120);
mr.addManaOutput(120);
mr.build();