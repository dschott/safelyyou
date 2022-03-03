# Developer Workflow

## Feature

All development must be done in feature branches, a git branch that contains only the changes for a single feature.
This is the most important rule.
The feature branch must only contain changes for the feature, it cannot contain any other changes.
If you ever feel you need to break this rule, get approval first.
To ensure it only contains the feature changes, always create feature branches off of master.
These are named based on the feature and should contain a reference to a ticket or issue number.
For example, SKY-12345-video-upload-simulator.

## QA

Once the development is complete and ready for code review a pull request should be issued into the qa branch.
The qa branch will always exist and is a collection of all feature branches for the next release.
Feature branches are merged into qa after they pass code review.
Once the branch has been merged into qa the continuous integration server will deploy the latest changes to the staging server.
This allows the QA team to test all the feature branches together, what will become the next release.

## Release

Once all the features have been completed for the next release and the qa branch is thoroughly tested, it is merged into master.
Note that during the development process all the feature branches still exist, they are not deleted once they are merged into qa.
This is important when we need to pull a feature from a release.
The master branch represents the current state of production.
Every release will have a tag, but master can always be used to reference current production code.
No changes are made directly to master, nor are feature branches ever merged directly into master.
Only qa is ever merged into master, this happens during the release process.
After a release is tagged and pushed out to production, all the merged feature branches are removed.
To make merging seamless, feature branches should always be kept up to date with master.
If you have an ongoing feature branch that is behind master it must be rebased before being merged into qa.
This ensures there aren't any merge conflicts when we make the release.
In terms of developer responsibility, you only have to worry about making feature branches, merging them into qa, and rebasing against master.
The rest of the process is handled by operations personnel.
If you ever want to see the state of your feature branch relative to master you can view it on the /branches page on github.
There will be a small graph of commits ahead and behind of master.
Your feature branch should always be 0 commits behind and X commits ahead, where X is the number of commits in your feature branch.

## Notes:

This Sucks for developers ^
Keeping feature branches open is expensive for developers (rebase, merge conflict resolution)

Feature branches should be thrown away...

Features should *never* be pulled from QA since the feature branch should have been tested and approved already.
- If a feature is removed, a new commit should be made to remove the feature
- If the feature is restored, the feature is still in git history and can be restored
- Need to provide an example of this
- We should not be regularly backing out features after development is done and a PR is merged. If this is occuring
  planning needs to be improved.

Decisioning
Feature branch needs QA?
- Yes. QA tests the feature branch prior to merge into develop
  - If the feature being tested requires multiple branches then *developers* should create a new branch the merges both branches
    and create a pull request. QA should never merge.
- No. PR merged into develop

Release testing should be limited to integration/regression testing (the feature should have been fully tested already)

release testing

feature testing (not sure this is covered ^)











## TAG A RELEASE

name: Tag Release
on:
    push:
        branches: [ main ]
jobs:
    tag_release:
        runs-on: ubuntu-latest
        steps:
            - name: Check out code
              uses: actions/checkout@v2
            - name: Initialize mandatory git config
              run: |
                  git config user.name "GitHub Actions"
                  git config user.email noreply@github.com
            - name: Setup release information
              #get version name from app_versions.gradle file (5.6.2)
              run: |
                  versionName=`sed '2q;d' app_versions.gradle | cut -d "=" -f2 | xargs`
                  export VERSION_NAME=$versionName
                  echo "::set-env name=VERSION_NAME::$VERSION_NAME"
            - name: Extract release notes
              id: extract_release_notes
              uses: ffurrer2/extract-release-notes@v1
            - name: Create Release
              id: create_release
              uses: actions/create-release@v1
              env:
                    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
              with:
                tag_name: ${{ env.VERSION_NAME }}
                release_name: v${{ env.VERSION_NAME }}
                body: ${{ steps.extract_release_notes.outputs.release_notes }}
                draft: false
                prerelease: false
            - name: Slack notify
              uses: rtCamp/action-slack-notify@master
              env:
                SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_OVER_APP }}
                SLACK_CHANNEL: #over-app-android
                SLACK_TITLE: 🚨 Version ${{ env.VERSION_NAME }} is being published to Google Play Internal Test
                SLACK_MESSAGE: ${{ steps.extract_release_notes.outputs.release_notes }}
                MSG_MINIMAL: true


## CREATE RELEASE BRANCH

name: Create Release Branch
on:
  workflow_dispatch:
    inputs:
      versionName:
        description: 'Name of version  (ie 5.5.0)'
        required: true
      versionCode:
        description: 'Version number (50500)'
        required: true
jobs:
  createrelease:
    runs-on: ubuntu-latest

    steps:
    - name: Check out code
      uses: actions/checkout@v2
    - name: Create release branch
      run: git checkout -b release/v${{ github.event.inputs.versionName }}
    - name: Initialize mandatory git config
      run: |
       git config user.name "GitHub Actions"
       git config user.email noreply@github.com
    - name: Change version number and name
      run: printf 'ext.version_code = ${{ github.event.inputs.versionCode }}\next.version_name = "${{ github.event.inputs.versionName }}"\n' > app_versions.gradle
    - name: Update Changelog
      uses: thomaseizinger/keep-a-changelog-new-release@v1
      with:
        version: ${{ github.event.inputs.versionName }}
    - name: Commit changelog and manifest files
      id: make-commit
      run: |
        git add app_versions.gradle
        git add CHANGELOG.md
        git commit --message "Prepare release ${{ github.event.inputs.versionName }}"
        echo "::set-output name=commit::$(git rev-parse HEAD)"
    - name: Push new branch
      run: git push origin release/v${{ github.event.inputs.versionName }}
    - name: Submit strings.xml for translation
      uses: andstor/copycat-action@v3
      with:
        personal_token: ${{ secrets.ANDROID_I18N_PAT }}
        src_path: resources/src/main/res/values/strings.xml
        src_branch: release/v${{ github.event.inputs.versionName }}
        dst_path: en/strings.xml
        dst_owner: your-repo-owner
        dst_repo_name: android-i18n
        dst_branch: master
        clean: true
        commit_message: release/v${{ github.event.inputs.versionName }} BOT New Strings for translation submitted.
    - name: Create pull request into main
      uses: thomaseizinger/create-pull-request@1.0.0
      with:
       GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
       head: release/v${{ github.event.inputs.versionName }}
       base: main
       title: v${{ github.event.inputs.versionName }} into main
       reviewers: ${{ github.event.issue.user.login }}
       body: |
           Hi!
           This PR was created in response workflow running.
           I've updated the version name and code commit: ${{ steps.make-commit.outputs.commit }}.
    - name: Create pull request to develop
      uses: thomaseizinger/create-pull-request@1.0.0
      with:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          head: release/v${{ github.event.inputs.versionName }}
          base: develop
          title: v${{ github.event.inputs.versionName }} into develop
          reviewers: ${{ github.event.issue.user.login }}
          body: |
              Hi!
              This PR was created in response workflow running.
              I've updated the version name and code commit: ${{ steps.make-commit.outputs.commit }}.
