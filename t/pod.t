# $Id: pod.t,v 1.2 2003/12/03 21:10:19 comdog Exp $

use Test::More;
eval "use Test::Pod 1.00";
plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;
all_pod_files_ok();

