import std.stdio;
import std.file;
import std.string;
import std.conv;

enum Operation : char {
	OpAdd = '+',
	OpRem = '-'
}

void main()
{
	auto data = readText("data.txt").split("\n");
	int of = 0;
	int fof = -1;
	int[int] seenValues;
	int highestC = -1;
	int round = 0;

	while (highestC == -1) {
		//of = 0;
		foreach(line; data) {
			if (line.length < 2) continue;
			Operation op = cast(Operation)line[0];
			int offset = line[1..$].to!int;
			switch (op) {
				case (Operation.OpAdd):
					of += offset;
					break;
				case (Operation.OpRem):
					of -= offset;
					break;
				default: assert(0);
			}
			if (highestC == -1) {
				foreach(k, v; seenValues) {
					if (v == 2) {
						writeln("FOUND");
						highestC = k;
						break;
					}
				}
			}
			seenValues[of]++;
			//writeln(of, " seen ", seenValues[of], " times");
		}
		writeln("Round ", round, " elements: ", seenValues.length);
		if (fof == -1) fof = of;
		round++;
	}
	writeln("Result of 1:");
	writeln(fof);
	writeln("Result of 2:");
	writeln(highestC);
}