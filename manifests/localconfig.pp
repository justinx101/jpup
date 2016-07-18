#=================================================================================
# LINUX VARIABLES (lnx)
#=================================================================================
#
# The following are used by a template in the creation of the jpupapply script.
# VCS = Version Control System. I've developed this for Git but hopefully it can
# be used with other systems without too much work.
#
#
# lnxUseJpupOnly	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$descLnxUseJpupOnly=
"# I prefer to keep jpup strictly as a delivery mechanism and keep the manifests\
\n# that do the actual work (e.g. installing packages etc.) in a separate repo.\
\n# However, if you want to do everything with your jpup repo set this to 1."
$lnxUseJpupOnly=0

# lnxPuppetPath		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$descLnxPuppetPath=	
"# When run from cron we may not be able to find puppet in the path. Add possible\
\n# paths to puppet here as per your environments."
$lnxPuppetPath= 	'"/opt/puppetlabs/bin:/usr/bin"'

# lnxPrivateKey		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$descLnxPrivateKey=	
"# Location of your ssh private key. You need to add your public key to your VCS\
\n# account. Don't keep your private key in a public repo."
$lnxPrivateKey= 	'"/home/justin/Dropbox/homepupkey.priv"'

# lnxPullCmd		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$descLnxPullCmd=	
"# The command to pull the latest version of the repo from your VCS"
$lnxPullCmd=		'"/usr/bin/git pull"'

# lnxJpupBaseDir	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$descLnxJpupBaseDir="# The root of your jpup repo."
$lnxJpupBaseDir=	'"/root/jpup"'

# lnxMyBaseDir		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$descLnxMyBaseDir= 
"# The root of the repo containing the manifests that do all your work!"
$lnxMyBaseDir=		'"/root/mypuprepo"'

#=================================================================================
# WINDOWS VARIABLES (win)
#=================================================================================
# placeholder

#=================================================================================
# UNIX VARIABLES (unx) - don't know yet if need to separate 'nix from linux
#=================================================================================
# placeholder
