#!/usr/bin/env python
"""
mutt-mu

This is a script to search mail using mu
"""
import hashlib, sys
from commands import getoutput
from optparse import OptionParser


def command(cmd):
    return getoutput(cmd)


def main(dest_box):
    query = raw_input('Query: ')

    command('mu find --clearlinks --format=links --linksdir=%s %s' % (dest_box, query)).split('\n')


if __name__ == '__main__':
    p = OptionParser("usage: %prog [RESULTDIR]")
    (options, args) = p.parse_args()

    if args:
        dest = args[0]
    else:
        dest = '~/.mu/results'

    main(dest.rstrip('/'))
