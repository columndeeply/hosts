#!/usr/bin/env sh
# awk -F'#-#' '{print $2}''
mkdir -p down

links="https://raw.githubusercontent.com/4skinSkywalker/Anti-Porn-HOSTS-File/master/HOSTS.txt
ftp://ftp.ut-capitole.fr/pub/reseau/cache/squidguard_contrib/adult.tar.gz
https://raw.githubusercontent.com/Bon-Appetit/porn-domains/master/block.txt
https://raw.githubusercontent.com/RPiList/specials/master/Blocklisten/pornblock1#-#s/||//;s/\^//
https://raw.githubusercontent.com/RPiList/specials/master/Blocklisten/pornblock2#-#s/||//;s/\^//
https://raw.githubusercontent.com/RPiList/specials/master/Blocklisten/pornblock3#-#s/||//;s/\^//
https://raw.githubusercontent.com/RPiList/specials/master/Blocklisten/pornblock4#-#s/||//;s/\^//
https://raw.githubusercontent.com/RPiList/specials/master/Blocklisten/pornblock5#-#s/||//;s/\^//
https://raw.githubusercontent.com/RPiList/specials/master/Blocklisten/pornblock6#-#s/||//;s/\^//
https://raw.githubusercontent.com/Sinfonietta/hostfiles/master/pornography-hosts
https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts#-#0,/^# End yoyo/d; /^#/d; s/ #.*//g; /^$/d
https://raw.githubusercontent.com/blocklistproject/Lists/master/porn.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/0.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/1.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/2.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/3.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/4.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/5.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/6.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/7.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/8.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/9.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/a.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/b.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/c.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/d.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/e.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/f.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/g.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/h.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/i.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/j.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/k.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/l.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/m.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/n.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/o.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/p.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/q.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/r.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/s.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/t.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/u.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/v.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/w.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/x.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/y.txt
https://raw.githubusercontent.com/mrvivacious/PorNo-_Porn_Blocker/master/lists/Urls/z.txt
https://raw.githubusercontent.com/zangadoprojets/pi-hole-blocklist/refs/heads/main/Pornpages.txt
https://raw.githubusercontent.com/thisisu/hosts_adultxxx/master/hosts"

while IFS= read -r line; do
  filename="down/$(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32)"

  url=$(echo $line | awk -F'#-#' '{print $1}')
  replace=$(echo $line | awk -F'#-#' '{print $2}')

  wget $url --timeout=10 -O $filename --user-agent="Mozilla/5.0 (Windows NT 10.0; rv:129.0) Gecko/20100101 Firefox/129.0"

  case $url in
    *tar.gz)
      tar -xvzf $filename
      mv adult/domains $filename
      rm -rf adult
      ;;
  esac

  if [ ! -z $replace ]; then
    sed -i "$replace" $filename
  fi

  #sleep 5
done <<< "$links"

