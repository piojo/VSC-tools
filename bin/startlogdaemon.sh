#!/bin/bash
##
# Copyright 2011-2012 Jens Timmerman
#
# This file is part of VSC-tools,
# originally created by the HPC team of Ghent University (http://ugent.be/hpc/en),
# with support of Ghent University (http://ugent.be/hpc),
# the Flemish Supercomputer Centre (VSC) (https://vscentrum.be/nl/en),
# the Hercules foundation (http://www.herculesstichting.be/in_English)
# and the Department of Economy, Science and Innovation (EWI) (http://www.ewi-vlaanderen.be/en).
#
# http://github.com/hpcugent/VSC-tools
#
# VSC-tools is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation v2.
#
# VSC-tools is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with VSC-tools. If not, see <http://www.gnu.org/licenses/>.
##
D="['$0',"
for i in $@; do
 D="$D'$i',";
done;
D="$D]"

#print help if asked
if [[ "$D" == *-h* ]]
then
    python -c "import logdaemon; logdaemon.main($D)"
#else: start the daemon and set the environment
else
    for i in `python -c "import logdaemon; logdaemon.main($D)"`; do export $i; echo $i; done;
fi
# now use mpi to get these environment variables to the clients.
