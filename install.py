#!/usr/bin/env python3

from os import makedirs, walk
from os.path import abspath, join, expandvars, dirname, isdir
from string import Template
import codecs

# VARS = {
#     'FOREGROUND': 'a7a7a7',
#     'BACKGROUND': '1e1e1e',
#     'BLACK': '1e1e1e',
#     'BLACK2': '323537',
#     'RED': 'cf6a4c',
#     'RED2': 'cf6a4c',
#     'GREEN': '8f9d6a',
#     'GREEN2': '8f9d6a',
#     'YELLOW': 'f9ee98',
#     'YELLOW2': 'f9ee98',
#     'BLUE': '7587a6',
#     'BLUE2': '7587a6',
#     'MAGENTA': '9b859d',
#     'MAGENTA2': '9b859d',
#     'CYAN': 'afc4db',
#     'CYAN2': 'afc4db',
#     'WHITE': 'a7a7a7',
#     'WHITE2': 'ffffff',
# }

VARS = {
    "FOREGROUND": "abb2bf",
    "BACKGROUND": "282c34",
    "BLACK": "1e1e1e",
    "BLACK2": "323537",
    "RED": "e06c75",
    "RED2": "be5046",
    "GREEN": "98c379",
    "GREEN2": "98c379",
    "YELLOW": "e5c07b",
    "YELLOW2": "d19a66",
    "BLUE": "61afef",
    "BLUE2": "61afef",
    "MAGENTA": "c678dd",
    "MAGENTA2": "c678dd",
    "CYAN": "56b6c2",
    "CYAN2": "56b6c2",
    "WHITE": "abb2bf",
    "WHITE2": "ffffff",
}


def main():
    for root, dirs, files in walk("."):
        if ".git" in dirs:
            dirs.remove(".git")

        for f in files:
            if f.endswith(".tmpl"):
                handle_file(root, f)


def handle_file(path, filename):
    source = abspath(join(path, filename))
    target = abspath(join(expandvars("$HOME"), path, filename))
    target = target[0 : -len(".tmpl")]

    if not isdir(dirname(target)):
        print("Creaing directory %s" % dirname(target))
        makedirs(dirname(target))

    with codecs.open(source, encoding="utf-8") as source_file:
        data = source_file.read()
        template = Template(data)

    output = template.safe_substitute(VARS)
    print("Writing %s" % target)

    with codecs.open(target, "w", encoding="utf-8") as target_file:
        target_file.write(output)


if __name__ == "__main__":
    main()
