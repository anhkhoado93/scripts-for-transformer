# -*- coding: utf-8 -*-
import sys

def tokenize_characters(text):
    text = text.strip()
    tokens = [ch if ch != ' ' else '▁' for ch in text]
    return tokens


if __name__ == '__main__':
    for line in sys.stdin:
        text = line[:-1]
        tokens = tokenize_characters(text)[:2047]
        print(' '.join(tokens))