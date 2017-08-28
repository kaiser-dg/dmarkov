module markovd.core;
import std.random : uniform;
/**
	This struct is the basis of this library.
	It represents the most basic part of the Markov chain.
	license: BSD 3-clause license
	authors: John Whitley, dogjaw2233@protonmail.com
	Date: August 27, 2017
	Version: 0
	Params:
		value = A value of type T. Self-explanatory.
		branches = An array holding pointers to other nodes. Will likely hold the same pointer multiple times.
*/
struct MarkovNode(T) {
  T value;
  MarkovNode*[] branches;
  ///Adds a node's pointer to this node's branch array.
  void addBranch(MarkovNode* node) {
    this.branches ~= node;
  }
  /++
  	Randomly returns the pointer to a seleted node from the branch list.
	The probability is admittably hackish, the function selects a random number between 0 and the array's length and returns that pointer from the array.
	To increase the chances of a node being chosen, add another copy of the pointer to the list.
  +/
  MarkovNode* nextBranch() {
    return this.branches[uniform(0, this.branches.length)];
  }
}
