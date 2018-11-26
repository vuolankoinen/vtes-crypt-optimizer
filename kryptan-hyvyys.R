## Aloituskryptien arvioinnin kriteeri

kryptan_hyvyys <- function(krypta, n=100) {
  ## Puuttuu: tittelit, tarkemmat capacity-arvot
  tulos <- 0
  for (kk in 1:n) { ## Monia simuloituja nostoja
    koe <- sample(1:nrow(krypta), 12)
    kr <- krypta[koe,]
    ekat_4 <- unique(kr[1:4,]) # Tuplat eivät auta
    { # Varsinainen arviointi
      tulos <- tulos + 1.5*sum(10-ekat_4[, "cap"]) # Pienemmät on parempia
      tulos <- tulos + sum(ekat_4[, "dom"]) # Enemmän domia on parempi
      tulos <- tulos + length(which(ekat_4[, "dom"]!=0)) # Ylipäätään dom
      tulos <- tulos + sum(ekat_4[, "tha"])*1  # Enemmän thaa on parempi
      tulos <- tulos + length(which(ekat_4[, "tha"]!=0))*1 # Ylipäätään tha
      tulos <- tulos - length(which(ekat_4[, "title"]!=0)) # Tittelit miinusta, ei voi mennä anarkistiksi
      if (sum(ekat_4[,"BH"])==0) { # Ei Black Handiä: haitta kuin kolme pyyriä ilman domia...
        tulos  <- tulos-7
        if (kr[5,"BH"]==0) tulos <- tulos - 2 # ...jos ei kalastamallakaan löydy
      }
      if (sum(ekat_4[,"aus"])==0) {tulos <- tulos -9}# Ei ausia: haitta kuin kolme pyyriä ilman domia
      if (sum(ekat_4[,"nec"])==0) {tulos <- tulos -8}# Ei neciä: haitta hiukan pienempi kuin ausin puutteessa
      if (sum(ekat_4[,"tha"])==0) {tulos <- tulos -13}# Ei thaumaa: haitta kuin ei domia kellään (ei voi pelata CrimethInciä, jolloin pakan idea kaatuu)
      tulos <- tulos + sum(ekat_4[, "special"]) # Itse käsin merkityt arvot spessuille
      tulos <- tulos + sum(ekat_4[, "pre"])*0.1 + sum(kr[1:4, "pro"])*0.1 # Sivuhyötyjä anarkkikorteista
      sup_gov <- 0
      for (tt in unique(sort(ekat_4[,"cap"], decreasing=TRUE))) { # DOM-pyyriä pienemmät pyyrit ovat hyviä (sup-Govern-ketju)
        tulos <- tulos + sup_gov * length(which(ekat_4[,"cap"]==tt))
        if (length(which(ekat_4[which(ekat_4[,"dom"]==2),"cap"]==tt))>0) {
          sup_gov <- sup_gov + 1
        }
      }
    }
  }
  tulos <- tulos / n
  return(tulos)
}
