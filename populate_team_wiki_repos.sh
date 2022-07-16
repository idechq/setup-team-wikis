year=$(date +'%Y')
declare -a filepaths
filepaths+=("LICENSE")
filepaths+=("mkdocs.yml")
filepaths+=("README.md")
filepaths+=("docs/index.md")
filepaths+=("docs/useful_features.md")

mkdir -p ../tmp-wikis

while IFS="" read -r team_name || [ -n "${team_name}" ]; do

    team_repo_name=${year}_$(echo ${team_name} | sed 's/ /_/g')
    repo_homepage="http://idec-teams.github.io/${team_repo_name}/"

    cp -r ../base-wiki ../tmp-wikis/${team_repo_name}

    echo "${team_name}"
    echo "${team_repo_name}"

    for filepath in "${filepaths[@]}"; do
        sed "s/{year}/${year}/g" ../base-wiki/${filepath} |
            sed "s/{team_name}/${team_name}/g" |
            sed "s/{team_name}/${team_name}/g" |
            sed "s/{team_repo_name}/${team_repo_name}/g" >../tmp-wikis/${team_repo_name}/${filepath}
    done

done <teams.txt
