## 
set.seed(seed <- 413)
iter <- 0 #
source("krypta.R", encoding="utf-8")
source("kryptan-hyvyys.R", encoding="utf-8")

montako_rinnakkaista_kokeiltavana <- 3

parhaat <- list()
indeksit <- c()
for (tt in 1:montako_rinnakkaista_kokeiltavana) {
  parhaat[[tt]] <- sort(sample(1:nrow(krypta), 12, replace=TRUE))
}

## Funktio, joka tarkastaa, onko vektori listassa
on <- function(vektori, lista) {
  tulos <- FALSE
  for (tt in 1:length(lista)) {
    if (!tulos) {
      tulos <- all(lista[[tt]]==vektori)
    }
  }
  return(tulos)
}

## Funktio, joka muuntelee kryptaa satunnaisesti
muuntele  <- function(muunneltava, kokeillut, tarjokkaita=33) {
  kr <- muunneltava
  while (on(kr, kokeillut)) {
    for (tt in 1:sample(1:4,1)) {
      if (runif(1)<0.05) { # Suurennetaan kryptaa
        uusi <- sample(1:tarjokkaita,1)
        kr <- c(kr, uusi)
      } else {
        if (length(kr)>12 && runif(1)<0.05) { # Otetaan kryptasta pois
          pois <- sample(1:length(kr),1)
          kr <- kr[-pois]
        } else {
          pois <- sample(1:length(kr),1)
          uusi <- sample(1:tarjokkaita,1)
          kr[pois] <- uusi
        }
      }
      kr <- sort(kr)
    }
  }
  return(kr)
}

## Optimointisilmukka
aloitusaika <- proc.time()[3] #
while (proc.time()[3]-aloitusaika<3200) { #
  iter <- iter+1 #
  haastajat <- c(parhaat, parhaat, parhaat)
  for (ss in 1:length(haastajat)) {
    haastajat[[ss]] <- muuntele(haastajat[[ss]], c(parhaat,haastajat), nrow(krypta))
  }
  kaikki <- c(haastajat, parhaat)
  hyvyydet  <- numeric(length(kaikki))
  for (ss in 1:length(kaikki)) {
    hyvyydet[ss] <- kryptan_hyvyys(krypta[kaikki[[ss]],], 1000)
  }
  kaikki <- kaikki[order(hyvyydet, decreasing=TRUE)]
  parhaat <- kaikki[1:montako_rinnakkaista_kokeiltavana]
}
kryptaehdotukset <- lapply(parhaat,function(x){krypta[x,]})
save(kryptaehdotukset, file = paste0(seed, "-", iter, "-kryptaehdotukset.Rdat"))

#tiedostot <- list.files(pattern = "-krypt")
