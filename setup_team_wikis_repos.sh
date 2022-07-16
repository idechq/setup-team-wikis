# GitHub CLI api
# https://cli.github.com/manual/gh_api

year=$(date +'%Y')

while IFS="" read -r team_name || [ -n "${team_name}" ]; do

    team_repo_name=${year}_$(echo ${team_name} | sed 's/ /_/g')
    repo_homepage="http://idec-teams.github.io/${team_repo_name}/"
    repo_description="Wiki repository for ${year} iDEC Team: ${team_name}"
    echo "${team_name}"
    echo "${team_repo_name}"
    echo "${repo_homepage}"
    echo "${repo_description}"

    gh api \
        --method POST \
        -H "Accept: application/vnd.github+json" \
        /orgs/idec-teams/repos \
        -f name="${team_repo_name}" \
        -f description="${repo_description}" \
        -f homepage="${repo_homepage}" \
        -F private=false \
        -F has_issues=true \
        -F has_projects=true \
        -F has_wiki=true

done <teams.txt
