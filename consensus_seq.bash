#!/bin/bash


#step-1 make a file to count how many times each residue is repeated in each of the column

grep -A 1 "@" Test100k.fastq | sed '/^@/ d' | sed '/^--/ d' | sed 's/./& /g' > output.txt
        #  ^
        #  |-> if any common letters are found in all the sequences of the fastq file after '@', user can include those letters

#step-2 Count each residue in each column

awk '
  {
    for (i = 1; i <= NF; i++) {
      l[$i]++;
      a[i, $i]++;
      if (NF > n) {n = NF};
    }
  }
  END{
    for (i = 1; i <= n; i++) {
      for (j in l) {
        if (a[i, j] > 0) {print i, j, a[i, j]};
      }
    }
  }
  ' output.txt | sort -k 3 -n -r | sort -k 1 -n -s > scores.txt


#step-3 prepare a consensus sequence from the obtained file from step-2

awk '!a[$1]++' scores.txt | awk '{print$2}' | tr '\n' '.' | sed 's/\.//g' > consensus.faa

