# your data
df <- data.frame(X=c(1,2,2,2,3,4),Y=c(1,2,2,3,3,4))
pts <- data.frame(X=c(2.1, 2.5), Y=c(2.3, 2.5))
library(RANN)
# for each point in pts, find the nearest neighbor from df
closest <- RANN::nn2(data = df, query = pts, k = 1)
# argument k sets the number of nearest neighbours, here 1 (the closest)
closest
# $nn.idx
# [,1]
# [1,]    3
# [2,]    5
# 
# $nn.dists
# [,1]
# [1,] 0.3162278
# [2,] 0.7071068
# Get coordinates of nearest neighbor
pts$X_snap <- df[closest$nn.idx, "X"]
pts$Y_snap <- df[closest$nn.idx, "Y"]
pts
#     X   Y X_snap Y_snap
# 1 2.1 2.3      2      2
# 2 2.5 2.5      3      3