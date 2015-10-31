Bitbox meta-project
===================

This is a repo using gws that helps downloading and compiling all existing projects for the bitbox.

How to use
----------

 * Clone the repo
 * make update (or gws update) to get the sources of everything
 * If you never built bitbox things, make haikudeps (for Haiku) to install all dependencies (help writing debian/ubuntu/... rules to do the same welcome).
 * make dist (or just make) to build everything in the "out" folder
 * enjoy!

How it works
------------

 * GWS is a git project manager, it allows to checkout multiple repos and easily keep them up to date.
 * The makefile uses a fairly simple bash loop to enter all directories and run "make" inside each. This is rather fragile and needs improvement.
 * Currently the makefile continues building when a project fails. This makes the build log a bit difficult to read. A status report is printed at the end.
