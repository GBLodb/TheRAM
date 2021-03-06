#priority 10
import mods.botaniatweaks.Agglomeration;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;


Agglomeration.addRecipe(<astralsorcery:itemcraftingcomponent:4>,
        [<ore:gemAquamarine>], 20000, 0x0000FF, 0x00FF00,
        <contenttweaker:stabilizer>, <chisel:futura:1>, <chisel:futura>,
        <contenttweaker:stabilizer>, <chisel:futura:3>, <chisel:futura:5>
);



val ram00 = RecipeBuilder.newBuilder("ram00", "ram-active-00", 6*20);
ram00.addItemInput(<minecraft:stone>);
ram00.addItemOutput(<minecraft:gold_ore>);
ram00.build();

val ram001 = RecipeBuilder.newBuilder("ram001", "ram-active-00", 6*20);
ram001.addItemInput(<minecraft:emerald_ore>);
ram001.addItemOutput(<minecraft:emerald>);
ram001.build();

val ram01 = RecipeBuilder.newBuilder("ram01", "ram-active-01", 6*20);
ram01.addItemInput(<minecraft:stone>);
ram01.addItemOutput(<minecraft:coal>);
ram01.build();

val ram011 = RecipeBuilder.newBuilder("ram011", "ram-active-01", 6*20);
ram011.addItemInput(<minecraft:diamond_ore>);
ram011.addItemOutput(<minecraft:diamond>);
ram011.build();

val ram10 = RecipeBuilder.newBuilder("ram10", "ram-active-10", 6*20);
ram10.addItemInput(<minecraft:stone>);
ram10.addItemOutput(<minecraft:diamond_ore>);
ram10.build();

val ram101 = RecipeBuilder.newBuilder("ram101", "ram-active-10", 6*20);
ram101.addItemInput(<minecraft:gold_ore>);
ram101.addItemOutput(<minecraft:gold_ingot>);
ram101.build();


val ram11 = RecipeBuilder.newBuilder("ram11", "ram-active-11", 6*20);
ram11.addItemInput(<minecraft:stone>);
ram11.addItemOutput(<minecraft:emerald_ore>);
ram11.build();

val ram111 = RecipeBuilder.newBuilder("ram111", "ram-active-11", 6*20);
ram111.addItemInput(<minecraft:diamond>);
ram111.addItemInput(<minecraft:emerald>);
ram111.addItemInput(<minecraft:coal>);
ram111.addItemInput(<minecraft:gold_ingot>);
ram111.addItemOutput(<minecraft:iron_ingot>);
ram111.build();