# Internal: Convert homebrew snapshot into a git repo.
#
# Examples
#
#   include homebrew::repo
class homebrew::repo (
  $installdir   = $homebrew::config::installdir,
  $min_revision = $homebrew::config::min_revision,
) inherits homebrew {

  if $::osfamily == 'Darwin' {
    homebrew_repo { $installdir:
      min_revision => $min_revision,
      require      => Class[homebrew],
    } -> Package <| |>
  }
}
