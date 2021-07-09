gcalcli --calendar=alpar.torok@elastic.co agenda --tsv --details description $(date -Id) $(date -Id --date tomorrow) | awk -F'\t' '{ if (match($6, /https?(:\/\/[A-Za-z0-9.-]*zoom[.]us[^ "<\\]+)/, m)) { print $5 "\tzoommtg" m[1] } }' | column -ts $'\t' -o $'\t' | rofi -dmenu -i -mesg 'Open an upcoming Zoom meeting' | awk -F'\t' '{ print $NF; }' | xargs xdg-open
