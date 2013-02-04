
use strict;
use Carp;
use Data::Dumper;
use Getopt::Long;
Getopt::Long::Configure("pass_through");

my $usage = <<End_of_Usage;

Usage: ar_login  [-h] [-s server_addr]

Authenticate with username and password, or switch account if already logged in.

End_of_Usage

my $help;
my $server;

my $rc = GetOptions("h|help" => \$help,
                    "s" => \$server);

($rc && !$help) or die $usage;

# my $target = $ENV{HOME}. "/kb/assembly";
# my $arast  = "ar_client/ar_client/ar_client.py";
# system "$target/$arast run @ARGV";

my $arast = 'arast';
$arast .= " -s $server" if $server;

system "$arast login @ARGV";
