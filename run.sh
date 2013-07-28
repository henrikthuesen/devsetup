if [ `hostname` != 'ender' ]; then
    echo "Hostname should be 'ender'."
    exit -1
fi

sudo puppet apply -v --modulepath=/home/ht/devsetup/environment/modules /home/ht/devsetup/environment/manifests/site.pp
