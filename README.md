# pam-generate-release-action
This github action use [github-changelog-generator](https://github.com/github-changelog-generator/github-changelog-generator)
for generating changelog between releases/tags.

## How to use in github action

```

steps:
  - name: generate changelog action
    uses: navikt/pam-generate-release-action@v1.1
    with:
      token:  ${{ secrets.GITHUB_TOKEN }}
      useLatestReleaseTag: true
      cmd: "--usernames-as-github-logins"
  - name: Output changelog
    run: cat CHANGELOG.md

```

The field **cmd** is where you pass the parameters to the script, you can find all supported parameters [here](https://github.com/github-changelog-generator/github-changelog-generator/wiki/Advanced-change-log-generation-examples). The script save the changelogs to a file CHANGELOG.md.
