#!/bin/bash
set -e

# The install.sh script is the installation entrypoint for any features in this repository. 
#
# The tooling will parse the features.json + user devcontainer, and write 
# any build-time arguments into a feature-set scoped "features.env"
# The author is free to source that file and use it however they would like.
set -a
. ./features.env
set +a


if [ ! -z ${_BUILD_ARG_HELLOWORLD} ]; then
    echo "Activating feature 'helloworld'"

    # Build args are exposed to this entire feature set following the pattern:  _BUILD_ARG_<FEATURE ID>_<OPTION NAME>
    GREETING=${_BUILD_ARG_HELLOWORLD_GREETING:-undefined}

    tee /usr/hello.sh > /dev/null \
    << EOF
    #!/bin/bash
    RED='\033[0;91m'
    NC='\033[0m' # No Color
    echo -e "\${RED}${GREETING}, \$(whoami)!"
    echo -e "\${NC}"
EOF

    chmod +x /usr/hello.sh
    sudo cat '/usr/hello.sh' > /usr/local/bin/hello
    sudo chmod +x /usr/local/bin/hello
fi


if [ ! -z ${_BUILD_ARG_COLOR} ]; then
    echo "Activating feature 'color'"

    # Build args are exposed to this entire feature set following the pattern:  _BUILD_ARG_<FEATURE ID>_<OPTION NAME>

    if [ "${_BUILD_ARG_COLOR_FAVORITE}" == "red" ]; then
        FAVORITE='\\033[0\;91m'
    fi

    if [ "${_BUILD_ARG_COLOR_FAVORITE}" == "green" ]; then
        FAVORITE='\\033[0\;32m'
    fi

    if [ "${_BUILD_ARG_COLOR_FAVORITE}" == "gold" ]; then
        FAVORITE='\\033[0\;33m'
    fi

    tee /usr/color.sh > /dev/null \
    << EOF
    #!/bin/bash
    NC='\033[0m' # No Color

    FAVORITE=${FAVORITE}
    echo -e "\${FAVORITE} This is my favorite color! \${NC}"
EOF

    chmod +x /usr/color.sh
    sudo cat '/usr/color.sh' > /usr/local/bin/color
    sudo chmod +x /usr/local/bin/color

fi