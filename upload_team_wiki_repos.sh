year=$(date +'%Y')

projectDir=$PWD

echo "${projectDir}"

while IFS="" read -r team_name || [ -n "${team_name}" ]; do

    team_repo_name=${year}_$(echo ${team_name} | sed 's/ /_/g')

    echo "${team_name}"
    echo "${team_repo_name}"
    repo_ssh_url="git@github.com:idec-teams/${team_repo_name}.git"

    cd ${projectDir}/../tmp-wikis/${team_repo_name} &&
        rm -r .git/ &&
        git init --initial-branch=main &&
        git config user.name "idechq-bot" &&
        git config user.email "support@idechq.org" &&
        git remote add origin "${repo_ssh_url}" &&
        git add --all &&
        git commit -m "Setup repository" &&
        git push origin main

done <teams.txt

cd ${projectDir}
