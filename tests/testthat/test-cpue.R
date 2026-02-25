test_that("cpue calculates simple ratio correctly", {
  expect_equal(cpue(catch=100,effort=10), 10)
  expect_equal(cpue(50,2),25)
})


test_that("cpue works with vectors of data",{
  catches<-c(100,200,300)
  efforts<-c(10,10,10)
  expected_results <-c(10,20,30)

  expect_equal(cpue(catches, efforts), expected_results)
})

test_that("cpue returns numeric values",{
  expect_type(cpue(100, 10), "double")
})


test_that("gear_factor  standardization scales correctly",{
  expect_equal(cpue(100, 10, gear_factor=0.5),5)
  expect_equal(
    cpue(100, effort=10),
    cpue(100,10, gear_factor=1))
})

test_that("cpue handles missing data", {
  expect_true(is.na(cpue(NA_real_, 10)))
  expect_true(is.na(cpue(10,NA_real_)))

})


test_that("cpue works with generated data",{
  data<- generate_fishing_data(n=5)

  result <- cpue(data$catch, data$effort)

  expect_equal(
    result,
    c(34.052837 ,  9.064945 , 19.238772, 135.640053   ,6.371919)
  )
})

test_that("cpue matches reference data",{
   result <- cpue(reference_data$catch, reference_data$effort)

   expect_equal(result, reference_data$expected_cpue
  )
})

test_that("cpue provides informative message when verbose", {
  expect_message(
    cpue(c(100,200), c(10,20), verbose=TRUE), "Processing 2 records")

  expect_no_message(cpue(100,10))
})


## Snapshot tests

test_that("cpue errors when input is not numeric", {
  expect_snapshot(
    cpue("five", 10),
    error=TRUE
  )
})


