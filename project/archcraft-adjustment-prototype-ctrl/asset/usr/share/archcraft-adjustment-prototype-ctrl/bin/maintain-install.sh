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
### Head: Model / Install
##

mod_install () {

	util_error_echo "Demo"

	return 0

	##mod_install_check


}


mod_install_demo () {

	util_error_echo "install -Dm755 $THE_PLAN_DIR_PATH/demo $HOME/.config/demo"
	install -Dm755 "$THE_PLAN_DIR_PATH/demo" "$HOME/.config/demo"


}



mod_install_check () {
	util_error_echo
	is_command_exist 'tree' && tree "$HOME/.config/demo"
}


##
### Tail: Model / Install
################################################################################


################################################################################
### Head: Main
##

__main__ () {
	mod_install "$@"
}

__main__ "$@"

##
### Tail: Main
################################################################################
