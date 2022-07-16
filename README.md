# set-up-team-wikis

## Step-by-step guide

Run this on a Unix environment (e.g. WSL2 Ubuntu-20.04)

1. Obtain access to the shared account of `idechq-bot` (contact Trevor / Chong / Yang for help)
2. Install software:
    - [GitHub CLI](https://cli.github.com/)
    - [miniforge / mambaforge](https://github.com/conda-forge/miniforge)
        - git
3. [Generate SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) as `idechq-bot` on local profile
    ```shell
    ssh-keygen -t ed25519 -C "support@idechq.org"
    ```
    Then add the SSH key to GitHub SSH Key settings
4. Create a file `teams.txt` under this directory, with one team name (without any information of year) per line
5. Generate a GitHub personal access token
    Set to token to expire in 7 days
6. Save the token in `.env` in this directory
    ```shell
    $ cat .evn
    token={your personal access token}
    ```
7. Autheticate yourself in GitHub CLI
    ```shell
    gh auth login
    ```
    Follow through the process. Using web interface is recommended.
8. Run the script
    ```shell
    bash setup-end-to-end.sh
    ```
