
##

source("krypta.R", encoding="utf-8")

source("kryptan-hyvyys.R", encoding="utf-8")

parhaat <- list()
indeksit <- c()
for (tt in 1:10) {
    indeksit  <- sample(1:nrow(krypta), 12, replace=TRUE)
    parhaat[[tt]] <- krypta[indeksit,]
}

## Funktio, joka muuntelee kryptaa satunnaisesti
muuntele  <- function(kr_vanha, pyyrit) {
    kr <- kr_vanha
    for (tt in 1:runif(1,1,4)) {
        if (runif(1)<0.05) { # Suurennetaan kryptaa
            uusi <- runif(1,1,nrow(pyyrit))
            kr <- rbind(kr, pyyrit[uusi,])
        } else {
            pois <- runif(1,1,nrow(kr))
            uusi <- runif(1,1,nrow(pyyrit))
            kr[pois,] <- pyyrit[uusi,]
        }
    }
    return(kr)
}
    
## Optimointisilmukka

for (tt in 1:50) {    
    haastajat <- parhaat
    for (ss in 1:length(haastajat)) {
        haastajat[[ss]] <- muuntele(haastajat[[ss]], krypta)
    }
    kaikki <- c(haastajat, parhaat)
    hyvyydet  <- numeric(length(kaikki))
    for (ss in 1:length(kaikki)) {
        for (kk in 1:10) { ## Monia simuloituja nostoja
            koe <- sample(1:nrow(kaikki[[ss]]), 12)
            hyvyydet[ss] <- hyvyydet[ss] + kryptan_hyvyys(kaikki[[ss]][koe,])
        }
    }
    kaikki <- kaikki[order(hyvyydet)]
    parhaat <- kaikki[1:10]
}
