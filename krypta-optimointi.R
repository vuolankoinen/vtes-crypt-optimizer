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
    for (tt in 1:sample(1:4,1)) {
        if (runif(1)<0.05) { # Suurennetaan kryptaa
            uusi <- sample(1:nrow(pyyrit),1)
            kr <- rbind(kr, pyyrit[uusi,])
        } else {
            if (nrow(kr)>12 && runif(1)<0.05) { # Otetaan kryptasta pois
                pois <- sample(1:nrow(kr),1)
                kr <- kr[-pois,]
            } else {
                pois <- sample(1:nrow(kr),1)
                uusi <- sample(1:nrow(pyyrit),1)
                kr[pois,] <- pyyrit[uusi,]
            }
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
        hyvyydet[ss] <- kryptan_hyvyys(kaikki[[ss]], 10)
    }
    kaikki <- kaikki[order(hyvyydet, decreasing=TRUE)]
    print(hyvyydet[order(hyvyydet, decreasing=TRUE)])
    parhaat <- kaikki[1:10]
}
