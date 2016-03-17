all: LearnSnes.smc

clean:
	rm LearnSnes.obj LearnSnes.smc

LearnSnes.smc: LearnSnes.asm LearnSnes.link
	wla-65816 -vo LearnSnes.asm LearnSnes.obj
	wlalink -vr LearnSnes.link LearnSnes.smc
