
#!/bin/sh



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
cat << 'EOF'

  Example usage: 
    upd      # To run update
    upd -v   # For current version. Or you can use \`upd --version\`
    upd -h   # For help. Or you can use \`upd --help\`

  Error codes:
    02  # Could not chocolatey upgrade nodejs 
    03  # Could not upgrade npm 
    05  # Could not update global npm packages
    07  # Could not upgrade git
    11  # Could not chocolatey upgrade miniconda3
    13  # Could not activate conda
    17  # Could not conda update conda package
    19  # Could not conda update all packages
    23  # Could not conda install console and powershell shortcuts
    29  # Could not deactivate conda
    31  # Could not chocolatey upgrade all packages
    37  # Could not update wsl kernel
    41  # Could not apt update and apt upgrade in wsl
    43  # Could not update Rust toolchain
    47  # Could not upgrade Deno


EOF
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
		exit 1	
	fi

	exit 0

fi
