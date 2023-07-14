Note the UW-Madison project is a git submodule. From https://git-scm.com/book/en/v2/Git-Tools-Submodules:

"
When you clone such a project, by default you get the directories that contain submodules, but none of the files within them yet. The DbConnector directory is there, but empty. You must run two commands: git submodule init to initialize your local configuration file, and git submodule update to fetch all the data from that project and check out the appropriate commit listed in your superproject:
"

