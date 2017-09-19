# Git itself

## What is Git

### Where it comes from

* Linus Torvald
* Linux kernel maintenance
* 1991 - 2002 : patches
* 2002 - 2005 : BitKeeper
* 2005 - Now  : Git

### Infos

* Released under the GNU GPL v2 License
* v1.0 : 21 December 2005
* v2.0 : 28 May 2014
* v2.14 : 04 August 2017

### Design

* Distributed development and workflow
* Strong safeguard against corruption (accidental or malicious)
* Compatibility with existing systems/protocols (http, ftp, rsync, ssh)
* Eficient handling of large projects
* Object Oriented model
* Plumbing vs. Porcelain

### "Git, c'est un truc de barbus pas connu"

* Google (https://github.com/google)
* Facebook (https://github.com/facebook)
* Microsoft (http://aspnetwebstack.codeplex.com/)
* Twitter (https://github.com/twitter)
* Perl (http://perl5.git.perl.org/perl.git)
* Android (https://android-review.googlesource.com)
* Git (https://git.kernel.org/cgit/git/git.git/)
* ...

## Architecture - How git works internally

### Data integrity control

* Usage of SHA-1 hashes (same result on any machine/system for the same content)
* 160 bits footprint (40 chars.)
* All files are stored in .git/objects
* Files are identified by an ID: fast and efficient

### 4 types of objects in Git

* Blob
* Tree
* Commit
* Tag

### Blob

A blob object stores the content of a file. It’s a piece of binary data which
does not reference anything, not even a file name.

You can inspect the content of a blob if you know its hash with the command:

    git show <hash> / git cat-file -p <hash>

![Blob](images/blob-object.png){ width=30% height=30% }

### Tree

A tree object contains a list of pointers to blobs and other trees. It
represents the content of a directory or sub-directory.

You can use git show to inspect a tree but git ls-tree will give more info:

    git ls-tree <hash> / git show <hash>

![Tree](images/tree-object.png){ width=30% height=30% }

### Commit

A commit links the physical state of a tree with a comment explaining why it
came to that state. It is defined by a tree, one or several parents, an author,
a committer and a comment.

You can use git show or git log with the –pretty=raw option to
inspect a commit:

    git show --pretty=raw <hash> / git cat-file -p <hash>

![Commit](images/commit-object.png){ width=30% height=30% }

### Objects relation

![Objects relation](images/object-relation.png)

### Tag

A tag object points to a specific state of the code. It contains an object id,
an object type, the name of the tagger and a message with an eventual signature.

You can use git cat-file to view the content of a tag:

    git cat-file tag <TAG_NAME>

![Tag](images/tag-object.png){ width=30% height=30% }

### Working areas

There are basically 4 areas you have to work with:

* The **working directory**:
    * it holds your project files
    * this is were you make changes
* The **staging area** (sometimes called *index* or *cache*):
    * this is were you `add` the snapshot of the files you want to commit to
      your repository
* The **local repository**:
    * this is were you `commit` your changes
    * this is held in the `.git` directory.
* The **remote repository**:
    * this is the reference that you use to `pull` the changes made by other
      developpers and `push` your own changes
    * this repository is *bare* (it contains no working copy)

## How to use git

### Moving from one area to another

![Operations Overview](images/operations-overview.png)

---

* commit
* add
* pull
* push
* checkout

### Merge conflict

One problem has still not be approached: when multiple people are working on
something, will it never conflict ?

* Original: "I love pancakes"
* User1: No, "I love beer" !
* User2: No, "I love coffee" !

```
<<<<<<< HEAD
I love beer
=======
I love coffee
>>>>>>> 986efb298f49c7fba6b850e38392513d7642476b
```

## Demonstration

### Initialization

```
$ git init
Initialized empty Git repository
in /home/horgix/demogit/.git/
```

### Status

```
$ git status
On branch master

Initial commit

nothing to commit (create/copy files
and use "git add" to track)
```

### File creation

```
$ echo 'a' > tstfile.txt
$ git status
On branch master
Initial commit
Untracked files:
  (use "git add <file>..." to include
  in what will be committed)
  tstfile.txt

nothing added to commit but untracked
files present (use "git add" to track)
```

### Add file

```
$ git add tstfile.txt
$ git status
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..."
  to unstage)

  new file:   tstfile.txt
```

### Commit

```
$ git commit -m "Add tstfile for demo"
[master (root-commit) c424e84]
Add tstfile for demo
 1 file changed, 1 insertion(+)
 create mode 100644 tstfile.txt
```
```
$ git status
On branch master
nothing to commit, working directory clean
```

### Logs

```
$ git log
commit c424e84e19333d92a744ef1d6b999363b2f640a5
Author: Alexis 'Horgix' Chotard <alexis.chotard@smile.fr>
Date:   Fri Dec 11 20:25:56 2015 +0100

    Add tstfile for demo
```
### Initialization

```
$ git init
Initialized empty Git repository
in /home/horgix/demogit/.git/
```

### Status

```
$ git status
On branch master

Initial commit

nothing to commit (create/copy files
and use "git add" to track)
```

### File creation

```
$ echo 'a' > tstfile.txt
$ git status
On branch master
Initial commit
Untracked files:
  (use "git add <file>..." to include
  in what will be committed)
  tstfile.txt

nothing added to commit but untracked
files present (use "git add" to track)
```

### Add file

```
$ git add tstfile.txt
$ git status
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..."
  to unstage)

  new file:   tstfile.txt
```

### Commit

```
$ git commit -m "Add tstfile for demo"
[master (root-commit) c424e84]
Add tstfile for demo
 1 file changed, 1 insertion(+)
 create mode 100644 tstfile.txt
```
```
$ git status
On branch master
nothing to commit, working directory clean
```

### Logs

```
$ git log
commit c424e84e19333d92a744ef1d6b999363b2f640a5
Author: Alexis 'Horgix' Chotard <alexis.chotard@smile.fr>
Date:   Fri Dec 11 20:25:56 2015 +0100

    Add tstfile for demo
```

### Demo

- Base operations
- Conflict Resolution
- Branching, rebasing, ...
