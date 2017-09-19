# Real life Git

## Tools

### GUIs

<https://git-scm.com/downloads/guis>

* [Sourcetree](http://www.sourcetreeapp.com/)
* [Git Kraken](http://www.gitkraken.com/)
* [Tortoise Git](https://tortoisegit.org/)
* [Git for Windows](https://git-for-windows.github.io/)
* [Git Extensions](http://gitextensions.github.io/)
* Plugins pour IDE et éditeurs de texte

### Hosting repositories

* [Github](https://github.com/)
* [Gitlab](https://about.gitlab.com/)
* [Bitbucket](https://bitbucket.org/product)
* [Gogs](https://gogs.io/)

## Github specificities

### What's Github

... or more precisely, what does it offers that git doesn't?

### Project scoping/ownership

* Projects : git repository with associated stuff (wiki, issues, etc)
* Groups : kind of "namespaces"
    * Users belong to groups
    * Projects belongs to groups/namespaces
    * Each user has its own namespace

### Authorization / Authentication (Authnz)

Git delegates it to the underlying protocol, and Github handles this underlying
protocol:

* HTTPS
* SSH

### Centralization

=> Integrations :)

* Slack
* CI/CD
* More globally, webhooks

### Fork

> A fork is a copy of a repository. Forking a repository allows you to freely
> experiment with changes without affecting the original project.

### Pull Requests

* Sometimes called _Merge requests_ by other tools (Hi Gitlab!)
* Request that some code is merged into an existing branch

### Project configuration

- Protected braches
- Default branches
- Permissions...

### Demo

- Project creation...
- Configuration...

## Best practices

### Commit messages

Please read <https://chris.beams.io/posts/git-commit/>

7 rules :

1. Separate subject from body with a blank line
2. Limit the subject line to 50 characters
3. Capitalize the subject line
4. Do not end the subject line with a period
5. Use the imperative mood in the subject line
6. Wrap the body at 72 characters
7. Use the body to explain what and why vs. how

(Do not) use [whatthecommit](http://whatthecommit.com/)

### Good

* "Commit early, commit often"
* Only commit compiling code / working configurations in shared branches
* Write explicit commit messages

### Bad

Do **not** add :

* Generated files
* Binaries (`.exe`, `.o`, `.out`, `.pdf`, ...)
* System files (`Thumbs.db`, ...)
* Useless files (git is not a file sharing system)

## Versioning

### [Semantic versioning](http://semver.org/)


![Semantic Versioning](images/semver.png)

* **Major**: imcompatible/breaking changes
* **Minor**: new features, backward-compatible. Old functionnality deprecated
  but still operational; large internal refactor
* **Patch**: backward-compatible bug fixes

## Git workflows

### Differents workflows

* Centralized
* Feature branch
* Gitflow
* Forking

[1](https://git-scm.com/book/en/v2/Git-Branching-Branching-Workflows)

[2](https://git-scm.com/book/en/v2/Distributed-Git-Distributed-Workflows>)
