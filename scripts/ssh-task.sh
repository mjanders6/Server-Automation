#!/bin/bash

eval $(ssh-agent)
ssh-add ~/.ssh/ansible

#cd ~/Server-Automation

sudo apt update && sudo apt upgrade -y

ansible all -m gather_facts --limit rpi1
ansible all -m gather_facts --limit rpi2
ansible all -m gather_facts --limit rpi3

ansible-playbook -i hosts.yml up.yml --ask-become-pass