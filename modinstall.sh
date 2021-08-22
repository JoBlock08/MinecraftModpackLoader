export mcHome="/home/$USER/.minecraft"

if [! -d "$mcHome"]; then
    echo "minecraft directory not found"
    exit 1
fi

if ["$mcHome" = ""]; then
    echo "invalid directory"
    exit 1
fi

if [! -d "$1"]; then
    echo "invalid modpack.zip"
    exit 1
fi

rm -R $mcHome/config/*
rm -R $mcHome/mods/*
rm -R $mcHome/resources/*
rm -R $mcHome/scripts/*
rm -R temp
mkdir temp
unzip $1 -d temp
python3 mod_download.py temp/manifest.json  $mcHome/mods
cp -r temp/overrides/config $mcHome
cp -r temp/overrides/mods $mcHome
cp -r temp/overrides/resources $mcHome
cp -r temp/overrides/scripts $mcHome
rm -R temp
unset mcHome
exit 0