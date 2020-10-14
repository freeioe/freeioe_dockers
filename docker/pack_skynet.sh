rm -rf __install
mkdir __install

### Get the version by count the commits
VERSION=`git log --oneline | wc -l | tr -d ' '`

### Generate the revision by last commit
set -- $(git log -1 --format="%ct %h")
R_SECS="$(($1 % 86400))"
R_YDAY="$(date --utc --date="@$1" "+%y.%j")"
REVISION="$(printf 'git-%s.%05d-%s' "$R_YDAY" "$R_SECS" "$2")"

echo 'Version:'$VERSION
echo 'Revision:'$REVISION

echo ${VERSION} > __install/version
echo ${REVISION} >> __install/version

# Copy files
cp -r lualib __install/lualib
cp 3rd/librs232/bindings/lua/rs232.lua __install/lualib
cp -r luaclib __install/luaclib
cp -r service __install/service
cp -r cservice __install/cservice
cp README.md __install/
cp HISTORY.md __install/
cp LICENSE __install/
cp skynet __install/

cd __install/

ln -s ../freeioe ./ioe
ln -s /var/log ./logs
cd - > /dev/null

cd __install
tar czvf ../skynet_release.tar.gz * > /dev/null
md5sum ../skynet_release.tar.gz > ../skynet_release.tar.gz.md5
