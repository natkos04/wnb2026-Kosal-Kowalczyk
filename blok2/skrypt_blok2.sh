#!/bin/bash

awk -F',' 'NR>=6 && (NR-6)%2==0 {print ">" $1; print $2}' DArT_SNP.csv > probes.fa
# Z pliku źródłowego tworzy plik fasta,  gdzie każdy marker ma identytfikator w 1 kolumnie (to co po >), i sekwencja w 2 kolumnie (drugi wiersz w fasta) 
