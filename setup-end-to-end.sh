projectDir=$PWD

echo "${projectDir}"

cd ../ &&
    git clone git@github.com/idec-teams/base-wiki.git &&
    cd ${projectDir} &&
    bash setup_team_wikis_repos.sh &&
    bash populate_team_wiki_repos.sh &&
    bash upload_team_wiki_repos.sh &&
    bash enable-github-pages.sh &&
    rm -rf ../tmp-wikis
