# Communication

Join us in the Summit Slack channel `faction-flawless`.

# Working with git

Clone this repository using git on your local system.

    git clone https://github.com/FlawlessFaction/2019-Main-Challenge.git

Create a branch to work on

    git checkout -b kevinmarquette-feature

Make your changes that you want to add to the repository. Then commit your files to your branch.

    git add -A
    git commit -m 'add new function do-something'

Then push your branch up to github so others can have access to it.

    git push -u origin

Once you push your changes, you will need to make a pull request to the master branch to commit the changes. Open to the github project and click the create pull request button.

    https://github.com/FlawlessFaction/2019-Main-Challenge/branches

Once you create your pull-request, call out "pull request out" and then say something in the slack channel. Someone will review and merge it.

## updating your feature branch

You should update your feature branch often during the competition. Run these commands to do that:

    git fetch
    git merge master/origin

It is also a good idea to refresh your feature branch from master before you push it.

## ask for help

If you run into issues, ask for help. These commands are a good jumpstart and should be most of what is needed for this competition. 

# VSCode Snippets 

We added snippets to this project.

* sFunction - creates an Advanced Function
* sDescribe - creates a Basic pester test

