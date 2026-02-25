generate_fishing_data <- function(n=10) {
  set.seed(67)

  data.frame(
    catch = runif(n, 10, 500), # Random catch between 50 and 500
    effort = runif(n, 1, 20),     # Random effort between 1 and 20
    gear_factor = runif(n, 0.5, 1.5) # Random gear factor between 0.5 and 1.5
  )
}
