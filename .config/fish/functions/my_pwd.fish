function my_pwd -V limit
  set -l realhome ~
  echo $PWD | sed -e "s|^$realhome\$|~|" -e "s|^$realhome/|~/|" -e 's-\([^/.]\)[^/]*/-\1/-g' -e "s-\([^/.]\{10\}\)[^/]*\$-\1...-"
end
