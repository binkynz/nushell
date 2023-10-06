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

  keybindings: [
    {
      name: fuzzy_history
      modifier: control
      keycode: char_r
      mode: [emacs, vi_normal, vi_insert]
      event: [
        {
          send: ExecuteHostCommand
          cmd: "commandline (
            history
              | each { |it| $it.command }
              | uniq
              | reverse
              | str join (char -i 0)
              | fzf --read0 --layout=reverse --height=40% -q (commandline)
              | decode utf-8
              | str trim
          )"
        }
      ]
    }
  ]
})
