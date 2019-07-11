# Git Configurations

You can include all sub-configurations by appending:

```Git Config
[include]
  path = /Users/x/setup/config/git/git
```

**Do not use symlinks.** Relative paths in root `git` file won't be resolved correctly.
