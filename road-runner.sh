#!/bin/bash
filename='commands.fdd'
if [ -f $filename ];
then 
        echo ""
else    
        echo "file not found :("
        exit 1
fi      
#checks if file is empty or not 
if [ $(ls -l $filename | awk '{print $5}') -eq 0 ];
then 
        echo 'No commands found :)\n write commands in a file  e.g. : \nname1 <command1>\nname2 <command2>'
        exit 1
else    
        i=1
        for line in $(cat $filename | awk '{print $1}')
        do  
                echo $i $line
                i=`expr $i + 1 `
        done    
        echo  "please  select... : "
        read  choice
        p='p' 
 #      finds the command 
        command="$(sed -n $choice$p $filename | awk -F '[<>]' '{print $2}')"
        
#       finds the title
        title="$(sed -n $choice$p $filename | awk -F '[<>]' '{print $1}')"
#       echo "${command}"

#       run in another terminal 
        gnome-terminal "--tab-with-profile=Default " -t ${title} -e "${command}"
fi
