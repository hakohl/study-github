#!/bin/bash
# get active workflows in a repository, using curl for accessing REST API

response=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer <YOUR-TOKEN>" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/hakohl/study-github/actions/workflows)
  
for workflow_id in $(echo "$response" | jq -cr '.workflows[] | select( .name != "exercise-rest-api-curl-github" and .state == "active" ) | .id'); do
  curl -L \
    -X PUT \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer <YOUR-TOKEN>" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/hakohl/study-github/actions/workflows/"${workflow_id}"/disable
done

exit 0