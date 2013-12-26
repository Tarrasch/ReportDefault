#ReportDefault

The purpose of this project is to simplify common tasks in LaTeX, such as writing reports, presentations etc. By using the version control system GIT to check out this project as a submodule inside an already existing project, headers and 
package lists can simply be included and cross-project updated. The "setup.sh" script contained in this directory will set up a default environment for different scenarios for this project. By keeping inclusion files inside the reportdefault directory, this can be synchronized between all projects using the git version control system.

##Installation (.bashrc)
I am using the following in my .bashrc file (replace the adress of the repository to the actual adress of the repository you are using):

  reportdefault="git@bitbucket.org:riklund/reportdefault.git"
  alias repsub='A=$(git rev-parse --show-toplevel); B=$(pwd); \
  C=${B##$A/}/reportdefault; (cd $A && git submodule add $reportdefault $C)'
  function rinit() { reportdefault/./setup.sh $@;}

Some functions might not be working, I am maintaining this repository on a "on demand" basis, which basically means that if I find myself in need of a template, I create/fix it. 

Running repsub will check out the reportdefault directory as a git submodule, and rinit followed by the type of report will set up the environment accordingly.

So, you are NOT supposed to run the makefile in this directory, it will be called from a parent directory with a report inside. There should be no need to copy out files from the templates, etc since this is done automatically by the setup script. 

This project is created and maintained by Rikard Lundmark (www.rikardlundmark.com).