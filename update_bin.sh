#!/bin/bash
# Date: 2014-01-13
# Purpose: update the xsd bin

# xsd is the programe name
sd=xsd

# dst_dir is the home directory of the programe
dst_dir=/data/server/xserver

# src_dir is the update files that you want to use.
src_dir=/data/update

update() {
        ps -ef | grep ${sd}
        mv ${dst_dir}/bin/$sd ${src_dir}/${sd}_bak.`date +%m%d`
        mv ${src_dir}/$sd ${dst_dir}/bin
        cd ${dst_dir}
        ./restart
        ps -ef | grep ${sd}
}

rollback() {
        ps -ef | grep $sd
        mv ${dst_dir}/bin/${sd} ${src_dir}
        mv ${src_dir}/${sd}_bak.`date +%m%d` ${dst_dir}/bin/${sd}
        cd ${dst_dir}
        ./restart
        ps -ef | grep ${sd}
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
