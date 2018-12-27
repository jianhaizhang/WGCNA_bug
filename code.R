# The code to reproduce the bug is below.

library(WGCNA) # The package version was 1.66 when the bug was found.
load("all_data")
multiExpr <- list(r=list(data=ref), q=list(data=query))
multiColor <- list(r=col)
tab <- table(col); idx <- grep("^grey$", names(tab)); max.mod <- max(tab[-idx])
mp=modulePreservation(multiData=multiExpr, multiColor=multiColor,dataIsExpr=T, referenceNetworks=1, verbose=3, networkType="signed",nPermutations=1, maxGoldModuleSize=max.mod, maxModuleSize=max.mod)

# The bug is:
# Error in permOut[[iref]][[tnet]]$regStats[, , perm] <- as.matrix(cbind(datout[[1]]$quality[[2]][,  : 
#  number of items to replace is not a multiple of replacement length


