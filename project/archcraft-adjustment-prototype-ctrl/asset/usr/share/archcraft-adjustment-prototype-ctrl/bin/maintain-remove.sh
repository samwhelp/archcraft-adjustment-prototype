#!/usr/bin/env bash


################################################################################
### Head: Init
##

THE_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
THE_BASE_DIR_PATH="$THE_BASE_DIR_PATH/../ext"
source "$THE_BASE_DIR_PATH/init.sh"

##
### Tail: Init
################################################################################


################################################################################
### Head: Model / Remove
##

mod_remove () {

	util_error_echo "Demo"

	return 0

	mod_remove_demo


}

mod_remove_demo () {

	util_error_echo "rm -f  $HOME/.config/demo/demo.conf"
	rm -f "$HOME/.config/demo/demo.conf"

	util_error_echo "rm -rf  $HOME/.config/demo"
	rm -rf "$HOME/.config/demo"



}





mod_remove_check () {
	util_error_echo
	is_command_exist 'tree' && tree "$HOME/.config/herbstluftwm"
}

##
### Tail: Model / Remove
################################################################################


################################################################################
### Head: Main
##

__main__ () {
	mod_remove "$@"
}

__main__ "$@"

##
### Tail: Main
################################################################################
