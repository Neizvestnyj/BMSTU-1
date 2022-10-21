from random import randint
type = 1


def genbil(out):
    bil = 0
    while bil in out:
        bil = randint(0, 30)
    print(bil, end="")
    input()
    return out + [bil]


name = 1
if type == 1:
    out = [0, 20]
    bil = 0
    while len(out) != 31:
        if name == 0:
            print("Олег: ", end="")
            name += 1
        elif name == 1:
            print("Андрей: ", end="")
            name += 1
        else:
            print("Миша: ", end="")
            name = 0
        out = genbil(out)
elif type == 2:
    out1 = [0]
    out2 = [0]
    out3 = [0]
    while len(out1) + len(out2) + len(out3) != 93:
        print("Олег: ", end="")
        out1 = genbil(out1)
        print("Андрей: ", end="")
        out2 = genbil(out2)
        print("Миша: ", end="")
        out3 = genbil(out3)
