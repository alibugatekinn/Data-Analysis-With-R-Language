library(testthat)

test_that("Veri tipleri doğru dönüştürülmüş mü?", {
  expect_is(movies$Score, "numeric")
  expect_is(movies$Runtime, "integer")
})

test_that("Sonuçlar doğru veri çerçevelerine dönüştürülmüş mü?", {
  expect_is(high_score_results, "data.frame")
  expect_is(low_score_results, "data.frame")
})

test_that("Ortalama süreler doğru hesaplanmış mı?", {
  expect_equal(high_score_avg_runtime, mean(high_score_movies$Runtime))
  expect_equal(low_score_avg_runtime, mean(low_score_movies$Runtime))
})

test_that("Yüksek ve düşük puanlı filmler doğru filtrelenmiş mi?", {
  expect_equal(high_score_movie_count, nrow(filter(movies, Score >= 5)))
  expect_equal(low_score_movie_count, nrow(filter(movies, Score < 5)))
})

test_that("Grafikler doğru oluşturulmuş mu?", {
  expect_true(!is.null(genre_plot1))
  expect_true(!is.null(director_plot1))
  expect_true(!is.null(genre_plot2))
  expect_true(!is.null(director_plot2))
})
