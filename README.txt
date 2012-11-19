PROJECT NAME: reportdefault

PURPOSE: Synchronizing and simplifying common tasks in LaTeX, such as writing reports and presentations. By using the subversion system git to check out this project as a submodule inside an already existing project, headers and package lists can simply be included. The "setup.sh" script contained in this directory will set up a default environment for different scenarios for this project. By keeping inclusion files inside the reportdefault directory, this can be synchronized between all projects using the git version control system.

Adding the following commands to the .bashrc file will simplify the process even further:

reportdefault="git@bitbucket.org:riklund/reportdefault.git"
alias repsub='A=$(git rev-parse --show-toplevel); B=$(pwd); C=${B##$A/}/reportdefault; (cd $A && git submodule add $reportdefault $C)'
function rinit() { reportdefault/./setup.sh $@;}

Running repsub will check out the reportdefault directory, and rinit followed by the type of report will set up the environment accordingly.

AUTHOR: Rikard Lundmark
riklund@student.chalmers.se
rikard.lundmark@mensa.se


DEFAULT GIT LOCATION (SSH): git@bitbucket.org:riklund/reportdefault.git
