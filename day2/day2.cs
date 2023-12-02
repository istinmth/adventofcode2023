internal class Program
{
    private static void Main(string[] args)
    {
        var total = 0;

        var lines = File.ReadLines("input.txt");
        foreach (var line in lines)
        {
            var parts = line.Split(": ");
            if (!int.TryParse(parts[0].AsSpan(5), out var gameId)) continue;

            var cubeSets = parts[1].Split("; ");
            var minCubes = new Dictionary<string, int> { { "red", 0 }, { "green", 0 }, { "blue", 0 } };
            foreach (var cubeSet in cubeSets)
            {
                var cubes = new Dictionary<string, int>();
                foreach (var pair in cubeSet.Split(", "))
                {
                    var numColor = pair.Split(" ");
                    if (!int.TryParse(numColor[0], out var num)) continue;
                    cubes[numColor[1]] = num;
                }
                foreach (var cube in cubes)
                {
                    if (cube.Value > minCubes[cube.Key])
                    {
                        minCubes[cube.Key] = cube.Value;
                    }
                }
            }
            var power = minCubes.Values.Aggregate(1, (a, b) => a * b);
            total += power;
        }

        Console.WriteLine(total);
    }
}