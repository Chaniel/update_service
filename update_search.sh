#!/bin/bash
#Purpose: to update your sercie
#Date:2014-04-03


# data_dir_name is the data dir name that you want to update
data_dir_name=data

# src is the new data's dir, wait to be use.
src=/data/update/0403

# dst is destination dir of the data's home
dst=/data/search/

# svr_home is the home dir of the service
svr_home=/data/search

# bin_name is the name of bin file(the service)
bin_name=search

# start is to start the service,you must have a start script for start the service 

located at the $svr_home
start=./start

# stop is to stop the service,you must have a stop script for stop the service located 

at the $svr_home
stop=./stop


update() {
        ps -ef | grep $bin_name
        cd $svr_home
        $stop
#backup
        mv $dst/$data_dir_name  $src/${data_dir_name}_bak
#Replace
        mv $src/${data_dir_name} $dst/
        cd $svr_home
        $start
        ps -ef | grep $bin_name
}


rollback() {
        ps -ef | grep $bin_name
        cd $svr_home
        $stop
        mv $dst/${data_dir_name} $src
        mv $src/${data_dir_name}_bak/ $dst/${data_dir_name}
        cd $svr_home
        $start
        ps -ef | grep $bin_name
}

case "$1" in
    update)
        $1
        ;;
    rollback)
        $1
        ;;
    *)
        echo $"Usage: $0 {update|rollback}"
        exit 2
esac
