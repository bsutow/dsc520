# Assignment: Exercise 15
# Name: Sutow, Brett
# Date: 2020-10-31
install.packages('FNN')
library(FNN)
setwd("/Users/Brett/Desktop/dsc520-master")
binary_df<- read.csv("/Users/Brett/Desktop/dsc520-master/data/binary-classifier-data.csv")
trinary_df<- read.csv("/Users/Brett/Desktop/dsc520-master/data/trinary-classifier-data.csv")

#1.
plot(binary_df$x, binary_df$y)
ggplot( binary_df, aes(x= x, y= y)) + geom_point( )+
  labs(title= "X vs Y", x="X", y="Y")

plot(trinary_df$x, trinary_df$y)
ggplot( trinary_df, aes(x= x, y= y)) + geom_point( )+
  labs(title= "X vs Y", x="X", y="Y")
#2
normalize <-function(x) { (x -min(x))/(max(x)-min(x))   }
binary_norm <- as.data.frame(lapply(binary_df[,c(2:3)],normalize))
head(binary_norm)

data_split <- sample(1:nrow(binary_norm), .8 * nrow(binary_norm))
train<- binary_norm[data_split,]
head(train)
dim(train)

test<- binary_norm[-data_split,]

target_category<-binary_df[data_split, 2]
test_category<- binary_df[-data_split, 2]

target_category
test_category

binary3<- knn(train, test,cl=target_category, k=3)
binary3

binary5<- knn(train, test,cl=target_category, k=5)
binary5

binary10<- knn(train, test,cl=target_category, k=10)
binary10

binary15<- knn(train, test,cl=target_category, k=15)
binary15

binary20<- knn(train, test,cl=target_category, k=20)
binary20

binary25<- knn(train, test,cl=target_category, k=25)
binary25

tri_norm <- as.data.frame(lapply(trinary_df[,c(2:3)],normalize))
head(tri_norm)

data_split <- sample(1:nrow(tri_norm), .8 * nrow(tri_norm))
train2<- tri_norm[data_split,]
head(train2)
dim(train2)

test2<- tri_norm[-data_split,]

target_category1<-trinary_df[data_split, 3]
test_category1<- trinary_df[-data_split, 3]

target_category1
test_category1

tri3<- knn(train2, test2,cl=target_category1, k=3)
tri3

tri5<- knn(train2, test2,cl=target_category1, k=5)
tri5

tri10<- knn(train2, test2,cl=target_category1, k=10)
tri10

tri15<- knn(train2, test2,cl=target_category1, k=15)
tri15

tri20<- knn(train2, test2,cl=target_category1, k=20)
tri20

tri25<- knn(train2, test2,cl=target_category1, k=25)
tri25


#3 I believe that linear classifiers would work for both the binary and trinary plots.
# Looking at the data plotted it shows that there would be success using the linear classifiers.
# Through my understanding these plots would work with a linear type model.
















