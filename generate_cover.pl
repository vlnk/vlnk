#!usr/bin/perl
use File::Copy;
use File::Slurp;
use Term::ANSIColor;

my %errors = (
    "lang" => colored(["red"], "Bad language.\n"),
    "command" => colored(["red"], "Bad command... sorry.\n"),
    "open" => colored(["red"], "The current dir cannot be opened.\n"),
    "read" => colored(["red"], "The specified file cannot be read.\n"),
    "exist" => colored(["red"], "The specified file still exists.\n"),
);

my %success = (
    "cover" => colored(["green"], "The cover was successfully created !\n"),
);

my %warning = (
    "process" => colored(["yellow"], "PROCESSING FILE "),
);

my @langs = ('en', 'fr');
my @opts = ();
my @args = ();

for ($i = 0; $i < ($#ARGV + 1); $i++) {
    if ($ARGV[$i] =~ /^\-|^\-\-/) {
        push(@opts, $ARGV[$i]);
    }
    else {
        push(@args, $ARGV[$i]);
    }
}

for my $opt (@opts) {
    if ($opt =~ /^\-h|^\-\-help/) {
        printHelp();
        exit 1;
    }
}

if (scalar(@args) == 2) {
    unless ($args[0] ~~ @langs) { die $errors{"lang"}; }
    process($args[0], $args[1]);
    exit 1;
}
else {
    printHelp();
    exit 1;
}

sub process {
    my $lang = $_[0];
    my $firm = $_[1];

    unless ($lang ~~ @langs) { die $errors{"lang"}; }
    copyBlankCover($lang, $firm);
    print $success{"cover"};
}

sub copyBlankCover {
    my $dir = join('/', '.', "contents", $_[0], "covers/");
    my $template = $dir . "blank0.tex";
    my $cover = $dir . $_[1] . ".tex";

    if (-e -f $cover) { die $errors{"exist"}; }
    copy($template, $cover);
}

sub printHelp {
    print colored(["yellow"], "default usage: generate_cover.pl [options] <language> <firm>", "\n");
    print colored(["blue"], "<language>");
    print " What language do you use ? [en/fr]\n";
    print colored(["blue"], "<firm>");
    print " Who are the adressee of the cover letter ?\n";
    print "options:\n";
    print colored(["blue"], "--help | -h");
    print " Print help.\n";
    exit 1;
}
