#!/usr/bin/env bash

PHP_ARCHIVE="php-$PHP_VERSION.tar.bz2"
PHP_SRC_DIR="php-$PHP_VERSION"
PHP_URL="${PHP_URL:-http://us2.php.net/get/$PHP_ARCHIVE/from/ar2.php.net/mirror}"

#
# Configures PHP
#
function configure_php()
{
	log "Configuring php $PHP_VERSION ..."

	if [[ "$PACKAGE_MANAGER" == "brew" ]]; then
		error 'configuring php on mac is not tested'
		exit 1
	else
		./configure --prefix="$INSTALL_DIR" "${CONFIGURE_OPTS[@]}"
	fi
}

#
# Compiles PHP
#
function compile_php()
{
	log "Compiling php $PHP_VERSION ..."
	make
}

#
# Installs PHP into $INSTALL_DIR
#
function install_php()
{
	log "Installing php $PHP_VERSION ..."
	make install
}

function post_install()
{
    return;
}
