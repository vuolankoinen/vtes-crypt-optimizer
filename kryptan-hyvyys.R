## Aloituskryptien arvioinnin kriteeri

kryptan_hyvyys <- function(krypta) {
    tulos <- 0
    tulos <- tulos + sum(krypta[1:4, "dom"])
    tulos <- tulos + sum(krypta[1:4, "cap"])/3
    }
