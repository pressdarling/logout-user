# logout-user

`logout-user.plugin.zsh` is a custom plugin for `oh-my-zsh`
that provides a function to log out another macOS user 
session. Below is a brief documentation for the script: 

## Documentation

### Functionality

The `logout-user` function allows you to terminate another 
macOS user's session with`sudo launchctl bootout gui/suid].

### Usage

```zsh
logout-user [options] [username)
```

### Options

```zsh
-h, |--help : Displays help information about the command.
-n: Dry run mode. Displays the command that would be executed without actually running it.
```

## Examples

Display help:

```zsh
logout-user -h
```

Log out a user named `steve`:

```zsh
logout-user steve
```

Perform a dry run for the user `steve`:

```zsh
logout-user -n steve
```

### Features

* Validates the provided username.
* Prevents logging out the root user.
* Prompts for confirmation before executing the `logout` command.
* Supports username auto-completion via `compdef`.

## Installation

### `oh-my-zsh`

Clone the repository to your custom plugins directory:

```zsh
cd $ZSH_CUSTOM/plugins
git clone https://github.com/pressdarling/logout-user.git logout-user
```

Add the plugin to your `.zshrc` file:

```zsh
plugins=(... logout-user)
```

Reload your shell or restart your terminal.

```zsh
# with oh-my-zsh
omz reload

# without oh-my-zsh, silly way
source ~/.zshrc

# without oh-my-zsh, proper way
exec zsh
```

This plugin should work with most plugin managers, including `zplug`, `zinit`, `antibody`, `zgen`, `antigen`, `zgenom`, and `prezto`. 

```zsh
# with antibody
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# with antidote
antidote update

# with antigen
antigen reset && antigen apply

# with prezto
prezto-update

# with zgenom
zgenom reset && zgenom save

# with zim
zimfw install

# with zinit
zinit update && zinit creinstall

# with custom plugin manager
<custom-plugin-manager> reload
```



### Manual Installation

1. Download the `logout-user.plugin.zsh` file from the repository.
2. Save the script to your `$ZSH_CUSTOM/plugins/logout-user` directory:
	```zsh
	~/.oh-my-zsh/custom/plugins/logout-user/logout-user-plugin.zsh
	```
3. Add the plugin to your `.zshrc` file:
	```zsh
	plugins=(... logout-user)
	```

Save the script to your `$CUSTOM/plugins/logout-user` directory:
```zsh
Add the plugin to your zshre file:
plugins=(... logout-user)
Reload
your shell or restart your terminal.
