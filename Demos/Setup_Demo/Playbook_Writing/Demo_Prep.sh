#!/bin/bash

echo "**********************************************"
echo "***** Copying Collections ********************"
cp collections/*.tar.gz /tmp

echo "**********************************************"
echo "***** Installing Collections ********************"
ansible-galaxy collection install -r collections/requirements.yml -p collections/


echo "**********************************************"
echo "***** Configuring Controller ********************"
lab start playbooks-write
ansible-playbook Site.yml