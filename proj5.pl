#!/usr/bin/perl -w


use strict; #Case sensitivity, it will give you a warning/ERROR CHECKING

# See if there are two arguments to the command.  Note that
# $#ARGV is the subscript of the last argument.  Since subscripts
# begin with 0, it should be one less than the number expected.

if ($#ARGV != 0) {
        print "Usage:  proj5 \n";
            die "must specify a date MM/DD/YYYY";
            exit;
}
my $date = $ARGV[0]; # grabs parameter from cmnd line

#If the directory exists, remove its contents. Else create the directory.
if(-d "Emails"){
    print "Emails directory already exists...Removing contents","\n";
    system "rm -f Emails/*";
} else {
    mkdir "Emails" or die "Error: Unable to create directory";
}


# Reads the file line by line
# Used regex to store the items in a variable.
open(INFILE,"p5Customer.txt")  #Open File
    or die "could not open INFILE: $!\n";
    while ( my $line = <INFILE> ){

    
        my ($email) = $line =~ /([a-z]*@[a-z]*\.[a-z]{3}),/;
        my ($name) = $line =~ /,([A-Z][a-z]*\.?\s[A-Z]*\s?[a-z]*[A-Z]?[a-z]*),/;
        my ($last) = $line =~ /\s([A-Z][a-z]*),/;
        my ($title) = $line =~ /,([A-Z][a-z]*\.?),/;
        my ($paid) = $line =~ /,([0-9]*\.?[0-9]*),/;
        my ($owe) = $line =~ /,(\d*)\s/;

        if ($owe > $paid){
            
        my $out = "${email}"; # Set emails to an out file.
    
    open(TEMP,"template.txt") # Open file you will be subsituting
    or die "could not open TEMP: $!\n";


    open(OUTFILE,">","Emails/$out") # Open output file
    or die "$out cannot be created: $!\n";
    while ( my $tline = <TEMP> ) { # While in your template.txt file
        chomp($tline);

        $tline =~ s/FULLNAME/$name/;
        $tline =~ s/EMAIL/$email/;
        $tline =~ s/TITLE/$title/;
        $tline =~ s/NAME/$last/;
        $tline =~ s/AMOUNT/$owe/;
        $tline =~ s/DATE/$date/;

        print OUTFILE $tline,"\n";
    }
        close(TEMP); # Close template.txt
        close(OUTFILE); # Close output file
    }
    }

    close(INFILE); # Close p5Customer.txt


