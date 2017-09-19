# Hands-On : Git CLI

## Introduction

### Guidelines

- Run a `git status` as often as possible. Do not hesitate to abuse `git log`
  too, they're your best friends for this hands-on.

- Configure your shell to have git informations in your prompt!

- Configure git to have colors!

- Please, do not try to bypass steps or take a quick pick at the next slides,
  this hands-on will have no interest if you do that

- Git autocompletion

## Hands-on

### 1. New directory

Create a new directory called `hands-on-cli` and `cd` into it

### 2. Init `photobox.txt`

Create a file called `photobox.txt` with this content:

```
$ cat photobox.txt
We make magic happen
```

### 3. New git repository

Init a new git repository in your current directory

### 4. Commit `photobox.txt`

Make sure the current `photobox.txt` file lands in your local repository, with
a relevant commit name, like _"Initial commit: add magic"_

### 5. New `together` branch

Create a new branch called `together` and go to it by using `git checkout -b`

### 6. `together` branch name fix

Woops, after thinking about it, you don't want to name it like that.

Destroy the local branch, then create a new one named `feature/together` and go
to it by using something else that `git checkout -b` (hint: you need 2
commands). Make sure you're on the good branch before going to the next step
by checking `git branch` output

### 7. Init `values.txt`

Add a new file called `values.txt` with this content:

```
$ cat values.txt
We win alone
```

### 8. Commit `values.txt`

Reminder: spam `git status` !

Commit your new `values.txt` file with the following commit message: "Added win
together"

### 9. Fix commit message

We usually try to keep git commit messages in the imperative form.

Edit the commit message of the commit you just did to make it _"Add win
together"_

How? Take a look at the `man git commit` and look for `amend`
mention

### 10. New value

Ok cool we correctly added a second value, let's add a new one:

```
$ cat values.txt
We win alone
We love coffee
```

### 11. New value commit

Commit it

### 12. New value again

And a new one:

```
$ cat values.txt
We win alone
We love coffee
We believe in eachover
```

### 13. Commit this one too

Commit it, let's say with the _"Add believe in eachother to values"_ message

### 14. History manipualtion - Old commit removal

Oh no. What have you done? What is the coffee doing there?

Remove this commit from the history of your current branch by whatever mean you
want.

The most easy and straightforward way is to use `git rebase -i` but I encourage
you to test other ways on separate branches.

- Beware ~~dragons~~ conflicts!
- `git status` is your best friend

This is probably one of the hardest step of this first hands-on; feel free to
call your instructor (Hello!) right now if you don't understand what's
happening :)

### 15. Check `values.txt`

Ok so now the `values.txt` at the HEAD should be this:

```
$ cat values.txt
We win alone
We believe in eachover
```

Use `git show` to see the content of each commit of your current branch and
make sure you understand how everything landed there.

If the *"at the HEAD"* above is not clear for you, feel free to call your instructor.

### 16. Changelog

Store the current git history in a file. Let's do a :

`git log > CHANGELOG.txt`

### 17. Changelog commit

Commit this new `CHANGELOG.txt` file.

### 18. History manipulation - Old commit edit

What? One more mistake? Oh yes, the *"We win alone"* you mean.

Well, go and edit the commit that added this to fix it with *"We win
together"*! I'm talking about the `values.txt` file content here, not the
commit message.

### 19. Check `values.txt`

Ok so now you should have this:

```
$ cat values.txt
We win together
We believe in eachover
```

And your last commit should be the CHANGELOG addition.

### 20. Viewing history

So your history should look like this:

```
38a302ed4b4ee5b727e95056093811910aec1589 (HEAD -> feature/together) Add Changelog
45258247a27a38995130bf12a2030f4111b7efb1 Add believe in eachover to values
76c852d989437dc872c8e25c01db19790d85d94f Add win together
886aca8e6e0aeb083c3c1e12d3915a0d23d9baf6 (master) Initial commit: add magic
```

This was obtained by `git log --format=oneline`. Please experiment with other
formats by autocompleting `git log --format=<TAB TAB>`. If you don't have
autocompletion on git commands by now, this hands-on should be pretty horrible
for you.

### 21. Update Changelog

Update your CHANGELOG now, by running the `git log > CHANGELOG.txt` again,
add-ing it and commit-ing it with for example _"Update Changelog"_ as message
(it's poorly descriptive... but I couldn't find anything bettere here)

### 22. Viewing diff

Now, take a look at a `git diff` between the commit that added your
`CHANGELOG.txt` and the commit that updated it.

To get a "full" diff with more context, take a look at the `-U / --unified`
option of `git diff`.

Only 2 commits IDs (and the _"Add Changelog"_ commit) should appear in the
diff. The commits stayed the same metadata-wise, but their content changed so
their ID too!

### 23. Remove Changelogs

The Changelog was only here to make the difference pre-rebase / post-rebase
obvious.

Now that we don't need it anymore, purely drop the 2 last commits that concern
the Changelog from your branch.

Hint: take a loot at `git reset` options!

### 24. Current history

Your history should now look like this:

```
232fbb62082cadc23fd638755262e4269c4c9aff (HEAD -> feature/together) Add believe
f40599bfeb808ea9a7fb9135b95803186bb29047 Add win together
886aca8e6e0aeb083c3c1e12d3915a0d23d9baf6 (master) Initial commit: add magic
```

We now want to continue developing these 2 features _"Add win together"_ and
_"Add believe"_ in parallel. But they are in the same branch so... let's try to
get the _"Belive"_ part its own branch

### 25. `feature/believe` branch

Create a new branch **that starts from `master`** and call it
`feature/believe`.

### 26. Cherry-pick

Use `git cherry-pick` to get the commit _"Add believe"_ (and **only** this
commit, not the _"Together"_ one) into the `feature/believe` branch.

You should encounter a new conflict. Could you explain why? If not, call your
lord and savior the instructor! (and it even rhymes...)

### 27. Remove commit from `feature/together`

Go back to the `feature/together` branch and remove the _*Believe*_ commit that
has no longer any reason to be there.

Keep working on `feature/together` for the next steps.

### 28. Move values

From quite a time now we are contributing values to the `values.txt` instead of
the `photobox.txt`... let's fix that!

Append the content of `values.txt` to `photobox.txt` and remove the
`values.txt` file (both from your filesystem point of view and from the git
point of view !).

Create a new _"Move values back to main file"_ commit.

### 29. Squashing

We now want to contribute this _"Together"_ value to the main branch.

But merging both commits would be ugly, isn't it? Nobody cares that you used
the wrong filename in the first place.

Let's group them up in a single, clean commit! Use `git rebase -i` for that; no
`git squash` command exists.

### 30. Current history

You should have something like this on `feature/together`:

```
commit 94094535261b512553ff4e60feb8484c90dc2e95 (HEAD -> feature/together)
Author: Alexis Horgix Chotard <alexis.horgix.chotard@gmail.com>
Date:   Tue Sep 19 12:31:55 2017 +0200

    Add win together

    Move values back to main file

commit 886aca8e6e0aeb083c3c1e12d3915a0d23d9baf6 (master)
Author: Alexis Horgix Chotard <alexis.horgix.chotard@gmail.com>
Date:   Tue Sep 19 10:52:43 2017 +0200

    Initial commit: add magic
```

### 31. Merge into master

Now, include this new commit into master by using `git merge` or `git rebase`.
Then use the command of these 2 that you didn't chose to merge
`feature/believe` on master too, after doing the same operations to have
everything clean and in `photobox.txt`

### 32.

You should now have this in `master`:

```
1d200cab1af413f863f2229b34e2c9def0de2802 (HEAD -> master) Merge branch 'feature/believe'
d90cd134c09e3d76613f46137ceca9f15a0990b4 (feature/believe) Add believe
94094535261b512553ff4e60feb8484c90dc2e95 (feature/together) Add win together
886aca8e6e0aeb083c3c1e12d3915a0d23d9baf6 Initial commit: add magic
```

---

And this content:

```
$ cat photobox.txt
We make magic happen
We win together
We believe in eachother
```

Feel free to add the last missing value :)

### Final steps

- Take a look at `git log --graph --all` and over options
- Send me a `git shortlog` over Slack at `@horgix` if you want comments on it
- Take a look at `.gitignore` stuff
- Discuss what you done with people around you
- Coffee/Tea/Whatever time!
