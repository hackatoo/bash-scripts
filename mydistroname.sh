#!/bin/bash
#Creating array of distributives
distr=(debian ubuntu centos redhat)
 #Search the name of distro
OS=$(awk '/^ID=/' /etc/*-release | sed 's/ID=//' | tr '[:upper:]' '[:lower:]' | tr -d '[="=]')
function checkdistr(){
echo "Searching the name of your distro..."
if [[ $OS = ${distr[1]} ]]; then
echo "Your distro is $OS"
elif [[ $OS = ${distr[2]} ]]; then
echo "Your distro is $OS"
elif [[ $OS = ${distr[3]} ]]; then
echo "Your distro is $OS"
elif [[ $OS = ${distr[4]} ]]; then
echo "Your distro is $OS"
else
echo "Please enter a distributive from the list(ubuntu, debian, centos, redhat)" 
read listdist
case "$listdist" in
[Uu]buntu)
echo "Looks like your distro is ubuntu"
;;
[Dd]ebian)
echo "Looks like your distro is debian"
;;
[Cc]ent[Oo][Ss])
echo "Looks like your distro is centos"
;;
[Rr]edhat)
echo "Looks like your distro is redhat"
;;
esac
fi
}
checkdistr