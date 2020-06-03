U = [['a', 1.0], ['b', 1.0], ['c', 1.0], ['d', 1.0]]
A = [['a', 1.0], ['b', 0.2], ['c', 0.3], ['d', 0.7]]
B = [['a', 0.6], ['b', 0.0], ['c', 0.4], ['d', 0.5]]


def uniteM(a, b):
    return [a[0], max(a[1], b[1])]


def uniteA(a, b):
    return [a[0], a[1] + b[1] - a[1] * b[1]]


def uniteL(a, b):
    return [a[0], min(1, a[1] + b[1])]


def intM(a, b):
    return [a[0], min(a[1], b[1])]


def intA(a, b):
    return [a[0], a[1] * b[1]]


def intL(a, b):
    return [a[0], max(0, a[1] + b[1] - 1)]


def stringify(a):
    return "({}, {})".format(a[0], round(a[1], 3))


funcs = [uniteM, uniteA, uniteL, intM, intA, intL]
results = map(lambda func: map(
    lambda t: func(t[1], B[t[0]]), enumerate(A)), funcs)

string = "\n".join(map(lambda sets: ", ".join(
    map(lambda set: stringify(set), sets)), results))

print(string)
