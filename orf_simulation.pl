#!/usr/bin/perl
use strict;
use warnings;

my $num_sequences = 1000;
my $seq_length = 1000000;

my %scenarios = ( 
         "1. Isopithanes Baseis (A=25%, C=25%, G=25%, T=25%)" => [0.25, 0.50, 0.75, 1.00],
         "2. Ypsilo GC (A=15%, C=35%, G=35%, T=15%)" => [0.15, 0.50, 0.85, 1.00],
         "3. Ypsilo AT (A=35%, C=15%, G=15%, T=35%)" => [0.35, 0.50, 0.65, 1.00] );

foreach my $scenario (sort keys %scenarios){
           print "\n=== Ektelesi: $scenario ===\n";
           my $probs = $scenarios{$scenario};
           my @orf_lengths;

        for(my $i = 1; $i <= $num_sequences; $i++){
               my $sequence = "";
             #kataskevi tis tixaias akolouthias
               for(my $j = 0; $j < $seq_length; $j++){
                  my $r = rand();
                  if ($r < $probs->[0]) { $sequence .= 'A';}
                  elsif ($r < $probs->[1]) { $sequence .= 'C';}
                  elsif ($r < $probs->[2]) { $sequence .= 'G';}
                  else                    { $sequence .= 'T';}
                 }      
             #Evresi ORFs kai sta 3 reading frames 
               for my $frame (0 .. 2) {
                     my $sub_seq = substr($sequence, $frame);
                     while ($sub_seq =~ /(ATG(?:...)*?(?:TAA|TAG|TGA))/g){
                          push @orf_lengths, length($1); }}

               if($i % 100 == 0){
                  print "Oloklirothikan $i / $num_sequences akolouthies...\n"; }}
 
               my $total_orfs = scalar @orf_lengths;
               if($total_orfs == 0) {
                 print "Den Vrethikan ORFS. \n";
                 next; }

              #Ypologismos mesis timis 
              my $sum = 0;
              $sum += $_ for @orf_lengths;
              my $mean = $sum / $total_orfs;
            
             #Ypologismos Diasporas 
             my $sq_diff_sum = 0;
             $sq_diff_sum += (($_ - $mean) ** 2) for @orf_lengths;
             my $variance = $sq_diff_sum / $total_orfs;

             print "\n---Apotelesmata ---\n";
             print "Synolika ORFs: $total_orfs\n";
             printf("Mesi timi mikous: %.2f\n", $mean);
             printf("Diaspora: %.2f\n\n", $variance);

             #Istogramma Syxnotiton
             print "Istogramma Syxnotiton: \n";
             my %bins;
             $bins{ int($_/100) * 100 }++ for @orf_lengths;

             foreach my $bin (sort { $a <=> $b } keys %bins) {
                  printf("%4d - %-4d : %d\n", $bin, $bin + 99, $bins{$bin});
                  last if $bin >= 1000; } }  






               
           

                         
