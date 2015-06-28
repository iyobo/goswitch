# goswitch
Easy GOPATH switching

A little script to help you manage your various Golang Projects and their individual GoPaths.

## How to Run
* Place this script in the root directory of all your various GoPaths/projects (not your sub-projects in 'src', but your actual gopath root directory).
* Run it with "source goswitch.sh" or ". goswitch.sh" to activate this folder as your new gopath.

The script will also add the bin folder of your project into your system path variable so you can run all your bins as you would any command line command e.g. Just use 'beego new' as opposed to '.../bin/beego new' etc.
The script will do it's best to avoid creating duplicate folder paths in your PATH variable.

# WARNING: This script will modify your PATH variable and likely other environmental variables.
# By using it, you acknowledge that I cannot/will not be held liable for any negative effect that might have on your system.
