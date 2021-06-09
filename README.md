# 下载完成后把三个文件放到/root/DSTserver里面就好了。
然后输入设置守护进程，每天每小时自动备份，备份超过24个，删除最新的一个。
```shell
$ crontab -e
0 * * * * /root/DSTserver/back_up.sh
* * */7 * * echo "">/root/DSTserver/bcak_up_log.txt
```
这样以后即使存档出现了问题也可以在bcak_up_log.txt进行查看。
然后每次启动游戏的时候直接==screen ./DSTserver.sh==就行了，他会自动更新。

==**注意:DSTserver.sh中更新字段代码一定不要加validate，他会清空dedicated_server_mods_setup.lua。这可能是导致你Mod无法使用的原因之一。**==
