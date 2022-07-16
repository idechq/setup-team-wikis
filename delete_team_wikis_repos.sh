# GitHub CLI api
# https://cli.github.com/manual/gh_api

year=$(date +'%Y')

while IFS="" read -r team_name || [ -n "${team_name}" ]; do

    team_repo_name=${year}_$(echo ${team_name} | sed 's/ /_/g')
    echo "${team_name}"
    echo "${team_repo_name}"

    gh api \
        --method DELETE \
        -H "Accept: application/vnd.github+json" \
        /repos/idec-teams/${team_repo_name}

done <teams.txt
