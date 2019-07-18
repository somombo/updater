
#!/bin/sh

CURRENT_DIR="$(dirname "$0")"

LOG_FILE="$CURRENT_DIR/updater_status.log"
VERSION=$(cat "$CURRENT_DIR/VERSION")

params=$@
if [[ $params ]]; then
	err_code=0

	if [[ " ${params[@]} " =~ " -l " ]] || [[ " ${params[@]} " =~ " --log " ]]; then
    echo
		cat $LOG_FILE
		echo
	else
		err_code=$(($err_code + 1))
	fi

	if [[ " ${params[@]} " =~ " -h " ]] || [[ " ${params[@]} " =~ " --help " ]]; then
    echo
    echo "  Example usage: "
		echo "    upd      # To run update"
		echo "    upd -v   # For current version. Or you can use \`upd --version\`"
		echo "    upd -h   # For help. Or you can use \`upd --help\`"
		echo
		echo
	else
		err_code=$(($err_code + 1))
	fi

	if [[ " ${params[@]} " =~ " -v " ]] || [[ " ${params[@]} " =~ " --version " ]]; then
		echo v$VERSION
	else
		err_code=$(($err_code + 1))
	fi

	if [ $err_code -eq 3 ]; then
    echo "  Error: Unrecognized parameter"
		"$CURRENT_DIR/upd" --help
		exit 2	
	fi

	exit 0

fi
