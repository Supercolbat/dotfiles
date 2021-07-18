LINES, CHARS = 42, 88

message = [
    "hello",
    "world",
    "python"
]
LINE_COUNT = len(message)


for nth_line, element in enumerate(message):
    x = CHARS//2 - len(element)//2
    y = (LINES//2 - LINE_COUNT//2) + nth_line - ((LINE_COUNT+1) % 2)
    print("{} {} L{} C{}".format(nth_line, element, y, x))
