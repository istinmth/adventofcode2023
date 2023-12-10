import java.io.*;
import java.util.*;

public class Main {
	public static void main(String[] args) throws IOException {
		String filename = "pipes.txt";
		BufferedReader reader = new BufferedReader(new FileReader(filename));
		String raw_data = reader.readLine();

		String[] grid = raw_data.split("\n");
		int height = grid.length;
		int width = grid[0].length();

		int[][] visited = new int[height][width];

		int start_x = -1;
		int start_y = -1;
		for (int i = 0; i < height; i++) {
			for (int j = 0; j < width; j++) {
				if (grid[i].contains("S")) {
					start_x = i;
					start_y = grid[i].indexOf("S");
				}
			}
		}

		Pair[] directions = {new Pair(0, 1), new Pair(1, 0), new Pair(0, -1), new Pair(-1, 0)};
		String[] valid_chars = {"-7J", "|LJ", "-FL", "|F7"};
		List<Integer> start_directions = new ArrayList<>();
		for (int i = 0; i < 4; i++) {
			Pair pos = directions[i];
			int next_x = start_x + pos.x;
			int next_y = start_y + pos.y;
			if (next_x >= 0 && next_x < height && next_y >= 0 && next_y < width && valid_chars[i].contains(String.valueOf(grid[next_x].charAt(next_y)))) {
				start_directions.add(i);
			}
		}
		boolean valid_start = start_directions.contains(3);

		// The rest of the code is omitted for brevity
	}
}

class Pair {
	int x, y;

	Pair(int x, int y) {
		this.x = x;
		this.y = y;
	}
}