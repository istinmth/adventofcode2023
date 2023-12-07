use strict;
use warnings;

sub eval {
    my ($line, $face) = @_;
    my ($hand, $bid) = split / /, $line;
    $hand =~ tr/TJQKA/$face/;
    my @hand_chars = split //, $hand;
    my $best = max(map {type($_, \@hand_chars)} @hand_chars);
    return ($best, $hand, $bid);
}

sub type {
    my ($char, $hand_chars) = @_;
    my $count = grep {$_ eq $char} @$hand_chars;
    return $count;
}

sub max {
    my $max = shift;
    $_ > $max and $max = $_ for @_;
    return $max;
}

for my $face ('ABCDE', 'A0CDE') {
    open my $file, '<', 'card.txt';
    my @lines = <$file>;
    my @evals = map {eval($_, $face)} @lines;
    @evals = sort {$a->[0] <=> $b->[0]} @evals;
    my $sum = 0;
    for my $i (0..$#evals) {
        $sum += ($i+1) * $evals[$i]->[2];
    }
    print "$sum\n";
    close $file;
}