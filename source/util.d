module markov.util;
import markov.core;
import std.stdio;
/**
   This function steps through a markov chain set and returns the selected values in an array.
   license: BSD 3-clause license
   authors: John Whitley, dogjaw2233@protonmail.com
   Date: August 27, 2017
   Version: 0
   Params:
     start = The starting node.
     iterator = Amount of times to step through.
*/
auto stepChain(T)(MarkovNode!T *start, long iterator) {
  T[] rarr;
  int i;
  MarkovNode!T *curnode = start;
  for (i = 1; i < iterator; i++) {
    rarr ~= curnode.value;
    curnode = curnode.nextBranch;
  }
  return rarr;
}
