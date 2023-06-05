controls_env_string=$BLUE_CONTROLS

IFS=', ' read -r -a controls_array <<< "$controls_env_string"
for element in "${controls_array[@]}"
do
    res=$(blueutil --is-connected "$element")
    if [[ "$res" = '1' ]]
    then
        blueutil --unpair "$element"
    else
        echo "Device $element is not connected"
    fi
done