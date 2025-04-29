# cfa_analysis.R
# R script for Confirmatory Factor Analysis (CFA) and multi-group testing

# Load Libraries
library(lavaan)
library(semPlot)

# Load Data
data <- haven::read_dta("CP_weighted.dta")

# Replace missing values
data[data == -8 | data == -9] <- NA

# Select items for CFA
items <- c("centrality1", "centrality2", "centrality3", 
           "success1", "success2", "success3",
           "statusattitudes1", "statusattitudes2", "statusattitudes3",
           "envibeh1", "envibeh2", "envibeh3",
           "waste1", "waste2", "waste3",
           "consneg1", "consneg2", "consneg3",
           "happiness1", "happiness2", "happiness3")

data_cfa <- data[, items]

# Define CFA Model
model <- '
Materialism =~ centrality1 + centrality2 + centrality3 + success1 + success2 + success3
LuxuryOrientation =~ statusattitudes1 + statusattitudes2 + statusattitudes3
EnvironmentalConsciousness =~ envibeh1 + envibeh2 + envibeh3
Frugality =~ waste1 + waste2 + waste3 + consneg1 + consneg2 + consneg3 + happiness1 + happiness2 + happiness3
'

# Fit CFA
fit <- cfa(model, data=data_cfa, missing="fiml")

# Summary
summary(fit, fit.measures=TRUE, standardized=TRUE)

# Save standardized loadings
standardizedSolution(fit)

# Plot Path Diagram
semPaths(fit, whatLabels="std", layout="tree", edge.label.cex=0.8, sizeMan=5)

# Model Fit Indices
fitMeasures(fit, c("cfi", "tli", "rmsea", "srmr"))

# Optional: Multi-Group CFA (e.g., by gender)
data$gender_factor <- as.factor(data$gender)
fit_configural <- cfa(model, data=data_cfa, group="gender_factor", missing="fiml")
summary(fit_configural, fit.measures=TRUE, standardized=TRUE)

# Measurement invariance testing
measurementInvariance(model, data=data_cfa, group="gender_factor")
