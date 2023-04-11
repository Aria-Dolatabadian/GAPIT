#Import data
myY <- read.table("mdp_traits.txt", head = TRUE)
myGD <- read.table("mdp_numeric.txt", head = TRUE)
myGM <- read.table("mdp_SNP_information.txt", head = TRUE)

myG <- read.table("mdp_genotype_test.hmp.txt", head = FALSE)
myKI <- read.table("KSN.txt", head = FALSE)
myCV <- read.table("mdp_population_structure.txt", head = TRUE)


#GWAS

myGAPIT=GAPIT(
Y=myY[,c(1,2,3,4)], #fist column is ID
GD=myGD,
GM=myGM,
PCA.total=3,
model=c("Blink"),   # or model=c("FarmCPU", "Blink")    For more statistical methods. Power: BLINK > FarmCPU> MLMM > SUPER > ECMLM > CMLM > MLM > GLM
Multiple_analysis=TRUE)

#Kinship Matrix

myGAPIT <- GAPIT(
Y=myY,
G=myG,
KI=myKI,
CV=myCV
)




#Convert HapMap format to numerical

myG <- read.table("mdp_genotype_test.hmp.txt", head = FALSE)
myGAPIT <- GAPIT(G=myG, output.numerical=TRUE)
myGD= myGAPIT$GD
myGM= myGAPIT$GM
