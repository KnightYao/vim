#!/bin/sh

## The folder which holds the vim configure file
VIM_GIT_HOME_DIR=$HOME/vim
PATCHES_DIR=$VIM_GIT_HOME_DIR/patches

#
# if directory $1 exist, then go on
#
function if_dir_exist_then_go_on {
    if [ ! -d $! ]; then
        echo -e "Directory \e[31m$1\e[0m does not exist."
        exit
    fi
}

#
# Check the root dir of vim configuration project
#  whether in the $VIM_GIT_HOME_DIR foler.
#
function check_project_root_dir {
    if [ ! -d $VIM_GIT_HOME_DIR ]; then
        echo -e "Directory \e[31m$VIM_GIT_HOME_DIR\e[0m does not exist."
        echo -e "Please set \e[32m\$VIM_GIT_HOME_DIR\e[0m," \
            "in \e[32m/project/root/folder/vim/patches/patch.sh\e[0m," \
            "to the folder which holds the vim configuration project" \
            "(\e[32;4mhttps://github.com/waldonchen/vim\e[0m)."
        exit
    fi
}

check_project_root_dir

#
# Patches vim plugin xptemplate.
#
XPTEMPLATE_DIR=$VIM_GIT_HOME_DIR/.vim/bundle/xptemplate/
if_dir_exist_then_go_on $XPTEMPLATE_DIR
(cd $XPTEMPLATE_DIR \
    && patch -p1 < $PATCHES_DIR/xptemplate_personal_xpt_conf.patch)
