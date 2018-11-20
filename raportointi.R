## Kryptan arviointia.
## Palauttaa koenostojen viisi parasta ja viisi huonointa aloituskryptaa listana.

raportointi <- function(krypta) {
  ## Puuttuu: tittelit, tarkemmat capacity-arvot
  tulokset <- list()
  for (tt in 1:10) {
    tulokset[[tt]] <- krypta[1:12,]
  }
  parhaat <- rep(-10000000,5)
  huonoimmat <- rep(10000000,5)
  for (kk in 1:1000) { ## Monia simuloituja nostoja
    hyvyys <- 0
    koe <- sample(1:nrow(krypta), 12)
    kr <- krypta[koe,]
    ekat_4 <- unique(kr[1:4,]) # Tuplat eivät auta
    { # Varsinainen arviointi
      hyvyys <- hyvyys + sum(10-ekat_4[, "cap"]) # Pienemmät on parempia
      hyvyys <- hyvyys + sum(ekat_4[, "dom"]) # Enemmän domia on parempi
      hyvyys <- hyvyys + length(which(ekat_4[, "dom"]!=0)) # Ylipäätään dom
      hyvyys <- hyvyys + sum(ekat_4[, "tha"])*0.75  # Enemmän thaa on parempi
      hyvyys <- hyvyys + length(which(ekat_4[, "tha"]!=0))*0.75 # Ylipäätään tha
      if (sum(ekat_4[,"BH"])==0) { # Ei Black Handiä: haitta kuin kolme pyyriä ilman domia
        hyvyys  <- hyvyys-9
        if (kr[5,"BH"]==0) hyvyys <- hyvyys - 2
      }
      if (sum(ekat_4[,"aus"])==0) {hyvyys <- hyvyys -9}# Ei ausia: haitta kuin kolme pyyriä ilman domia
      if (sum(ekat_4[,"nec"])==0) {hyvyys <- hyvyys -8}# Ei neciä: haitta hiukan pienempi kuin ausin puutteessa
      if (sum(ekat_4[,"tha"])==0) {hyvyys <- hyvyys -12}# Ei thaumaa: haitta kuin ei domia kellään
      hyvyys <- hyvyys + sum(ekat_4[, "special"]) # Itse käsin merkityt arvot spessuille
      hyvyys <- hyvyys + sum(ekat_4[, "pre"])*0.1 + sum(kr[1:4, "pro"])*0.1 # Sivuhyötyjä anarkkikorteista
      sup_gov <- 0
      for (tt in sort(ekat_4[,"cap"], decreasing=TRUE)) { # DOM-pyyriä pienemmät pyyrit ovat hyviä
        hyvyys <- hyvyys + sup_gov * length(which(ekat_4[,"cap"]==tt))
        if (length(which(ekat_4[which(ekat_4[,"dom"]==2),"cap"]==tt))>0) {
          sup_gov <- sup_gov + 1
        }
      }
    }
    if (min(parhaat) < hyvyys) {
      ind <- which(parhaat==min(parhaat))[1]
      parhaat[ind] <- hyvyys
      tulokset[[ind]] <- rbind(kr[1:4,], c(rep(0,ncol(kr)-1), hyvyys))
    } 
    if (max(huonoimmat) > hyvyys) {
      ind <- which(huonoimmat==max(huonoimmat))[1]
      huonoimmat[ind] <- hyvyys
      tulokset[[5+ind]] <- rbind(kr[1:4,], c(rep(0,ncol(kr)-1), hyvyys))
    }
  }
  return(tulokset)
}
