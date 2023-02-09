alias dotfiles='git --git-dir=/home/pi/.dotfiles --work-tree=/'

dot() {
   if [[ "$#" -eq 0 ]]; then
     (cd /;
     for i in $(dotfiles ls-files); do
       echo -n "$(dotfiles -c color.status=always status $i -s | sed "s#$i##")";
       echo -e "¬/$i¬\e[0;33m$(dotfiles -c color.ui=always log -1 --format="%s" -- $i)\e[0m";
     done;
     ) | column -t --separator=¬ -T2;
   else
     dotfiles $*;
   fi;
}
