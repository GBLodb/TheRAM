#loader contenttweaker
#priority 10000
import crafttweaker.data.IData;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.BlockState;
import crafttweaker.block.IBlockPattern;
import crafttweaker.block.IBlock;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.contenttweaker.BlockPos;
import mods.zenutils.cotx.Block;
import mods.zenutils.cotx.TileEntity;
import mods.zenutils.StaticString;
import scripts.grassUtils.EventUtilsCot.getOffset;

static serializerRecipes as IItemStack[IIngredient] = {
    <item:chisel:futura:3> : <item:chisel:futura:1>,
    <item:chisel:futura:5> : <item:chisel:futura:0>,
    <item:chisel:futura:0> : <item:chisel:factory:14>,
    <item:chisel:futura:1> : <item:chisel:factory:14>
};

static default as int = 0 - 1;

val tileEntity as TileEntity = VanillaFactory.createActualTileEntity(1);
tileEntity.onTick = function(te, world, pos) {
    val temp as int[] = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    val tempType as int[] = [default, default, default, default, default, default, default, default, default];
    val tempData as IData = temp as IData;
    if (!(te.data has "nearBlocks")) {
        te.updateCustomData({nearBlocks : tempData});
    }
    if (!(te.data has "nearBlockTypes")) {
        te.updateCustomData({nearBlockTypes : tempData});
    }
    if (world.remote) return;
    for i in 0 .. 3 {
        for j in 0 .. 3 {
            if (i == 1 && j == 1) continue;
            var index as int = i * 3 + j;
            var time as int = 0;
            var type as int = default;
            time = te.data.nearBlocks[index].asInt();
            type = te.data.nearBlockTypes[index].asInt();
            var flag as bool = false;
            val posOffset as BlockPos = getOffset(pos, i - 1, 0, j - 1);
            val state as BlockState = world.getBlockState(posOffset);
            if (type == default) {
                for i, ins in serializerRecipes.keys {
                    if (ins.matches(state.block.getItem(world, pos, state))) {
                        type = i;
                        break;
                    }
                }
            }
            if (type != default) {
                if (serializerRecipes.keys[type].matches(state.block.getItem(world, pos, state))) {
                    time += 1;
                    flag = true;
                    if (time == 300) {
                        val out as IItemStack = serializerRecipes.values[type];
                        world.setBlockState(out.asBlock().definition.getStateFromMeta(out.metadata), posOffset);
                        time = 0;
                    }
                }
            }
            if (!flag) {
                time = 0;
                type = default;
            }
            temp[index] = time;
            tempType[index] = type;
        }
    }
    te.updateCustomData({nearBlocks : temp, nearBlockTypes : tempType});
};
tileEntity.register();

val sr as Block = VanillaFactory.createExpandBlock("stabilizer", <blockmaterial:iron>);
sr.blockHardness = 3.0f;
sr.tileEntity = tileEntity;
sr.register();