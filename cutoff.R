require(ROCR)

# Prepare data for plotting
data(ROCR.simple)
pred <- with(ROCR.simple, prediction(predictions, labels))
perf <- performance(pred, measure="acc", x.measure="cutoff")

# Get the cutoff for the best accuracy
bestAccInd <- which.max(perf@"y.values"[[1]])
bestMsg <- paste("best accuracy=", perf@"y.values"[[1]][bestAccInd], 
              " at cutoff=", round(perf@"x.values"[[1]][bestAccInd], 4))

plot(perf, sub=bestMsg)
