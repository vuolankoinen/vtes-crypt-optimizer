## Aloituskryptien arvioinnin kriteeri

kryptan_hyvyys <- function(krypta, n=10) {
    tulos <- 0
    for (kk in 1:n) { ## Monia simuloituja nostoja
        koe <- sample(1:nrow(krypta), 12)
        kr <- krypta[koe,]
        { # Varsinainen arviointi
            tulos <- tulos + sum(kr[1:4, "dom"])
            tulos <- tulos - sum(kr[1:4, "cap"])/3
            if (sum(kr[1:4,"BH"])==0) {tulos  <- tulos-10}
            if (sum(kr[1:4,"nec"])==0) {tulos  <- tulos-10}
        }
    }
    return(tulos)
}
