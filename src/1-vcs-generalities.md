# Generalities on Version Control Systems (VCS)

## How you would build your own VCS

### Origin

[Tom Preston-Werner - The Git
Parable](http://tom.preston-werner.com/2009/05/19/the-git-parable.html)

### Context

* Your computer
* Some filesystem related commands
* Nothing else!
* You decide to write something (usually software)

### Objectives

* You are someone who is responsible!
* You want to:
    * have some "version" control to track modifications
    * be able to roll back things to a previous state easily

#### Snapshots

* Like photos (but we don't create books with it)
* "What if you could take snapshots of your codebase at any time and resurrect
  that code on demand?"

### Snapshots implementation

* Start working in a directory named "working"
* Try to write one feature at a time
* When completed, save every file and make a copy of the entire directory as
  `snapshot-0`
* Make sure to **never** modify the content of that snapshot (you wouldn't use
  a pen to edit a printed photo, wouldn't you ?)
* Next one will be `snapshot-1`

### Messages

* After a while, you need to know what is in those snapshots
* Add a "message" file with summary of work done and date

    $ cat message.txt
    Add vhost for mylittlepony.com
    Tue May 32 23:34:03 CEST 2016

=> easier to find something when needed

### Distributed

* Yay, your project is (almost) popular, and a friend wants to work with you!
* Send him/her every snapshot
* Your friend is working alone
* Comes back => you both have same snapshot numbers but with different content
  !
* No idea who wrote what

Solution :

* Snapshot messages will now include author name and email.
* Snapshopts will no longer have incremental numbers, but an ID, generated from
  a **hash of the message file**
* Since the message file includes message, author and date, its hash will be
  **unique**

### ID

    $ cat message.txt
    Add vhost for mylittlepony.com
    Tue May 32 23:34:03 CEST 2016

    $ sha1sum message.txt
    56d4cc0161970e1c11c967ec57a44e1dad321924  message.txt

    $ md5sum message.txt
    eb04f8985db86e9029e769c753e9a24e  message.txt

### Precedence

* But wait, how will I know the commits order then ?
* Include it in the message too !

---

Ancestor :

    $ cat snapshot-4ded0845aa2b1838f2495bcbc9c202fd018cd114/message.txt
    Add vhost for mylittleunicorn.com
    Tue May 32 23:34:03 CEST 2016
    $ sha1sum snapshot-4ded0845aa2b1838f2495bcbc9c202fd018cd114/message.txt
    4ded0845aa2b1838f2495bcbc9c202fd018cd114  message.txt

Result :

    $ cat snapshot-56d4cc0161970e1c11c967ec57a44e1dad321924/message.txt
    Add vhost for mylittlepony.com
    Tue May 32 23:34:03 CEST 2016
    Ancestor: 4ded0845aa2b1838f2495bcbc9c202fd018cd114

### Conclusion

Congratulations, you (almost) built your own VCS :)

However, you always want more "features" (branches ? tags ? whatever), so let's
jump into real Version Control Systems!

## Introduction to real Version Control Systems

### Why use a VCS

* Manage your source code (SCM)
* Keep a trace of every modification
* Come back to any previous state
* **Collaborate**

## VCS types/models/architectures

### cpold

    $ ls
    file                    file.OK       file.old.final
    file.2013-08-12         file.old      file.old.test
    file.2013-11-15.ok      file.OLD      file.horgix
    file.to-check           file.backup   file.old.not-working

---

![CommitStrip -Tuesday September 12th, 2017](images/commitstrip-versioning.jpg)

### Local

![local](images/local.png)

### Centralized

![centralized](images/centralized.png)

### Distributed

![distributed](images/distributed.png)

### Distributed model

Benefits:

* Full history available locally
* No need for network connection for usual operations
* No need for manager approval for day to day usage (branch, tag, merge ...)
* There is still a reference repository
* You can clone the reference repository or any existing clone

Drawbacks:

* Initial cloning can be long (full history)

### Some Version Control Systems

* Git
* Subversion (SVN)
* Mercurial
* GNU Bazaar
* CVS
* Perforce
* ...
