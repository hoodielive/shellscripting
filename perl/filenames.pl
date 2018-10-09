#!/usr/bin/perl 
use strict; 
use warnings; 

use Getopt::Std; 
use vars qw/$opt_n $opt_v $opt_e/;

if (not getopts("nve:")) {
  die("Bad Option..");
}

if (not defined($opt_e)) {
  die("Required option -e missing"); 
}

foreach my $file_name (@ARGV)
{

  # Compute the new name 
  my $new_name = $file_name; 
  
  # Perform the substitution
  eval "\$new_name =~ s$opt_e"; 

  # Make sure the names are different 

  if ($file_name ne $new_name)
  {
    # If a file already exists by that name compute a new name.
    if (-f $new_name)
    {
      my $ext = 0; 

      while (-f $new_name.".".$ext)
      {
        $ext++; 
      }
      $new_name = $new_name.".".$ext;
    }
    if ($opt_v) {
      print "$file_name -> $new_name\n";
  }
    if (not defined($opt_n)) {
      rename($file_name, $new_name); 
    }
  }
}
