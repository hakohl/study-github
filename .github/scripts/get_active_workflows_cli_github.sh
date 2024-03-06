#!/bin/bash
# get active workflows in a repository using CLI

cd ./.github/scripts || exit 1

gh workflow list --all > workflow_list.txt

active_workflows=()

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