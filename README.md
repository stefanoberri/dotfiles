## Deploy the dotfiles

After you have cloned this repository, you can run 

	./bootstrap.sh

To copy these files in your `$HOME`. If the target file already exists, 
nothing will happen and you will be warned of files that would be overwritten.
You can backup them. You can then run 

	./bootstrap.sh --force

The deployment simply creates symbolic links to files in this folder. That way,
if you edit your `~/.bashrc` file, you will actually edit a file in the git
repository and that change can easily be tracked. Also, you could get fancy and
have branches, but unexpected behaviour might happen.

## Bash source order

Here a schema of how files source each other. For a comprehensive description,
see [this link](https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html)
	
	.bash_profile
	    |-> .profile # not currently present
	    |-> .bashrc
	           |-> /etc/bashrc # system wide settings
	           |-> .extrarc # optional file not included for
		   |            # system-specific settings
	           |-> .aliases
	           |-> .bash_prompt
	           |-> .functions
	           |-> .inputrc # set variable INPUTRC

When you login, an interactive, login shell is started and `.bash_profile` is
sourced. When bash is called, then an interactive non-login shell is started
and `.bashrc` is sourced

## Useful links

- Difference between `.bashrc`, `.profile`, `.bash_profile` and behaviour of `bash`
  - http://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile
  - http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html
  - http://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile/183980
  - http://www.linuxfromscratch.org/blfs/view/6.3/postlfs/profile.html

- Other dotfiles repos
  - https://dotfiles.github.io/
  - [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)
