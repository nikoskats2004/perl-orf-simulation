# Calculation and Analysis of ORF Lengths in DNA Sequences

This project contains a Perl script that generates random DNA sequences and identifies Open Reading Frames (ORFs). The purpose is to statistically analyze the length of ORFs across different AT/GC content scenarios.

## Simulation Scenarios & Features
The script simulates 1,000 sequences, each 1,000,000 bases long. The DNA generation is based on three probability distributions for the A, C, G, and T bases:
* Equal Bases: A=25%, C=25%, G=25%, T=25%.
* High GC (70%): A=15%, C=35%, G=35%, T=15%.
* High AT (70%): A=35%, C=15%, G=15%, T=35%.

The system scans each sequence across all 3 reading frames to locate the start codon (ATG) and the stop codons (TAA, TAG, TGA), recording their lengths.

## Key Findings
Based on the simulation results, the AT/GC content directly impacts the length of ORFs:
* High AT Scenario: ORFs are significantly smaller, with a mean length of about 41 bases. Stop codons (TAA, TAG, TGA) consist almost entirely of Adenine and Thymine, so an increased presence of these bases (70%) makes early termination highly probable. Over 30 million ORFs were found to be under 100 bases long.
* Equal Bases Scenario: The mean length sits at an intermediate level, approximately 67 bases.
* High GC Scenario: The mean length is the highest, reaching roughly 160 bases. Because A and T bases are scarce in this scenario (30% combined), stop codons form much less frequently. Consequently, ORFs grow significantly longer before encountering a termination signal. The statistics show a massive variance (24146.79), with several ORFs exceeding 1000 bases.

## Execution
To run the code, Perl must be installed on your system. Run the following command in your terminal:

```bash
perl orf_simulation.pl
