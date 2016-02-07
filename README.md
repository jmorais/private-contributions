Private Contributions
========

As not every contribution I make here on GitHub is public, I created a script that
takes all my private contributions and make public mirrors, so my Github contribution
graph is avaiable for any visitor in my profile.

Usage
-------

Create a repo where all your commits will be pushed and made public. Don't worry,
only the dates will be public. On this new repo, copy all files from Private
Contributions.

Create a file called `private_repos` and list, one per line, all your private
repos' paths. Use the expanded version, i.e., `/Users/jmorais/private-repo` instead
of `~/Users/jmorais/private-repo`.

Then, **read all the contents of install.sh and private_contributions.rb so you
can be sure nothing bad will happen with your files. If, by any misfortune, something
happens to you, it's not my fault. Use at your own risk**.

Now that you read and checked all executables, procced to install with

```
$ ./install.sh
```

After the install, your commits from repos listed on `private_repos` will be
published once a day on your repo.

How it works
-------

The script looks all your repos and make a list of all commit dates, with the
command `git --no-pager log --format=%cI`. All dates are then checked against
your public repo to avoid duplicates. Then, `ENV['GIT_AUTHOR_DATE']` and
`ENV['GIT_COMMITTER_DATE']` are set with the new dates, one by one. At each
step, a empty commit is made, with the command `git commit --allow-empty -m '[Private commit]'`.

Empty commits are, du'h, empty. Only the date from the real repo commit is copied
and then published. Github will use these dates to plot your contribution graphic.

Why
-------

Why would you want to share your private commits with the world? Well, if you're
looking for jobs, your recruiter can see you work a lot. If all your commits were
private *de facto*, he would see nothing and think you're a lazy developer.

Or, if you have a boss like I had, that went to check my contributions to the
company repo but forgot to log in. He obviously couldn't see anything and then
asked me to his office where he started to ask why I wasn't working hard or whatever.
I asked why he was talking like that, he said he saw my profile. I showed him, now
logged in, all my contributions. Got a day off as apologize for this confusion.

Then I started to mirror my private commits.

Credits
-------

Developed by José Morais ([@jmorais](https://github.com/jmorais))
