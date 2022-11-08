def delpreamb(name_of_tex_file):
    file = open(name_of_tex_file)
    inf = file.read()
    inf = inf[(inf.find(r"\begin{document}")+16):
              inf.find(r"\end{document}")]
    file.close()
    file = open(
        name_of_tex_file[:name_of_tex_file.find(".tex")]+"_wp.tex", "w")
    file.write(inf)
    file.close()


delpreamb("/Users/pluttan/Desktop/_Сем1/BMSTU-1/АнГем/РК1/angemrk1.tex")
