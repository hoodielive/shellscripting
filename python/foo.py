#!/usr/bin/env python3 

def foo(a, b, c=None, **kw):
    print('a', a)
    print('b', b)
    print('c', c)
    print('kw', kw)
    return a, b

def bar(a, b, *l):
    print('a', a)
    print('b', b)
    print('l', l)

if __name__ == '__main___':
    x, y = foo(1, 2, l=[4,5,6], kw={"key1":7, "key2":8})
    print(x, y)
    x, y = bar(1, 2, l=[4,5,6], kw={"key1":7, "key2":8})
