node default {

	include jpupapply

	if 'nux' in $kernel { 

		file { '/tmp/jpup_hello':
			content => "jpup says Hello Linux World!\n",
		}
	} 
	elsif 'dows' in $kernel {
        file { 'c:\temp\jpup_hello':
            content => "jpup says Hello Windows World!\n",
		}
	}
}
