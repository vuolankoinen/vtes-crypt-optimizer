## Kryptakortit tiedostossa
## Tuonnempana tuonti Secret Librarysta suoraan 

options(stringAsFactors=FALSE)

krypta <- data.frame(character(0), numeric(0), numeric(0), numeric(0), numeric(0), numeric(0), numeric(0), numeric(0), numeric(0), numeric(0), numeric(0))
colnames(krypta) <- c("name","cap",
                      "aus",
                      "dom",
                      "nec",
                      "pre",
                      "pro",
                      "tha",
                      "BH","title","special")

krypta <- rbind(krypta, data.frame("name"="Oliver Thrace","cap"=9,"aus"=2,"dom"=2,"nec"=1,"pre"=0,"pro"=0,"tha"=2,"BH"=0,"title"=0,"special"=1))
krypta <- rbind(krypta, data.frame("name"="Marianna","cap"=8,"aus"=1,"dom"=2,"nec"=1,"pre"=0,"pro"=0,"tha"=2,"BH"=0,"title"=0,"special"=0.1))
krypta <- rbind(krypta, data.frame("name"="Ian Forestall","cap"=8,"aus"=2,"dom"=2,"nec"=1,"pre"=1,"pro"=1,"tha"=2,"BH"=0,"title"=0,"special"=0.1))
krypta <- rbind(krypta, data.frame("name"="Iliana","cap"=7,"aus"=0,"dom"=2,"nec"=0,"pre"=0,"pro"=1,"tha"=1,"BH"=0,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Bryan van Duesen","cap"=7,"aus"=1,"dom"=2,"nec"=0,"pre"=1,"pro"=0,"tha"=2,"BH"=0,"title"=0,"special"=1))
krypta <- rbind(krypta, data.frame("name"="Muaziz","cap"=7,"aus"=1,"dom"=1,"nec"=0,"pre"=0,"pro"=0,"tha"=2,"BH"=0,"title"=0,"special"=1))
krypta <- rbind(krypta, data.frame("name"="Blackhorse Tanner","cap"=7,"aus"=2,"dom"=2,"nec"=0,"pre"=0,"pro"=0,"tha"=0,"BH"=1,"title"=0,"special"=1))
krypta <- rbind(krypta, data.frame("name"="Carna","cap"=7,"aus"=2,"dom"=2,"nec"=0,"pre"=0,"pro"=0,"tha"=2,"BH"=0,"title"=1,"special"=1))


