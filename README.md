This is the result of merging and cleaning up a bunch of porn-blocking lists I've found scattered through the web. It currently has 3.849.234 unique domains and a redirect to the "Safe Browsing" versions of Google, DuckDuckGo, Bing, YouTube and Yandex.

The list is split into 90MB chunks to avoid GitHub's [file size limit](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github). If you need a single file list it can be found on the [releases page](https://github.com/columndeeply/hosts/releases/tag/latest). The merged list will be updated once a month.

# Usage
You can use this list with most DNS based blockers (PiHole/Adguard Home/Technitium DNS/etc.) or directly by appending the list to your hosts file.

## PiHole/AdGuard Home/Technitium DNS
Add these to your blocklist and you're ready to go.
> https://raw.githubusercontent.com/columndeeply/hosts/main/hosts00  
> https://raw.githubusercontent.com/columndeeply/hosts/main/hosts01

## Hosts file
### On Windows
Edit the file ``C:\Windows\System32\drivers\etc\hosts`` with administrator privileges and add the domains.
### On Linux and MacOS
Add the domains to ``/etc/hosts``. You also download and append them with ``cat hosts0X >> /etc/hosts``
### On Android
You can use any of the DNS based blockers like [DNS66](https://f-droid.org/en/packages/org.jak_linux.dns66/), [personalDNSfilter](https://f-droid.org/en/packages/dnsfilter.android/) or [Daedalus](https://f-droid.org/en/packages/org.itxtech.daedalus/) and add the links posted above.

# Contributing
Since this list is just a fused version of other lists and the domains aren't manually checked it'll probably have false positives. If a site is listed here and you think it shouldn't please let me know by opening a new issue or making a pull request. The same goes if you think a site should be added to the list. In both cases please use the appropriate tag on the issue/PR title: ``[Addition Request]`` or ``[Removal Request]``.

### By making an issue
If you're submitting more than a couple dozen domains please make a pull request or use a pastebin site. If it's just a few domains then just paste them on the issue. If you took the domains from another list please say so and leave a link to their page so it can be added to the "Sources" table below.

### By making a pull request
When making a pull request you should add a file on the "contributions" directory with your domains. I'll then merge your pull request and merge the file into the main list. **Please do not make changes directly to the main list.** If you're not sure how to list the domains take a look at the [example](https://github.com/columndeeply/hosts/blob/main/contributions/example.txt).

### Invalid/Inactive domains
I'm not removing these from the list. Please do not submit domains for removal just because they are no longer active. Removing them would mean having to check every X months to see if they are back. I'll only whitelist domains that are active and point to a non-pornography related site.

# Scripts
I've added the two scripts I use to maintain this list to the repository. Feel free to use them anyway you want. Also, if you know a way to make them more clean (not have to use .tmp files would be nice) or any general improvements please let me know.

### cleanup.sh
Give it a list of files with domains and it'll try to clean them a bit. It removes all empty lines, comments, multiple whitespaces, tabs, trailing whitespaces and some more stuff. Once that's done it'll replace any IP at the beginning of each line with ``127.0.0.1`` (or add it if there isn't one). Then it removes any domain that exists in the whitelist, removes any duplicates and sorts the resulting list.

### merger.sh
Used to merge clean lists with the main one. Should be run like this ``sh merger.sh "*_clean"`` to make sure it only adds the lists created by the ``cleanup.sh`` script. It merges all given files with the main one, removes duplicates, sorts the merged list and once that's done it splits it into 90MB chunks.

# Sources
## Repos

| Link | Last update | Comments |
|---|---|---|
| [1boii's list](https://github.com/1boii/hosts/blob/main/hosts) | 2022/03/11 |  |
| [4skinSkywalker's list](https://github.com/4skinSkywalker/Anti-Porn-HOSTS-File/blob/master/HOSTS.txt) | 2022/05/29 |  |
| [Bon-Appetit's list](https://github.com/Bon-Appetit/porn-domains/blob/master/block.txt) | 2022/09/27 |  |
| [EnergizedProtection's lists](https://github.com/EnergizedProtection/block) | 255,719 / 51,354 | "Porn" and "Porn Lite Extension". |
| [My Privacy DNS's list](https://mypdns.org/my-privacy-dns/porn-records/-/blob/master/active_domains/output/merged_results/domains/ACTIVE/list) | 2021/12/03 |  |
| [Sinfonietta's list](https://github.com/Sinfonietta/hostfiles/blob/master/pornography-hosts) | 2022/10/02 | Seems to pull from [StevenBlack's list](https://github.com/StevenBlack/hosts/blob/master/alternates/porn/hosts). |
| [StevenBlack's list](https://github.com/StevenBlack/hosts/blob/master/alternates/porn/hosts) | 2022/10/06 | Ships packaged with the unified adware + malware lists.<br>``sed -i '0,/^# End yoyo/d; /^#/d; s/ #.*//g; /^$/d' hosts`` |
| [blocklistproject's list](https://github.com/blocklistproject/Lists/blob/master/porn.txt) | 2022/06/21 |  |
| [cbuijs's list](https://github.com/cbuijs/ut1/blob/master/adult/domains.24733) | 2022/10/07 |  |
| [clefspeare13's list](https://mypdns.org/clefspeare13/pornhosts/-/tree/master/download_here/0.0.0.0) | 2022/09/17 |  |
| [mhhakim's list](https://github.com/mhhakim/pihole-blocklist/blob/master/custom-porn-blocklist.txt) | 2022/05/11 |  |
| [mhhakim's list #2](https://github.com/mhhakim/pihole-blocklist/blob/master/porn.txt) | 2022/10/07 |  |
| [mrvivacious's list](https://github.com/mrvivacious/PorNo-_Porn_Blocker/tree/master/lists/Urls) | 2022/04/04 | Split by first letter of domain. ``cat * > merged`` to fuse. |
| [thisisu's list](https://github.com/thisisu/hosts_adultxxx/blob/master/hosts) | 2022/10/06 |  |
| [zangadoprojets' list](https://github.com/zangadoprojets/pi-hole-blocklist/blob/main/Pornpages.txt) | 2022/03/06 |  |

## Random lists
- https://gist.githubusercontent.com/sibaspage/5248d7600a24284f580219b29d178c49/raw/b35fdaf7a8685b536da0022102e125df70c50eb1/pornsite-list.txt
- https://booru.org/top (Filtered by NSFW and sorted by number of images. First 10 pages only since after that they had less than 200 images each, not worth the effort to parse them.)
- http://controlc.com/99125ac6 (Posted by [/u/lojack_or_nojack](https://teddit.net/r/NoFap/comments/924t6w/an_updated_list_of_porn_sites_to_block_in_your/).)
- https://github.com/saskuu/blocklist/blob/main/porno.txt

## Archived or abandoned (+1 year without updates)
- https://github.com/11201010/anti-porn-hosts-file/blob/master/HOSTS.txt (2020/08/03)
- https://github.com/chadmayfield/my-pihole-blocklists/blob/master/lists/pi_blocklist_porn_all.list
- https://github.com/tiuxo/hosts/blob/master/porn (2020/12/06)
- https://github.com/Amdr0meda/Blocklist_Pi_Hole/blob/master/Porn%20pages.txt (2021/06/31)
