#!/usr/bin/env python3

from os import makedirs, walk
from os.path import abspath, join, expandvars, dirname, isdir
from string import Template

VARS = {
    'FOREGROUND': 'a7a7a7',
    'BACKGROUND': '1e1e1e',
    'BLACK': '1e1e1e',
    'BLACK2': '323537',
    'RED': 'cf6a4c',
    'RED2': 'cf6a4c',
    'GREEN': '8f9d6a',
    'GREEN2': '8f9d6a',
    'YELLOW': 'f9ee98',
    'YELLOW2': 'f9ee98',
    'BLUE': '7587a6',
    'BLUE2': '7587a6',
    'MAGENTA': '9b859d',
    'MAGENTA2': '9b859d',
    'CYAN': 'afc4db',
    'CYAN2': 'afc4db',
    'WHITE': 'a7a7a7',
    'WHITE2': 'ffffff',
}

def main():
    for root, dirs, files in walk('.'):
        if '.git' in dirs:
            dirs.remove('.git')

        for f in files:
            if f.endswith('.tmpl'):
                handle_file(root, f)

def handle_file(path, filename):
    source = abspath(join(path, filename))
    target = abspath(join(expandvars('$HOME'), path, filename))
    target = target[0:-len('.tmpl')]

    if not isdir(dirname(target)):
        print('Creaing directory %s' % dirname(target))
        makedirs(dirname(target))

    with open(source) as source_file:
        template = Template(source_file.read())

    output = template.safe_substitute(VARS)
    print('Writing %s' % target)

    with open(target, 'w') as target_file:
        target_file.write(output)

if __name__ == '__main__':
    main()
