# $Id: Makefile.PL,v 1.12 2004/09/25 23:36:20 comdog Exp $
use ExtUtils::MakeMaker;

eval "use Test::Manifest";

unless( $@ )
	{
	*ExtUtils::MM_Any::test_via_harness = sub
	{
    my($self, $perl, $tests) = @_;

    return qq|\t$perl "-MTest::Manifest" | .
           qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
           qq|'\$(INST_ARCHLIB)')"\n|;
	}
	}

WriteMakefile(
    'NAME'		    => 'webreaper',
	'VERSION'       => '0.31',
	
	'EXE_FILES' =>  [ 'webreaper' ],
	    	
	'PREREQ_PM' => {
		'HTML::SimpleLinkExtor' => '0',
		},

	'MAN1PODS' => {
		'webreaper' => '$(INST_MAN1DIR)/webreaper.1',
		},
		
	clean => { FILES => '*.bak webreaper-*' },
	);
