module markov.util;
import markov.core;
import std.stdio;

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
