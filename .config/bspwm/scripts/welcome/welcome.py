import os
import sys
import traceback

import curses
import math
import functools

import argparse

from colorizer import Colorizer


# Parse arguments
parser = argparse.ArgumentParser(description="Display a message on the screen using the curses library.")
parser.add_argument("--file", "-f", help="path to the file to display", required=True)
args = parser.parse_args()

# Raise error if file does not exist at path
if not os.path.isfile(args.file):
    path = os.path.join(os.getcwd(), args.file)
    print("\033[0;31mFile could not be found at path:", path)
    sys.exit(1)

stdscr = curses.initscr()
curses.noecho()
curses.cbreak()
curses.curs_set(False)
stdscr.keypad(True)
curses.start_color()

LINES, CHARS = stdscr.getmaxyx()


if __name__ == "__main__":
    try:
        Colorizer = Colorizer(curses)
        
        with open(args.file) as file:
            message = file.read()
            LINE_COUNT = message.count("\n") + 1

            raw_data = Colorizer.translate(message)

        styles = []
        nth_line = 0
        # y_offset = 0  # word wrap soon™

        for element in raw_data:
            if element == "\n":
                nth_line += 1
                continue

            if isinstance(element, str):
                x = CHARS//2 - len(element)//2 + ((len(element)+1) % 2)
                y = (LINES//2 - LINE_COUNT//2) + nth_line - ((LINE_COUNT+1) % 2)

                # If at least 1 style exists, and element is a string, write to screen
                if styles:
                    # Join multiple styles with bitwise-or
                    stdscr.addstr(y, x, element, functools.reduce((lambda a,b: a|b), styles))
                    styles = []

                # If element is a string, write to screen
                else:
                    stdscr.addstr(y, x, element)

            # If element is an int (style), save to variable
            if isinstance(element, int):
                styles.append(element)

        stdscr.refresh()

        # Wait until user presses 'q' to exit
        # ... or not
        while stdscr.getch() == 113:
            continue
        

    except Exception as e:
        traceback.print_exc()

    finally:
        curses.echo()
        curses.nocbreak()
        curses.curs_set(True)
        stdscr.keypad(False)
        curses.endwin()
