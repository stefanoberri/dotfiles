<blockquote class="twitter-tweet" data-lang="en-gb"><p lang="en" dir="ltr">No *you* have less friends than dotfiles.</p>&mdash; I Am Devloper (@iamdevloper) <a href="https://twitter.com/iamdevloper/status/1055033406449426432?ref_src=twsrc%5Etfw">24 October 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
# Set up working environments

This repository contains dotfiles, other configurations as well as little
scripts to automate the creation of a productive and coherent working
environment **I like** across different \*nix machines. My preferences might
not suite everybody :)

## Deploy the configuration files

After you have cloned this repository, to make dotfiles available in your `$HOME`
and install all vim plugins you can run

	./bootstrap.sh

If the target file already exists, nothing will happen and you will be warned
of files that would be overwritten. You can backup them. You can then run

	./bootstrap.sh --force

The deployment simply creates symbolic links to files in this folder and
install vim plugins in `$HOME/.vim/bundle`. That way, if you edit, for
instance, your `~/.bashrc` file, you will actually edit a file in the git
repository and that change can easily be tracked.

### Machine and user specific settings

Some settings are machine specific or user specific and should not be kept in
sync on git. Those files are named `extra*` and need to be manually __copied__
to the home directory with a leading dot (i.e. `extrarc` renamed as
`$HOME/.extrarc`), edited to reflect user or machine settings and not tracked.

# Further reading

## Bash source order

Here a schema of how files source each other. For a comprehensive description,
of bash behaviour see [this
link](https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html)

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
  - [Vim as an IDE by Jake Zimmermanl](https://blog.jez.io/vim-as-an-ide/)
