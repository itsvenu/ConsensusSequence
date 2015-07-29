#### ConsensusSequence

The easiest way to find a common ancestor sequence of a group of 
sequences is constructing the consensus profile of the set of sequences.
The bash script is helpful in finding the ancestor/consensus sequnce of a group of sequences.
Given a file with multi fasta sequences, it returns the consensus sequence by calculating 
the number of times each residue occurred in each position and preserving the highly occurred 
residue in the final/consensus sequence.

As default it accepts the Fastq file as input and users can also modify the script according to their needs. Other 
instructions are given in the script itself.
