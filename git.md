# Git Aliases

## Show Compact Log

```text
[alias]
    l = log --decorate=short --decorate-refs="refs/tags/*" --pretty=format:'%C(3)%h %C(250)%<(12,trunc)%aN %C(245)%<(18)%ad %C(11)%d %Creset%s' --date=format:'%Y-%m-%d %I:%M:%S %p'
```

```sh
$ git l

3c73426b Schott, Do.. 2022-03-03 05:03:13 PM  Add transcoding event publishing to raw video upload handler
5db31917 Jason Gerard 2022-03-08 09:34:07 AM  fixing for prod deployment
7bdcbeea Jason Gerard 2022-03-08 08:34:15 AM  (tag: 7.6.4) settings redux
b32288a9 Jason Gerard 2022-03-08 07:54:28 AM  fixing settings import
```

## New Branch off origin:develop

```text
[alias]
    bd = "!git fetch --update-head-ok origin develop:develop && git checkout -b ${1:?Branch name missing} develop && git push -u origin"
```

```sh
$ git bd my-new-branch

Switched to a new branch 'my-new-branch'
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0
remote:
remote: Create a pull request for 'my-new-branch' on GitHub by visiting:
remote:      https://github.com/SafelyYou-Inc/sky/pull/new/my-new-branch
remote:
To github.com:SafelyYou-Inc/sky.git
 * [new branch]        my-new-branch -> my-new-branch
branch 'my-new-branch' set up to track 'origin/my-new-branch'.
```

## Interactive Rebase Branch onto origin:develop

```text
[alias]
    rbd = "!git fetch origin develop:develop  && git rebase -i --autosquash origin/develop"
```

```sh
$ git rbd

Successfully rebased and updated refs/heads/my-new-branch.
```

# Log New Commits from Develop

ld = !git l develop..

git ld
