## Kryptan arviointia.

## Funktion raportointi keräämien tietojen sanallistamista.
tulosten_purku <- function(raportoitavat_tapaukset) {
  cat (raportoitavat_tapaukset[1], "Ei BH\n")
  cat (raportoitavat_tapaukset[2], "Ei aus\n")
  cat (raportoitavat_tapaukset[3], "Ei nec\n")
  cat (raportoitavat_tapaukset[4], "Ei tha\n")
  cat (raportoitavat_tapaukset[5], "Tuplat vampyyrista\n")
  cat (raportoitavat_tapaukset[6], "Vain yhtä tai kahta kokoa\n")
  cat (raportoitavat_tapaukset[7], "Ei alle 6-capia\n")
}

## Palauttaa koenostojen viisi parasta ja viisi huonointa aloituskryptaa listana, sekä joidenkin tapahtumien taajuuden.
## Puuttuu: eri lähteistä syntyvän hyvyyden eritteleminen.
raportointi <- function(krypta, iter = 10000) {
  tulokset <- list()
  raportoitavat_tapaukset <- numeric(7)
  for (tt in 1:10) {
    tulokset[[tt]] <- krypta[1:12,]
  }
  parhaat <- rep(-10000000,5)
  huonoimmat <- rep(10000000,5)
  for (kk in 1:iter) { ## Monia simuloituja nostoja
    hyvyys <- 0
    koe <- sample(1:nrow(krypta), 12)
    kr <- krypta[koe,]
    ekat_4 <- unique(kr[1:4,]) # Tuplat eivät auta
    { # Arviointi
      hyvyys <- hyvyys + nrow(ekat_4) # Jokainen pyyri on jonkin arvoinen
      hyvyys <- hyvyys + sum(10-ekat_4[, "cap"]) # Pienemmät on parempia
      hyvyys <- hyvyys + sum(ekat_4[, "dom"]) # Enemmän domia on parempi
      hyvyys <- hyvyys + length(which(ekat_4[, "dom"]!=0)) # Ylipäätään dom
      hyvyys <- hyvyys + sum(ekat_4[, "tha"])*0.75  # Enemmän thaa on parempi
      hyvyys <- hyvyys + length(which(ekat_4[, "tha"]!=0))*0.75 # Ylipäätään tha
      if (sum(ekat_4[,"BH"])==0) { # Ei Black Handiä: haitta kuin kolme pyyriä ilman domia
        hyvyys  <- hyvyys-9
        raportoitavat_tapaukset[1] <- raportoitavat_tapaukset[1]+1
        if (kr[5,"BH"]==0) hyvyys <- hyvyys - 2
      }
      if (sum(ekat_4[,"aus"])==0) {hyvyys <- hyvyys -9
      raportoitavat_tapaukset[2] <- raportoitavat_tapaukset[2]+1
      }# Ei ausia: haitta kuin kolme pyyriä ilman domia
      if (sum(ekat_4[,"nec"])==0) {hyvyys <- hyvyys -8
      raportoitavat_tapaukset[3]<-raportoitavat_tapaukset[3]+1
      }# Ei neciä: haitta hiukan pienempi kuin ausin puutteessa
      if (sum(ekat_4[,"tha"])==0) {
        hyvyys <- hyvyys -12
        raportoitavat_tapaukset[4]<-raportoitavat_tapaukset[4]+1
      }# Ei thaumaa: haitta kuin ei domia kellään
      hyvyys <- hyvyys + sum(ekat_4[, "special"]) # Itse käsin merkityt arvot spessuille
      hyvyys <- hyvyys + sum(ekat_4[, "pre"])*0.1 + sum(kr[1:4, "pro"])*0.1 # Sivuhyötyjä anarkkikorteista
      sup_gov <- 0
      for (tt in unique(sort(ekat_4[,"cap"], decreasing=TRUE))) { # DOM-pyyriä pienemmät pyyrit ovat hyviä
        hyvyys <- hyvyys + sup_gov * length(which(ekat_4[,"cap"]==tt))
        if (length(which(ekat_4[which(ekat_4[,"dom"]==2),"cap"]==tt))>0) {
          sup_gov <- sup_gov + 1
        }
      }
    }
    if (nrow(ekat_4)<4) {raportoitavat_tapaukset[5]<-raportoitavat_tapaukset[5]+1}
    if (length(unique(ekat_4$cap))<3) {raportoitavat_tapaukset[6]<-raportoitavat_tapaukset[6]+1}
    if (length(which(ekat_4$cap<6))==0) {raportoitavat_tapaukset[7]<-raportoitavat_tapaukset[7]+1}
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
  tulokset[[11]] <- raportoitavat_tapaukset
  tulosten_purku(raportoitavat_tapaukset/iter*100)
  return(tulokset)
}
