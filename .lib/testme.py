

def testme(name_of_tex_file):
    from random import randint as random

    f = open(name_of_tex_file)
    code = f.read()
    t = code.find("\subsection{")
    lst = []
    while t != -1:
        lst.append(code[(t+12):(code[t:].find("}") + t)])
        code = code.replace("\subsection{", "", 1)
        t = code.find("\subsection{")
    for i in range(len(lst)):
        j = random(0, len(lst)-1)
        print(i+1, ". ", lst[j], sep="")
        input()
        lst.pop(j)


testme("/Users/pluttan/Desktop/_Сем1/BMSTU-1/АнГем/РК1/angemrk1.tex")
