source .env

year=$(date +'%Y')

while IFS="" read -r team_name || [ -n "${team_name}" ]; do

    team_repo_name=${year}_$(echo ${team_name} | sed 's/ /_/g')

    echo "${team_name}"
    echo "${team_repo_name}"

    curl \
        -X POST \
        -H "Accept: application/vnd.github+json" -H "Authorization: token ${token}" \
        https://api.github.com/repos/idec-teams/${team_repo_name}/pages \
        -d '{"source":{"branch":"gh-pages","path":"/"}}'

done <teams.txt
