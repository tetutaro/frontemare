#!/usr/bin/env python3
# -*- coding:utf-8 -*-
"""Manager of FRONTEMARE color scheme system.

Preview color schemes and setup the selected color scheme.

Attributes:
    FRONTEMARE_SHELL_PATH (str):
        The pathname of shell script which setups colors for shell.
        Your shell config script will read this file.
    FRONTEMARE_SHELL_DIR (str):
        The directory name that color schemes for shell are installed.
    FRONTEMARE_FZF_BASH (str):
        The pathname of bash script which setups colors for fzf.
        If your shell is bash, bash config script will read this file.
    FRONTEMARE_FZF_ZSH (str):
        The pathname of zsh script which setups colors for fzf.
        If your shell is zsh, zsh config script will read this file.
    FRONTEMARE_FZF_DIR (str):
        The directory name that color schemes for fzf installed.
    FRONTEMARE_VIM_PATH (str):
        The pathname of vim script which setups colors for vim.
        Your vim config script will read this file.
    FRONTEMARE_VIM_DIR (str):
        The directory name that color schemes for vim installed.
"""

from typing import List, Optional
import argparse
import curses
import os
import subprocess
import pkg_resources

FRONTEMARE_SHELL_PATH = '~/.frontemare.sh'
FRONTEMARE_SHELL_DIR = '~/.config/frontemare-shell'
FRONTEMARE_FZF_BASH = '~/.fzf.bash'
FRONTEMARE_FZF_ZSH = '~/.fzf.zsh'
FRONTEMARE_FZF_DIR = '~/.config/frontemare-fzf'
FRONTEMARE_VIM_PATH = '~/.vim/colors.vim'
FRONTEMARE_VIM_RC = '''"" This file is automatically created by frontemare
if !exists('g:colors_name') || g:colors_name != '{theme}'
    colorscheme {theme}
endif
'''


def create_symlink(src: str, dst: str) -> None:
    """Create a symbolic link.

    Unlink destination if already exists and link it symbolically to source.

    Args:
        src (str):
            The pathname that is source of symbolic link
            expanded home directory(~).
        dst (str):
            The pathname that is destination of symbolic link
            expanded home directory(~).

    Returns:
        None

    Raises:
        OSError: If `dst` is already exists and not symbolic link
    """
    if not os.path.exists(src):
        raise ValueError("{} is not exists".format(src))
    if os.path.exists(dst):
        if not os.path.islink(dst):
            raise ValueError("{} is not symbolic link".format(dst))
        os.remove(dst)
    os.symlink(src, dst)
    return


class Theme(object):
    path = None
    name = None
    shell = os.environ['SHELL']

    def __init__(self, path: str) -> None:
        """Store the color scheme script and run, setup the script

        Args:
            path (str):
                The pathname of color scheme script
                expanded home directory.
        """
        self.path = path
        self.name = os.path.splitext(
            os.path.split(path)[1]
        )[0]
        return

    def run(self) -> None:
        """run the color scheme script"""
        subprocess.Popen([self.shell, self.path])

    def setup(self) -> None:
        """setup the color scheme script"""
        # shell
        create_symlink(self.path, os.path.expanduser(FRONTEMARE_SHELL_PATH))
        # bash fzf
        fzf_bash_path = os.path.expanduser(FRONTEMARE_FZF_BASH)
        fzf_bash_script = os.path.expanduser(
            os.path.join(FRONTEMARE_FZF_DIR, 'bash', self.name + '.bash')
        )
        create_symlink(fzf_bash_script, fzf_bash_path)
        # zsh fzf
        fzf_zsh_path = os.path.expanduser(FRONTEMARE_FZF_ZSH)
        fzf_zsh_script = os.path.expanduser(
            os.path.join(FRONTEMARE_FZF_DIR, 'zsh', self.name + '.zsh')
        )
        create_symlink(fzf_zsh_script, fzf_zsh_path)
        # vim
        vim_path = os.path.expanduser(FRONTEMARE_VIM_PATH)
        with open(vim_path, 'w') as wf:
            wf.write(FRONTEMARE_VIM_RC.format(theme=self.name))
        return


def get_themes() -> List[Theme]:
    if not os.path.islink(
        os.path.expanduser(FRONTEMARE_SHELL_DIR)
    ):
        raise ValueError("frontemare is not installed")
    scripts_dir = os.readlink(
        os.path.expanduser(FRONTEMARE_SHELL_DIR)
    )
    return [
        Theme(os.path.join(scripts_dir, f))
        for f in sorted(os.listdir(scripts_dir))
    ]


def get_default_theme() -> Optional[Theme]:
    if not os.path.islink(
        os.path.expanduser(FRONTEMARE_SHELL_PATH)
    ):
        return None
    script_path = os.readlink(
        os.path.expanduser(FRONTEMARE_SHELL_PATH)
    )
    return Theme(script_path)


class Window(object):
    color_names = [
        ' regular grey    ',
        ' regular red     ',
        ' regular lime    ',
        ' regular yellow  ',
        ' regular blue    ',
        ' regular magenta ',
        ' regular cyan    ',
        ' regular white   ',
        '    bold grey    ',
        '    bold red     ',
        '    bold lime    ',
        '    bold yellow  ',
        '    bold blue    ',
        '    bold magenta ',
        '    bold cyan    ',
        '    bold white   ',
        ' bgcolor maroon  ',
        ' bgcolor green   ',
        ' bgcolor olive   ',
        ' bgcolor navy    ',
        ' bgcolor purple  ',
        ' bgcolor teal    ',
        ' bgcolor silver  ',
    ]
    num_colors = len(color_names)
    scheme_list_columns = 35
    preview_columns = 35
    total_columns = scheme_list_columns + preview_columns


class PreviewWindow(Window):
    window = None

    def __init__(self) -> None:
        self.window = curses.newwin(
            self.num_colors,
            self.preview_columns,
            0,
            self.scheme_list_columns
        )
        return

    def render(self) -> None:
        for i in range(self.num_colors):
            if i < 16:
                curses.init_pair(i, i, -1)
            else:
                curses.init_pair(i, -1, i)
            text = self.color_names[i]
            attr = curses.color_pair(i)
            rev_attr = attr + curses.A_REVERSE
            if 7 < i and i < 16:
                attr += curses.A_BOLD
                rev_attr += curses.A_BOLD
            self.window.addstr(i, len(text), text, rev_attr)
            self.window.addstr(i, 0, text, attr)
        self.window.refresh()
        return


class SchemeListWindow(Window):
    themes = get_themes()
    offset = 0
    selected = 0
    window = None

    def __init__(self) -> None:
        self.window = curses.newwin(
            self.num_colors, self.scheme_list_columns, 0, 0
        )
        return

    def get_selected_theme(self) -> Theme:
        return self.themes[self.selected]

    def up(self) -> None:
        if self.selected > 0:
            self.selected -= 1
        elif self.offset != 0:
            self.offset -= 1
        self.render()

    def down(self) -> None:
        if (self.offset + self.selected) > (len(self.themes) - 2):
            pass
        elif self.selected == (self.num_colors - 1):
            self.offset += 1
        else:
            self.selected += 1
        self.render()
        return

    def render(self) -> None:
        end = self.offset + self.num_colors
        line = 0
        for i, theme in enumerate(self.themes):
            if i < self.offset:
                continue
            elif i == end:
                break
            if line == self.selected:
                attrs = curses.A_REVERSE
            else:
                attrs = 0
            self.window.addstr(
                line, 0, ' ' * (self.scheme_list_columns - 1), attrs
            )
            self.window.addstr(
                line, 0, theme.name, attrs
            )
            line += 1
        self.window.refresh()
        return


class WindowController(Window):
    stdscr = None
    scheme_list_window = None
    preview_window = None
    default_theme = get_default_theme()

    def __init__(self) -> None:
        self.scheme_list_window = SchemeListWindow()
        self.preview_window = PreviewWindow()
        return

    def run_default_theme(self) -> None:
        if self.default_theme is not None:
            self.default_theme.run()
        return

    def setup_theme(self) -> None:
        self.scheme_list_window.get_selected_theme().setup()
        return

    def render(self) -> None:
        self.scheme_list_window.get_selected_theme().run()
        self.scheme_list_window.render()
        self.preview_window.render()
        return

    def down(self) -> None:
        self.scheme_list_window.down()
        return

    def up(self) -> None:
        self.scheme_list_window.up()
        return


def run_curses_app() -> None:
    stdscr = curses.initscr()
    stdscr.refresh()
    stdscr.keypad(True)
    curses.start_color()
    curses.use_default_colors()
    curses.curs_set(0)
    curses.noecho()
    controller = WindowController()
    controller.render()
    while True:
        controller.render()
        c = stdscr.getch()
        if c == ord('j') or c == curses.KEY_DOWN:
            controller.down()
        elif c == ord('k') or c == curses.KEY_UP:
            controller.up()
        elif c == ord('q'):
            controller.run_default_theme()
            break
        elif c == ord('\n'):
            controller.setup_theme()
            break
        elif c == curses.KEY_RESIZE:
            if curses.LINES < controller.num_colors:
                controller.run_default_theme()
                raise ValueError(
                    'Terminal has less than {} lines.'.format(
                        controller.num_colors
                    )
                )
            elif curses.COLS < controller.total_columns:
                controller.run_default_theme()
                raise ValueError(
                    'Terminal has less than {} columns.'.format(
                        controller.total_columns
                    )
                )
    return


def end_run() -> None:
    try:
        curses.endwin()
    except KeyboardInterrupt:
        end_run()
    return


def main() -> None:
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawTextHelpFormatter,
        description="""
keys:
  j,up/k,down  move 1
  q            quit
  enter        enable theme and quit
""")
    parser.add_argument(
        '--version',
        action='version',
        version=pkg_resources.get_distribution('frontemare').version
    )
    parser.parse_args()
    try:
        run_curses_app()
    except Exception as e:
        end_run()
        print(e)
    else:
        end_run()
    return


if __name__ == '__main__':
    main()
