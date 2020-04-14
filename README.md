# pam-generate-release-action
This github action use [github-changelog-generator](https://github.com/github-changelog-generator/github-changelog-generator)
for generating changelog between releases/tags.

## How to use in github action

```

steps:
  - name: generate changelog action
    uses: navikt/pam-generate-release-action@v1
    env:
      sinceTag: v1
    with:
      token:  ${{ secrets.GITHUB_TOKEN }}
      cmd: "--since-tag ${{ env.sinceTag }} --usernames-as-github-logins"

```

The field **cmd** is where you pass the parameters to the script, you can find all supported parameters [here](https://github.com/github-changelog-generator/github-changelog-generator/wiki/Advanced-change-log-generation-examples) 
