# Git repository migration

Simple scripts to migrate git repositories from A to B.  
Script does not account for LFS, and will fail if the target max file size is exceeded.  
The script assumes you are already in a authenticated context for both the Source and Destination repository.  

## Usage

`.\migrate.ps1 https://user@bitbucket.org/workspace/repository.git https://github.com/user/discord-general-wrapper.git`

`.\batchMigrate.ps1 .\batchInputExample.txt`
