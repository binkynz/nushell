# vim: set filetype=nu :

$env.config = ($env.config | merge {
  show_banner: false
  edit_mode: vi
})

# direnv
$env.config = ($env.config | merge {
  hooks: {
    pre_prompt: [{ ||
      let direnv = (direnv export json | from json | default {})
      if ($direnv | is-empty) {
          return
      }
      $direnv
      | items {|key, value|
        {
          key: $key
          value: (if $key in $env.ENV_CONVERSIONS {
            do ($env.ENV_CONVERSIONS | get $key | get from_string) $value
          } else {
              $value
          })
        }
      } | transpose -ird | load-env
    }]
  }
})
