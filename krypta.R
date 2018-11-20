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

krypta <- rbind(krypta, data.frame("name"="Goratrix","cap"=10,"aus"=2,"dom"=2,"nec"=0,"pre"=0,"pro"=0,"tha"=2,"BH"=0,"title"=0,"special"=2))
krypta <- rbind(krypta, data.frame("name"="Vlad Tepes","cap"=10,"aus"=1,"dom"=2,"nec"=0,"pre"=0,"pro"=1,"tha"=2,"BH"=0,"title"=0,"special"=1.5))

krypta <- rbind(krypta, data.frame("name"="Oliver Thrace","cap"=9,"aus"=2,"dom"=2,"nec"=1,"pre"=0,"pro"=0,"tha"=2,"BH"=0,"title"=0,"special"=1))

krypta <- rbind(krypta, data.frame("name"="Marianna","cap"=8,"aus"=1,"dom"=2,"nec"=1,"pre"=0,"pro"=0,"tha"=2,"BH"=0,"title"=0,"special"=0.1))
krypta <- rbind(krypta, data.frame("name"="Ian Forestall","cap"=8,"aus"=2,"dom"=2,"nec"=1,"pre"=1,"pro"=1,"tha"=2,"BH"=0,"title"=0,"special"=0.1))
krypta <- rbind(krypta, data.frame("name"="Erichto","cap"=8,"aus"=2,"dom"=2,"nec"=0,"pre"=0,"pro"=0,"tha"=2,"BH"=0,"title"=0,"special"=0))

krypta <- rbind(krypta, data.frame("name"="Iliana","cap"=7,"aus"=0,"dom"=2,"nec"=0,"pre"=0,"pro"=1,"tha"=1,"BH"=0,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Bryan van Duesen","cap"=7,"aus"=1,"dom"=2,"nec"=0,"pre"=1,"pro"=0,"tha"=2,"BH"=0,"title"=0,"special"=1))
krypta <- rbind(krypta, data.frame("name"="Muaziz","cap"=7,"aus"=1,"dom"=1,"nec"=0,"pre"=0,"pro"=0,"tha"=2,"BH"=0,"title"=0,"special"=1))
krypta <- rbind(krypta, data.frame("name"="Blackhorse Tanner","cap"=7,"aus"=2,"dom"=2,"nec"=0,"pre"=0,"pro"=0,"tha"=0,"BH"=1,"title"=0,"special"=1))
krypta <- rbind(krypta, data.frame("name"="Carna","cap"=7,"aus"=2,"dom"=2,"nec"=0,"pre"=0,"pro"=0,"tha"=2,"BH"=0,"title"=1,"special"=1))
krypta <- rbind(krypta, data.frame("name"="Soldat","cap"=7,"aus"=0,"dom"=1,"nec"=0,"pre"=0,"pro"=1,"tha"=0,"BH"=1,"title"=0,"special"=0))

krypta <- rbind(krypta, data.frame("name"="Selena","cap"=6,"aus"=2,"dom"=2,"nec"=0,"pre"=0,"pro"=0,"tha"=2,"BH"=1,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Yasmin the Black","cap"=6,"aus"=2,"dom"=1,"nec"=0,"pre"=1,"pro"=0,"tha"=2,"BH"=1,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Marlene the Infernalist","cap"=6,"aus"=2,"dom"=2,"nec"=0,"pre"=0,"pro"=0,"tha"=1,"BH"=0,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Valois Sang","cap"=6,"aus"=2,"dom"=2,"nec"=1,"pre"=0,"pro"=0,"tha"=1,"BH"=0,"title"=0,"special"=0))

krypta <- rbind(krypta, data.frame("name"="Kurt Strauss","cap"=5,"aus"=1,"dom"=2,"nec"=0,"pre"=0,"pro"=0,"tha"=1,"BH"=0,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Banjoko","cap"=5,"aus"=0,"dom"=2,"nec"=0,"pre"=0,"pro"=0,"tha"=0,"BH"=1,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Cohn Rose","cap"=5,"aus"=1,"dom"=1,"nec"=0,"pre"=1,"pro"=0,"tha"=2,"BH"=0,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Wah Chun-Yuen","cap"=5,"aus"=0,"dom"=1,"nec"=0,"pre"=1,"pro"=0,"tha"=0,"BH"=1,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Isabelle Giovanni","cap"=5,"aus"=0,"dom"=2,"nec"=1,"pre"=0,"pro"=0,"tha"=0,"BH"=0,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Le Dinh Tho","cap"=5,"aus"=1,"dom"=1,"nec"=2,"pre"=0,"pro"=0,"tha"=0,"BH"=0,"title"=0,"special"=2))

krypta <- rbind(krypta, data.frame("name"="Gloria Giovanni","cap"=4,"aus"=0,"dom"=2,"nec"=1,"pre"=0,"pro"=0,"tha"=0,"BH"=0,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Ingrid Russo","cap"=4,"aus"=0,"dom"=2,"nec"=0,"pre"=0,"pro"=0,"tha"=0,"BH"=0,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Katherine Stoddard","cap"=4,"aus"=0,"dom"=1,"nec"=0,"pre"=0,"pro"=0,"tha"=0,"BH"=1,"title"=0,"special"=0.1))
krypta <- rbind(krypta, data.frame("name"="Thelonius","cap"=4,"aus"=1,"dom"=1,"nec"=0,"pre"=0,"pro"=0,"tha"=1,"BH"=0,"title"=0,"special"=0))

krypta <- rbind(krypta, data.frame("name"="Brooke","cap"=3,"aus"=0,"dom"=1,"nec"=0,"pre"=0,"pro"=0,"tha"=1,"BH"=0,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Erich Weiss","cap"=3,"aus"=0,"dom"=1,"nec"=0,"pre"=0,"pro"=0,"tha"=1,"BH"=0,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Ember Wright","cap"=3,"aus"=1,"dom"=1,"nec"=0,"pre"=0,"pro"=0,"tha"=0,"BH"=0,"title"=0,"special"=0))

krypta <- rbind(krypta, data.frame("name"="Ohanna","cap"=2,"aus"=0,"dom"=1,"nec"=0,"pre"=0,"pro"=0,"tha"=0,"BH"=0,"title"=0,"special"=0))
krypta <- rbind(krypta, data.frame("name"="Mustafa Rahman","cap"=2,"aus"=0,"dom"=1,"nec"=0,"pre"=0,"pro"=0,"tha"=0,"BH"=0,"title"=0,"special"=0))

krypta <- rbind(krypta, data.frame("name"="Anarch Convert","cap"=1,"aus"=0,"dom"=0,"nec"=0,"pre"=0,"pro"=0,"tha"=0,"BH"=0,"title"=0,"special"=0.2))
krypta <- rbind(krypta, data.frame("name"="Royce","cap"=1,"aus"=0,"dom"=1,"nec"=0,"pre"=0,"pro"=0,"tha"=0,"BH"=0,"title"=0,"special"=0))
