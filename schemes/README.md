# Schemes

color schemes.

## Guideline

- The background color represents the situation that line/word is in.
- The foreground color represents the category that word is belongs to.

The below table showes each color's system name ("colorX") and
the xterm color name for easily grasping the meanings each color has.
But, it is better not to be scolded by the xterm name.
You can set any color as you like.

|  name  |  xterm  | fg/bg |  Description                               |
|:------:|:-------:|:-----:|:-------------------------------------------|
| baseBG |   black |   bg  | Default (Darkest) Background               |
| baseBg |   black |   bg  | Darker Background (Used for gutter)        |
| baseBf |    grey |   bg  | Lighter Background (Used for popup menu)   |
| baseBF |  silver |   bg  | Lightest Background (Used for status bar)  |
| baseB1 |  maroon |   bg  | Error, Diff Deleted                        |
| baseB2 |   green |   bg  | Safety, Diff Inserted                      |
| baseB3 |   olive |   bg  | Visual Mode, Warning, Diff Changed         |
| baseB4 |    navy |   bg  | Normal Mode, Highlight                     |
| baseB5 |  purple |   bg  | Insert Mode, Emphasis                      |
| baseFG |   white |   fg  | Default Foreground                         |
| baseFg |   white |   fg  | Comments, Invisible                        |
| baseF1 |     red |   fg  | Error, Exception                           |
| baseF2 |  orange |   fg  | Todo                                       |
| baseF3 |  yellow |   fg  | Emphasis (Used for highlighting)           |
| baseF4 |    lime |   fg  | Statement (Conditional, Repeat), Special   |
| baseF5 |    aqua |   fg  | Constant (Number, String)                  |
| baseF6 |    blue |   fg  | Identifier(Function), Heading              |
| baseF7 | fuchsia |   fg  | Preprocesser (Include, Define), Link       |

## Directory & File

```
- /sources.yaml
- /schemes/
    +- scheme-group-A/
    |   +- scheme-1.yaml
    |   +- scheme-2.yaml
    +- scheme-group-B/
        +- scheme-3.yaml
```

The directory name (with dashes as separator) under the "schemes" directory
represents "scheme group".
scheme group can contain some schemes.
YAML formatted file (which filename with dashes as separator)
under the scheme group directory represents "scheme".

## Registration to sources.yaml

```source.yaml
schemes: [
    scheme-group-A,
    scheme-group-B,
]
```

all scheme (YAML file) under the regisrated scheme group
is automatically registered to the builder.

## Scheme File Format

```ansi.yaml
scheme: "ANSI"  # scheme name
author: "Ansi"  # author of scheme
base00: "000000"
base01: "800000"
base02: "008000"
base03: "808000"
base04: "000080"
base05: "800080"
base06: "008080"
base07: "c0c0c0"
base08: "808080"
base09: "ff0000"
base0A: "00ff00"
base0B: "ffff00"
base0C: "0000ff"
base0D: "ff00ff"
base0E: "00ffff"
base0F: "ffffff"
```

## Schemes

My favorite and original color schemes

- base16-circus-scheme
    - circus.yaml
        - [stepchowfun/base16-circus-scheme](https://github.com/stepchowfun/base16-circus-scheme)
- base16-classic-shceme
    - classic-dark.yaml
        - [detly/base16-classic-scheme](https://github.com/detly/base16-classic-scheme)
- base16-codeschool-scheme
    - codeschool.yaml
        - [blockloop/base16-codeschool-scheme](https://github.com/blockloop/base16-codeschool-scheme)
- base16-default-scheme
    - cupcake.yaml
    - default-dark.yaml
    - eighties.yaml
    - mocha.yaml
    - ocean.yaml
        - [chriskempson/base16-default-schemes](https://github.com/chriskempson/base16-default-schemes)
- base16-frontemare-scheme
    - frontemare.yaml
        - original color scheme
- base16-hybrid-scheme
    - hybrid-dark.yaml
        - color scheme for VIM: [w0ng/vim-hybrid](https://github.com/w0ng/vim-hybrid)
- base16-iceberg-scheme
    - iceberg.yaml
        - color scheme for VIM: [iceberg.vim](https://cocopon.github.io/iceberg.vim/)
- base16-materia-shceme
    - materia.yaml
        - [Defman21/base16-materia-scheme](https://github.com/Defman21/base16-materia-scheme)
- base16-nord-scheme
    - nord.yaml
        - [ada-lovecraft/base16-nord-scheme](https://github.com/ada-lovecraft/base16-nord-scheme)
- base16-onedark-scheme
    - onedark.yaml
        - [tilal6991/base16-onedark-scheme](https://github.com/tilal6991/base16-onedark-scheme)
- base16-twilight-scheme
    - twilight.yaml
        - [hartbit/base16-twilight-scheme](https://github.com/hartbit/base16-twilight-scheme)
- base16-tomorrow-scheme
    - tomorrow-night.yaml
        - [chriskempson/base16-tomorrow-scheme](https://github.com/chriskempson/base16-tomorrow-scheme)
    - tomorrow-night-bright.yaml
        - color scheme for VIM: [chriskempson/tomorrow-theme](https://github.com/chriskempson/tomorrow-theme)
- base16-unclaimed-schemes
    - ashes.yaml
    - bespin.yaml
    - embers.yaml
    - harmonic-dark.yaml
    - monokai.yaml
        - [chriskempson/base16-unclaimed-schemes](https://github.com/chriskempson/base16-unclaimed-schemes)
