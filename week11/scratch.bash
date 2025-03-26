    variable="apple banana apple orange apple"
    value="apple"
    count=$(echo "$variable" | grep -o "$value" | wc -l)
    echo "$value appears $count times"
