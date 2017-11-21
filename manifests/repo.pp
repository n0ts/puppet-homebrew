# Internal: Convert homebrew snapshot into a git repo.
#
# Examples
#
#   include homebrew::repo
class homebrew::repo (
  $installdir   = $homebrew::config::installdir,
  $min_revision = $homebrew::config::min_revision,
) inherits homebrew {

  file { $_::homebrew_root:
    ensure => 'directory',
    owner  => $::boxen_user,
    group  => 'staff',
    mode   => '0755',
  }

  if $::osfamily == 'Darwin' {
    homebrew_repo { $installdir:
      min_revision => $min_revision,
    } -> Package <| |>
  }
}
