library(randomForest)

set.seed(0)
train <- read.csv("./train.csv")
test <- read.csv("./test.csv")

rf <- randomForest(train[,-1], as.factor(train[,1]), importance = TRUE)

submission <- data.frame(ImageId = c(1:28000))
submission$Label <- predict(rf, test)
write.csv(submission, file="predictions.csv", row.names = FALSE)
