#!/usr/bin/env bash


################################################################################
### Head: Init
##

THE_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
THE_BASE_DIR_PATH="$THE_BASE_DIR_PATH/../ext"
source "$THE_BASE_DIR_PATH/init.sh"
#source "$THE_SYS_EXT_DIR_PATH/init.sh"

##
### Tail: Init
################################################################################


################################################################################
### Head: Init / Cmd
##

cmd_var_init () {

	THE_CMD_VERSION='0.1'

	THE_CMD_DIR_PATH="$THE_BIN_DIR_PATH"

	if [ "none$THE_CMD_FILE_NAME" = 'none' ]; then
		THE_CMD_FILE_NAME="demo.sh"
	fi

	THE_CMD_FILE_PATH="$THE_CMD_DIR_PATH/$THE_CMD_FILE_NAME"

}

##
### Tail: Init / Cmd
################################################################################


################################################################################
### Head: Model / fzf
##

mod_fzf () {
	util_error_echo "fzf"
}


##
### Tail: Model / fzf
################################################################################


################################################################################
### Head: SubCmd / fzf
##

sub_run_fzf () {
	mod_fzf "$@"
}

##
### Tail: SubCmd / fzf
################################################################################


################################################################################
### Head: Model / list
##

mod_list () {
	util_error_echo "list"
}


##
### Tail: Model / list
################################################################################


################################################################################
### Head: SubCmd / list
##

sub_run_list () {
	mod_list "$@"
}

##
### Tail: SubCmd / list
################################################################################


################################################################################
### Head: Model / package_install
##

mod_package_install () {
	util_error_echo "package_install"
	sys_package_install
}


##
### Tail: Model / package_install
################################################################################


################################################################################
### Head: SubCmd / package_install
##

sub_run_package_install () {
	mod_package_install "$@"
}

##
### Tail: SubCmd / package_install
################################################################################




################################################################################
### Head: Model / config_install
##

mod_config_install () {
	util_error_echo "config_install"
}


##
### Tail: Model / config_install
################################################################################


################################################################################
### Head: SubCmd / config_install
##

sub_run_config_install () {
	mod_config_install "$@"
}

##
### Tail: SubCmd / config_install
################################################################################


################################################################################
### Head: Model / asset_install
##

mod_asset_install () {
	util_error_echo "asset_install"
}


##
### Tail: Model / asset_install
################################################################################


################################################################################
### Head: SubCmd / asset_install
##

sub_run_asset_install () {
	mod_asset_install "$@"
}

##
### Tail: SubCmd / asset_install
################################################################################


################################################################################
### Head: SubCmd / self_actions
##

sub_run_self_actions () {
	util_self_actions "$@"
}

##
### Tail: SubCmd / self_actions
################################################################################


################################################################################
### Head: SubCmd / help
##

sub_run_help () {
	main_usage "$@"
}

##
### Tail: SubCmd / help
################################################################################


################################################################################
### Head: Util / SubCmd
##

sub_cmd_find_function_name () {
	echo "sub_run_$1"
}

##
### Tail: Util / SubCmd
################################################################################


################################################################################
### Head: Main
##

main_usage () {
	##local cmd_name="$0"
	local cmd_name="demo.sh"

cat << EOF
Usage:
	$ $cmd_name [action]

Example:

	## help
		$ $cmd_name
		$ $cmd_name help

	## profile

		$ $cmd_name fzf

		$ $cmd_name list

	## install

		$ $cmd_name package_install

		$ $cmd_name config_install

		$ $cmd_name assset_install

Debug:
	$ export DEBUG_ADJUSTMENT_PROTOTYPE_CTRL=true

EOF

}

main_check_args_size () {
	if [ $1 -le 0 ]; then
		shift
		main_run_default_sub_cmd "$@"
		exit 1
	fi
}

main_run_default_sub_cmd () {
	main_usage "$@"
}

main_run_sub_cmd () {

	local sub_cmd="$1"

	shift

	local function_name=$(sub_cmd_find_function_name "$sub_cmd")

	## if ! command -v $function_name > /dev/null; then
	if ! type -p $function_name > /dev/null; then
		util_debug_echo "[Debug] sub_cmd_function_not_exist: sub_cmd=$sub_cmd; function_name=$function_name"

		echo

		main_run_default_sub_cmd "$@"

		return 1

	fi

	"$function_name" "$@" ## run sub cmd function


}

## Start
cmd_var_init "$@"

main_check_args_size $# "$@"

main_run_sub_cmd "$@"

##
### Tail: Main
################################################################################
