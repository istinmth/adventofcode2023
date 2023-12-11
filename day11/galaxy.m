inputPath = "galaxy.txt";
input = Characters /@ Import[inputPath, "List"];

expandUniverse[factor_, array_] :=
 Module[{oldPos, newPos, subs},
    oldPos = Position[array, "#"];
    newPos = oldPos + (factor - 1) * Count[Position[array, " "], _?(# < oldPos &)];
    subs = Subsets[newPos, {2}];
    Total[ManhattanDistance @@ # & /@ subs]]

expandUniverse[2, input]
expandUniverse[10^6, input]
