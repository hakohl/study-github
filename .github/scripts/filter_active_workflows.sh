#!/bin/bash -x
# filter active workflows in a repository

cd ./.github/scripts || exit 1

active_workflows=()
#export "${active_workflows[@]}"

while read name state id; do
    if [[ $name == "exercise-cli-github" ]]; then
        continue
    elif [[ $state == "active" ]]; then
        active_workflows+=("$name")
    else
        continue
    fi
done < workflow_list.txt

exit 0