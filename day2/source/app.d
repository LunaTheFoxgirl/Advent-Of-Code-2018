import std.stdio;
import std.file;
import std.string;

void main()
{
	auto data = readText("data.txt").split("\n");
	int threes = 0;
	int twos = 0;
	foreach(line; data) {
		int[char] letters;
		foreach(c; line) {
			letters[c]++;
		}

		bool twosDone = false;
		bool threesDone = false;
		foreach(k, v; letters) {
			if (!twosDone && v == 2) {
				twos++;
				twosDone = true;
			}
			if (!threesDone && v == 3) {
				threes++;
				threesDone = true;
			}
		}
	}
	writeln(threes*twos);
	writeln(getResult(data));
}

string getResult(string[] data) {
	foreach(line; data) {

		if (line == "") return "NOT_FOUND";
		
		foreach(lineB; data) {
			int[string] uncommonLines;

			if (lineB == "") continue;
		
			foreach(i; 0 .. line.length) {

				if (line[i] != lineB[i]) 
					uncommonLines[line]++;
			
			}
		
			foreach(k, v; uncommonLines) {
				if (v == 1) {
					return stripUncommon(k, lineB);
				}	
			}
		}		
	}
	return "NOT_FOUND";
}

string stripUncommon(string a, string b) {
	string o = "";
	foreach(i; 0 .. a.length) {
		if (a[i] == b[i]) o ~= a[i];
	}
	return o;
}
