#!/bin/bash
# Aoo Check that string is IP # Version 1.0.0.5
# Script Developed by Apivat Pattana-Anurak

### So the parameter passed to the script must fulfill the following four criteria:
# Contain exactly three dots.
# Contain exactly four parts, if broken down by dots.
# All four parts are numeric.
# All four parts are between 0 and 255.


# Checks that the parameter passed is an IP Address.
# Meant for user input validation.

function validate_IP() {
if [ `echo $1 | grep -o '\.' | wc -l` -ne 3 ]; then
        echo "Parameter '$1' does not look like an IP Address (does not contain 3 dots).";
        exit 1;
elif [ `echo $1 | tr '.' ' ' | wc -w` -ne 4 ]; then
        echo "Parameter '$1' does not look like an IP Address (does not contain 4 octets).";
        exit 1;
else
        for OCTET in `echo $1 | tr '.' ' '`; do
                if ! [[ $OCTET =~ ^[0-9]+$ ]]; then
                        echo "Parameter '$1' does not look like in IP Address (octet '$OCTET' is not numeric).";
                        exit 1;
                elif [[ $OCTET -lt 0 || $OCTET -gt 255 ]]; then
                        echo "Parameter '$1' does not look like in IP Address (octet '$OCTET' is not in range 0-255).";
                        exit 1;
                fi
        done
fi

echo "Parameter '$1' is a valid IP Address.";
return 0;
}

validate_IP $1;
