#!/bin/bash
# get active workflows in a repository using REST API of CLI

response=$(gh api \
              -H "Accept: application/vnd.github+json" \
              -H "X-GitHub-Api-Version: 2022-11-28" \
              /repos/hakohl/study-github/actions/workflows)
  
for workflow_id in $(echo "$response" | jq -cr '.workflows[] | select( .name != "exercise-cli-github" and .state == "active" ) | .id'); do
    gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/hakohl/study-github/actions/workflows/"${workflow_id}"/disable
done

exit 0