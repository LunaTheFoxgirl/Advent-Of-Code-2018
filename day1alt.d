#!rdmd
import std.stdio;

void main() {
    int result = mixin(import("input1.txt"));
    writeln(result);
}