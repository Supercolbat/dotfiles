from lexer import Lexer

Lexer = Lexer()


class Colors:
    def __init__(self, curses):
        self.curses = curses

        self.init_colors()
        self.color_dict = {
            "COLOR_WHITE":    self.curses.color_pair(1),
            "COLOR_BLACK":    self.curses.color_pair(2),
            "COLOR_RED":      self.curses.color_pair(3),
            "COLOR_YELLOW":   self.curses.color_pair(4),
            "COLOR_GREEN":    self.curses.color_pair(5),
            "COLOR_BLUE":     self.curses.color_pair(6),
            "COLOR_CYAN":     self.curses.color_pair(7),
            "COLOR_MAGENTA":  self.curses.color_pair(8),
            "ATTR_BOLD":      self.curses.A_BOLD       ,
            "ATTR_ITALIC":    self.curses.A_ITALIC     ,
            "ATTR_UNDERLINE": self.curses.A_UNDERLINE
        }

    def init_colors(self):
        # Initialize colors
        self.curses.init_pair( 1 , self.curses.COLOR_WHITE   , self.curses.COLOR_BLACK )
        self.curses.init_pair( 2 , self.curses.COLOR_BLACK   , self.curses.COLOR_BLACK )
        self.curses.init_pair( 3 , self.curses.COLOR_RED     , self.curses.COLOR_BLACK )
        self.curses.init_pair( 4 , self.curses.COLOR_YELLOW  , self.curses.COLOR_BLACK )
        self.curses.init_pair( 5 , self.curses.COLOR_GREEN   , self.curses.COLOR_BLACK )
        self.curses.init_pair( 6 , self.curses.COLOR_BLUE    , self.curses.COLOR_BLACK )
        self.curses.init_pair( 7 , self.curses.COLOR_CYAN    , self.curses.COLOR_BLACK )
        self.curses.init_pair( 8 , self.curses.COLOR_MAGENTA , self.curses.COLOR_BLACK )

    def __getitem__(self, key):
        return self.color_dict[key]


class Colorizer:
    def __init__(self, curses):
        self.Colors = Colors(curses)

    def translate(self, string):
        raw_data = []
        tokens = Lexer.get_data(string)

        for token in tokens:
            # Make newlines a seperate element
            if token.name == "NEWLINE":
                raw_data.append("\n")

            # If the token name is TEXT, append the value to raw_data
            elif token.name == "TEXT":
                raw_data.append(token.value)

            # If the
            else:
                raw_data.append(self.Colors[token.name])

        for rd in raw_data:
            __import__('os').system("echo {} >> log".format(str(rd)))

        return raw_data
