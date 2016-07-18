	#$linuxPuppetPath = "/opt/puppetlabs/bin:/usr/bin"
	#$linuxPrivateKey = "/home/justin/Dropbox/homepupkey.priv"
class jpupapply {
	#include localconfig

	if 'nux' in $kernel {
		notice ("This is a Linux machine")

		file { '/usr/local/bin/jpupapply':
#			source => 'puppet:///modules/jpupapply/jpupapply.sh',
			content => template('jpupapply/jpupapply.sh.erb'),
			mode => '0755',
		}

		# Ensure cron job is present to run jpupapply automatically every 10 mins 
		cron { 'run-jpupapply':
			ensure => 'present',
			user => 'root',
			command => '(date;/usr/local/bin/jpupapply) >/tmp/jpupapply.log 2>&1',
			minute => '*/10',
			hour => '*',
		}

	} elsif 'dows' in $kernel {
		notice ("This is a Windows machine")
		
	    file { 'c:/users/IEUser/jpupapply.cmd':
    			ensure => 'file',
      			mode   => '0660',
				source => 'puppet:///modules/jpupapply/jpupapply.cmd',
    		}

	    scheduled_task { 'jpupapply':
      		ensure    => present,
      		enabled   => true,
      		command   => 'C:/users/IEUser/jpupapply.cmd',
      		arguments => '',
      		trigger   => {
        		schedule   => daily,
        		start_time => '00:00',     
        		minutes_interval => '10',   # Repeat this task every 10 minutes
        		minutes_duration => '11',   
      			}
    		}	
	}
}
