# jpup
A mechanism for masterless Puppet control of heterogeneous environments
driven from a cloned central repository (e.g. GitHub).

Based on an approach described by John Arundel in the book Puppet 3 Cookbook.

Currently heterogeneous means 'flavours of Linux' but it's intended that all
other operating systems supported by Puppet are eventually covered.

## Why use jpup?
jpup will be useful if you want to use Puppet to help configure the computers
in your environment but don't want to use a Puppet Master (maybe you just don't
want to keep a machine powered on all the time). 

It's probably most useful for the home user who has multiple computers 
(physical or virtual) and other small environments (probably where the machine
count is in tens rather than hundreds or thousands).

## Overview
jpup does a 'puppet apply' on manifests held locally rather than going off to
a Puppet Master. Those manifests are held in a Version Control System
repository (e.g. Git) and are updated from the master repository each time jpup 
runs. 

jpup runs automatically according to the schedule set up (e.g. in Linux
a cron job is created to run jpup every 10 minutes).

## Example Scenario
You are using vi on your laptop in your lounge and spend a lot of time getting 
it configured just how you like it, creating a masterpiece .vimrc file.
You want to make sure you have this configuration on the computer in your home
office, the old laptop you keep in the garage and the Raspbery Pi you fire up
occasionally.  Of course you can put the file on a usb stick, or maybe you have 
Dropbox so you can put the file there and remember to copy it over next time 
you power up those machines.

But... you have jpup installed on all your computers!  So you copy the file to
your repo on the laptop and update your manifests and commit it to your master 
repository then forget about it.  Next time you power up those machines jpup will 
automatically download your repository updates and apply the new .vimrc without
you having to do anything else.

That's a very simple example and you may not think it's worth the trouble of using
Puppet/jpup just for one file.  But of course it won't be just one file - there
will be others and maybe you want to make sure Firefox is installed or you want
to make sure telnet isn't running...

Remember: your configuration is held in your central repo, so when you re-install
the OS on your laptop or buy a new computer you don't have to go digging around
for all those config files etc. Just install Puppet and jpup and off you go.

## Process 
1.  Download or clone this jpup repo
2.  Create your own repo in your Version Control System of choice (only tested 
    with GitHub so far)
3.  Decide if you're going to put all your manifests in jpup itself OR have
    a separate repo and keep jpup purely as the delivery mechanism (the latter
    is my preference)
4.  Configure jpup for your environment by editing:
    **/jpup/manifests/localconfig.pp**
5.  Set up the scheduling for the jpupapply script by running:
    **/jpup/linuxManualRun** (other OS's to follow hopefully).
6.  Now there will be a cron job (check with crontab -l) setup to run 
    /usr/local/bin/jpupapply which will update your local repo(s) automatically
    before running a puppet apply.

## Prerequisites
Each machine requires Puppet and Git (or whatever VCS you are using)

