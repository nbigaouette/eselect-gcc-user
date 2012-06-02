function remove_path_from_list() {
    if [[ "${1}" == "" ]]; then
        echo ""
    else
        new_list=$1
        position_match_remaining=$(expr "${new_list}" : ".*$2.*")

        # Find all occurances of the pattern and remove them
        while [[ "${position_match_remaining}" != "0" ]]; do
            new_list=$(echo ${new_list} | sed "s|\(.*\)$2\(.*\)|\1:\2|g")

            position_match_remaining=$(expr "${new_list}" : ".*$2.*")
        done

        # Remove trailing, starting and any dupplicates column(s)
        new_list=$(echo ${new_list}| sed -e "s|:\+:\+||g" -e "s|^:||g" -e "s|:$||g")

        echo ${new_list}
    fi
}

