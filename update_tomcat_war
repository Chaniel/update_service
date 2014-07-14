#!/bin/bash
# Date: 2014-07-14
# Purpose: this script is update for tomcat war ball.
# update the dis server, dis is war ball.

# sd is the programe name
sd=dis.war

# dst_dir is the home directory of the programe
dst_dir=/data/tomcat-7.0.37/

# src_dir is the update files that you want to use.
src_dir=/data/update

update() {
        mv ${dst_dir}/webapps/$sd ${src_dir}/${sd}_bak.`date +%m%d`
        mv ${src_dir}/$sd ${dst_dir}/webapps
        rm ${dst_dir}/webapps/dis -rf
        cd ${dst_dir}
        bin/catalina.sh stop
        sleep 5
        bin/catalina.sh start

}

rollback() {
        mv ${dst_dir}/webapps/${sd} ${src_dir}
        mv ${src_dir}/${sd}_bak.`date +%m%d` ${dst_dir}/webapps/${sd}
        rm ${dst_dir}/webapps/dis -rf
        cd ${dst_dir}
        bin/catalina.sh stop
        sleep 5
        bin/catalina.sh start
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
