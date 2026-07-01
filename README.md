# Calculation and Analysis of ORF Lengths in DNA Sequences

This project contains a Perl script that generates random DNA sequences and identifies Open Reading Frames (ORFs)[cite: 4, 5]. The purpose is to statistically analyze the length of ORFs across different AT/GC content scenarios[cite: 4].

## Simulation Scenarios & Features
The script simulates 1,000 sequences, each 1,000,000 bases long[cite: 5]. The DNA generation is based on three probability distributions for the A, C, G, and T bases[cite: 5]:
* Equal Bases: A=25%, C=25%, G=25%, T=25%[cite: 4, 5].
* High GC (70%): A=15%, C=35%, G=35%, T=15%[cite: 4, 5].
* High AT (70%): A=35%, C=15%, G=15%, T=35%[cite: 4, 5].

The system scans each sequence across all 3 reading frames to locate the start codon (ATG) and the stop codons (TAA, TAG, TGA), recording their lengths[cite: 5].

## Key Findings
Based on the simulation results, the AT/GC content directly impacts the length of ORFs[cite: 4]:

* High AT Scenario: ORFs are significantly smaller, with a mean length of about 41 bases[cite: 4]. Stop codons (TAA, TAG, TGA) consist almost entirely of Adenine and Thymine, so an increased presence of these bases (70%) makes early termination highly probable[cite: 4]. Over 30 million ORFs were found to be under 100 bases long[cite: 4].
* Equal Bases Scenario: The mean length sits at an intermediate level, approximately 67 bases[cite: 4].
* High GC Scenario: The mean length is the highest, reaching roughly 160 bases[cite: 4]. Because A and T bases are scarce in this scenario (30% combined), stop codons form much less frequently[cite: 4]. Consequently, ORFs grow significantly longer before encountering a termination signal[cite: 4]. The statistics show a massive variance (24146.79), with several ORFs exceeding 1000 bases[cite: 4].

## Execution
To run the code, Perl must be installed on your system. Run the following command in your terminal:

```bash
perl orf_simulation.pl
