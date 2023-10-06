$env.PATH = (
  | append $'($env.HOME)/bin'
  | append $'($env.HOME)/.cargo/bin'
  | append '/usr/local/bin'
  | append '/opt/homebrew/bin'
  | append ($env.PATH | split row (char esep))
)

$env.EDITOR = "nvim"

load-env {
  KUBECONFIG: $"($env.HOME)/.kube/config:($env.HOME)/movio/sources/bin/kube/config",
  AWS_CREDENTIAL_PROFILES_FILE: $"($env.HOME)/.aws/config",
  GOPROXY: "http://goproxy.tools.movio.co",
  GONOSUMDB: "github.com/movio/*",
}

def create_right_prompt [] {
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%d/%m/%Y %H:%M:%S')
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}

$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }
