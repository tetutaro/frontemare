#!/usr/bin/env python3
# -*- coding:utf-8 -*-
from typing import List, Optional
import argparse
import curses
import os
import subprocess

import pkg_resources

FRONTEMARE_INSTALL_DIR = '~/.config/frontemare-shell'
FRONTEMARE_SCRIPT_PATH = '~/.frontemare.sh'
SHELL = os.environ['SHELL']

COLOR_NAMES = [
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
NUM_COLORS = len(COLOR_NAMES)


class Theme(object):
    def __init__(self, path):
        self.path = path
        filename = os.path.split(self.path)[1]
        self.name = os.path.splitext(filename)[0]

    def run_script(self):
        subprocess.Popen([SHELL, self.path])

    def setup(self):
        pass


def get_themes() -> List[Theme]:
    if not os.path.islink(
        os.path.expanduser(FRONTEMARE_INSTALL_DIR)
    ):
        raise ValueError("frontemare is not installed")
    scripts_dir = os.readlink(
        os.path.expanduser(FRONTEMARE_INSTALL_DIR)
    )
    return [
        Theme(os.path.join(scripts_dir, f))
        for f in sorted(os.listdir(scripts_dir))
    ]


def get_default_theme() -> Optional[Theme]:
    if not os.path.islink(
        os.path.expanduser(FRONTEMARE_SCRIPT_PATH)
    ):
        return None
    script_path = os.readlink(
        os.path.expanduser(FRONTEMARE_SCRIPT_PATH)
    )
    return Theme(script_path)


class PreviewWindow(object):
    def __init__(self, lines: int, cols: int, *args, **kwargs):
        self.lines = lines
        self.cols = cols
        self.window = curses.newwin(lines, cols, *args, **kwargs)

    def render(self):
        for i in range(NUM_COLORS):
            if i < 16:
                curses.init_pair(i, i, -1)
            else:
                curses.init_pair(i, -1, i)
            text = COLOR_NAMES[i]
            attr = curses.color_pair(i)
            rev_attr = attr + curses.A_REVERSE
            if 7 < i and i < 16:
                attr += curses.A_BOLD
                rev_attr += curses.A_BOLD
            self.window.addstr(i, len(text), text, rev_attr)
            self.window.addstr(i, 0, text, attr)
        self.window.refresh()


class ScrollListWindow(object):
    def __init__(self, lines, cols, *args, **kwargs):
        self.lines = lines
        self.cols = cols

        self.offset = 0
        self.selected = 0
        self.window = curses.newwin(lines, cols, **kwargs)
        self.data = []

    def set_data(self, data):
        self.data = data

    def up(self):
        if self.selected > 0:
            self.selected -= 1
        elif self.offset != 0:
            self.offset -= 1
        self.render()

    def down(self):
        if (self.offset + self.selected) > (len(self.data) - 2):
            pass
        elif self.selected == (self.lines - 1):
            self.offset += 1
        else:
            self.selected += 1
        self.render()

    def render(self):
        end = self.offset + self.lines
        line = 0
        for i, value in enumerate(self.data):
            if i < self.offset:
                continue
            elif i == end:
                break
            if line == self.selected:
                self.value = value
                attrs = curses.A_REVERSE
            else:
                attrs = 0
            self.window.addstr(line, 0, ' ' * (self.cols - 1), attrs)
            self.window.addstr(line, 0, value[:self.cols - 1], attrs)
            line += 1
        self.window.refresh()


def run_curses_app():
    stdscr = curses.initscr()
    stdscr.refresh()
    stdscr.keypad(True)
    curses.start_color()
    curses.use_default_colors()
    curses.curs_set(0)
    curses.noecho()
    default_theme = get_default_theme()
    themes = {s.name: s for s in get_themes()}
    scroll_list_cols = 35
    preview_cols = 35
    total_cols = scroll_list_cols + preview_cols
    scroll_list_win = ScrollListWindow(NUM_COLORS, scroll_list_cols)
    preview_win = PreviewWindow(NUM_COLORS, preview_cols, 0, scroll_list_cols)
    preview_win.render()
    scroll_list_win.set_data(sorted(themes.keys()))
    scroll_list_win.render()
    themes[scroll_list_win.value].run_script()
    while True:
        scroll_list_win.render()
        preview_win.render()
        c = stdscr.getch()
        if c == ord('j') or c == curses.KEY_DOWN:
            scroll_list_win.down()
            themes[scroll_list_win.value].run_script()
        elif c == ord('k') or c == curses.KEY_UP:
            scroll_list_win.up()
            themes[scroll_list_win.value].run_script()
        elif c == ord('q'):
            if default_theme is not None:
                default_theme.run_script()
            end_run()
        elif c == ord('\n'):
            theme = themes[scroll_list_win.value]
            theme.setup()
            end_run()
        elif c == curses.KEY_RESIZE:
            if curses.LINES < NUM_COLORS:
                raise ValueError('Terminal has less than 22 lines.')
            elif curses.COLS < total_cols:
                raise ValueError('Terminal has less than {} cols.'.format(
                    total_cols))


def end_run():
    curses.endwin()
    exit()


def main():
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawTextHelpFormatter,
        description="""
keys:
  j,up/k,down  move 1
  q            quit
  enter        enable theme and quit
""")
    # parser.add_argument(
    #     '--version',
    #     action='version',
    #     version=pkg_resources.get_distribution('frontemale').version
    # )
    parser.parse_args()

    try:
        run_curses_app()
    except KeyboardInterrupt:
        end_run()


if __name__ == '__main__':
    main()
