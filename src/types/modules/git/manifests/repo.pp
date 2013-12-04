define git::repo(
  $repo_url,
  $target){

  file{$target:
    ensure => directory
  }

  # if $target/.git doesn't exist, clone the repo.
  # otherwise, rebase and pull from the remote repo.

  exec{"repo.clone":
    command   => "git clone $repo_url $target",
    require   => File['target.dir'],
    path      => '/usr/bin:/usr/sbin:/bin',
    unless    => "test -d $target/.git",
    logoutput => 'true'
  }

  exec{"repo.update":
    command   => 'git pull --rebase',
    require   => File['target.dir'],
    cwd       => "$target",
    path      => '/usr/bin:/usr/sbin:/bin',
    onlyif    => "test -d $target/.git",
    logoutout => 'true'
  }
}
