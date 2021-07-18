import re


# =========== #
# = Classes = #
# =========== #

class Keyword:
    def __init__(self, name, regex):
        self.name = name
        self.regex = regex


class Token:
    def __init__(self, name, value=None):
        self.name = name
        self.value = value

    def __repr__(self):
        # For debugging purposes
        return "Token('{}', '{}')".format(self.name, self.value if self.value else "")


class Lexer:
    def __init__(self):
        self.text = ""
        self.keywords = []

        self.init_keywords()

    def init_keywords(self):
        # Initialize all the regex patterns for each color
        self.keywords.append(Keyword("COLOR_WHITE",    re.compile(r"{w}")))
        self.keywords.append(Keyword("COLOR_BLACK",    re.compile(r"{x}")))
        self.keywords.append(Keyword("COLOR_RED",      re.compile(r"{r}")))
        self.keywords.append(Keyword("COLOR_YELLOW",   re.compile(r"{y}")))
        self.keywords.append(Keyword("COLOR_GREEN",    re.compile(r"{g}")))
        self.keywords.append(Keyword("COLOR_BLUE",     re.compile(r"{b}")))
        self.keywords.append(Keyword("COLOR_CYAN",     re.compile(r"{c}")))
        self.keywords.append(Keyword("COLOR_MAGENTA",  re.compile(r"{m}")))
        self.keywords.append(Keyword("ATTR_BOLD",      re.compile(r"{B}")))
        self.keywords.append(Keyword("ATTR_ITALIC",    re.compile(r"{I}")))
        self.keywords.append(Keyword("ATTR_UNDERLINE", re.compile(r"{U}")))

    def get_data(self, string):
        tokens = []
        lexeme = ""

        index = 0

        while index < len(string):
            match = None

            # Match each keyword pattern to the string starting from index
            # If a match is found, append the given token to self.tokens
            for kw in self.keywords:
                match = kw.regex.match(string, index)
                if match:
                    # If a lexeme is stored, append it to self.tokens
                    if lexeme:
                        tokens.append(Token("TEXT", lexeme))
                        lexeme = ""

                    tokens.append(Token(kw.name))
                    break

            # If no pattern matches the string, append one character to lexeme
            # and shift the index forward by one
            # Otherwise, set the index to the end of the match
            if not match:
                # Stop at a new line
                if string[index] == "\n":
                    tokens.append(Token("TEXT", lexeme))
                    tokens.append(Token("NEWLINE"))
                    lexeme = ""
                else:
                    lexeme += string[index]

                index += 1
            else:
                index = match.end(0)

        if lexeme:
            tokens.append(Token("TEXT", lexeme))

        return tokens
