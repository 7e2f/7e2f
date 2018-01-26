#!/bin/bash

title="~/start"

content=""
list_close="false"

links="start.7e2f.ld/links"

while IFS=" | " read -r foo bar baz
    do
        case $foo in
            ^)
            #echo "list" $bar
            if [ $list_close == "true" ]; then
                content+="</ul>
                "
            else
                list_close="true"
            fi

            content+="<ul class='links'>
            "
            ;;
            -)
            content+="<li class='heading'>$bar</li>
            "
            ;;
            @)
            #echo "link" $baz
            content+="<li><a href='$bar' target='_blank'>$baz</a></li>
            "
            ;;
            *)
            ;;
        esac

    done <$links

content+="</ul>"
#echo $content
