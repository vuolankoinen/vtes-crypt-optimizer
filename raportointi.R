## Kryptan arviointia.

## Funktion raportointi keräämien tietojen sanallistamista.
tulosten_purku <- function(raportoitavat_tapaukset, osuudet) {
  cat("Kryptan hyvyys: ", sum(osuudet), "\n")
  cat("\nMikä osuus kryptan hyvyydestä syntyi mistäkin lähteestä:\n")
  osuudet<-osuudet/sum(osuudet)*100
  cat(osuudet[1], " %  vampyyrien koko\n")
  cat(osuudet[2], " %  dominate\n")
  cat(osuudet[3], " %  dominate-ketju (kohteita isolle Governille)\n")
  cat(osuudet[4], " %  thaumaturgy\n")
  cat(osuudet[5], " %  pro ja pre\n")
  cat(osuudet[6], " %  tapaukset, joista puuttuu BH\n")
  cat(osuudet[7], " %  tapaukset, joista puuttuu aus\n")
  cat(osuudet[8], " %  tapaukset, joista puuttuu nec\n")
  cat(osuudet[9], " %  tapaukset, joista puuttuu thaumaturgy\n")
  cat(osuudet[10]," %  spessut\n")
  cat ("****\nMissä osuuksissa simuloituja aloituksia toteutui kukin skenaario:\n")
  cat(raportoitavat_tapaukset[1], "Ei BH\n")
  cat (raportoitavat_tapaukset[2], "Ei aus\n")
  cat (raportoitavat_tapaukset[3], "Ei nec\n")
  cat (raportoitavat_tapaukset[4], "Ei tha\n")
  cat (raportoitavat_tapaukset[5], "Tuplat vampyyrista\n")
  cat (raportoitavat_tapaukset[6], "Vain yhtä tai kahta kokoa\n")
  cat (raportoitavat_tapaukset[7], "Ei alle 6-capia\n")
}

## Palauttaa koenostojen parhaan ja huonoimman aloituskryptan listana, sekä joidenkin tapahtumien taajuuden.
## Puuttuu: eri lähteistä syntyvän hyvyyden eritteleminen.
raportointi <- function(krypta, iter = 10000) {
  tulokset <- list()
  esimerkkei <- 1*2 # Kuinka monta parasta ja huonointa palautetaan?
  raportoitavat_tapaukset <- numeric(7)
  for (tt in 1:esimerkkei) {
    tulokset[[tt]] <- krypta[1:12,]
  }
  parhaat <- rep(-10000000,esimerkkei)
  huonoimmat <- rep(10000000,esimerkkei)
  hyvyydet <- numeric(10)
  for (kk in 1:iter) { ## Monia simuloituja nostoja
    hyvyys <- numeric(10)
    koe <- sample(1:nrow(krypta), 12)
    kr <- krypta[koe,]
    ekat_4 <- unique(kr[1:4,]) # Tuplat eivät auta
    { # Arviointi
      hyvyys[1] <- hyvyys[1] + 0.8*sum(10-ekat_4[, "cap"]) # Pienemmät on parempia
      hyvyys[2] <- hyvyys[2] + sum(ekat_4[, "dom"]) # Enemmän domia on parempi
      hyvyys[2] <- hyvyys[2] + length(which(ekat_4[, "dom"]!=0)) # Ylipäätään dom
      hyvyys[4] <- hyvyys[4] + sum(ekat_4[, "tha"])  # Enemmän thaa on parempi
      hyvyys[4] <- hyvyys[4] + length(which(ekat_4[, "tha"]!=0)) # Ylipäätään tha
      if (sum(ekat_4[,"BH"])==0) { # Ei Black Handiä: haitta kuin kolme pyyriä ilman domia
        hyvyys[6]  <- hyvyys[6]-9
        raportoitavat_tapaukset[1] <- raportoitavat_tapaukset[1]+1
        if (kr[5,"BH"]==0) hyvyys[6] <- hyvyys[6] - 2
      }
      if (sum(ekat_4[,"aus"])==0) {hyvyys[7] <- hyvyys[7] -9
      raportoitavat_tapaukset[2] <- raportoitavat_tapaukset[2]+1
      }# Ei ausia: haitta kuin kolme pyyriä ilman domia
      if (sum(ekat_4[,"nec"])==0) {hyvyys[8] <- hyvyys[8] -8
      raportoitavat_tapaukset[3]<-raportoitavat_tapaukset[3]+1
      }# Ei neciä: haitta hiukan pienempi kuin ausin puutteessa
      if (sum(ekat_4[,"tha"])==0) {
        hyvyys[9] <- hyvyys[9] -12
        raportoitavat_tapaukset[4]<-raportoitavat_tapaukset[4]+1
      }# Ei thaumaa: haitta kuin ei domia kellään
      hyvyys[10] <- hyvyys[10] + sum(ekat_4[, "special"]) # Itse käsin merkityt arvot spessuille
      hyvyys[5] <- hyvyys[5] + sum(ekat_4[, "pre"])*0.1 + sum(kr[1:4, "pro"])*0.1 # Sivuhyötyjä anarkkikorteista
      sup_gov <- 0
      for (tt in unique(sort(ekat_4[,"cap"], decreasing=TRUE))) { # DOM-pyyriä pienemmät pyyrit ovat hyviä
        hyvyys[3] <- hyvyys[3] + sup_gov * length(which(ekat_4[,"cap"]==tt))
        if (length(which(ekat_4[which(ekat_4[,"dom"]==2),"cap"]==tt))>0) {
          sup_gov <- sup_gov + 1
        }
      }
    }
    if (nrow(ekat_4)<4) {raportoitavat_tapaukset[5]<-raportoitavat_tapaukset[5]+1}
    if (length(unique(ekat_4$cap))<3) {raportoitavat_tapaukset[6]<-raportoitavat_tapaukset[6]+1}
    if (length(which(ekat_4$cap<6))==0) {raportoitavat_tapaukset[7]<-raportoitavat_tapaukset[7]+1}
    if (min(parhaat) < sum(hyvyys)) {
      ind <- which(parhaat==min(parhaat))[1]
      parhaat[ind] <- sum(hyvyys)
      tulokset[[ind]] <- rbind(kr[1:4,], c(rep(0,ncol(kr)-1), sum(hyvyys)))
    } 
    if (max(huonoimmat) > sum(hyvyys)) {
      ind <- which(huonoimmat==max(huonoimmat))[1]
      huonoimmat[ind] <- sum(hyvyys)
      tulokset[[esimerkkei/2+ind]] <- rbind(kr[1:4,], c(rep(0,ncol(kr)-1), sum(hyvyys)))
    }
    hyvyydet <- hyvyydet + hyvyys
  }
  tulokset[[esimerkkei+1]] <- raportoitavat_tapaukset
  tulokset[[esimerkkei+2]] <- hyvyydet
  tulosten_purku(raportoitavat_tapaukset/iter*100, hyvyydet/iter)
  return(tulokset)
}
