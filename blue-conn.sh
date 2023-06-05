controls_env_string=$BLUE_CONTROLS

IFS=', ' read -r -a controls_array <<< "$controls_env_string"
for element in "${controls_array[@]}"
do
    res=$(blueutil --is-connected "$element")
    if [[ "$res" = '0' ]]
    then
        blueutil --unpair "$element"
        sleep 1
        blueutil --pair "$element"
        sleep 1
        blueutil --connect "$element"
    else
        echo "Device $element is already connected"
    fi
done