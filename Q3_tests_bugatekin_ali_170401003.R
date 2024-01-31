library(testthat)

# Veri setini yükleme
movies <- read.csv("movies.csv")

# Test 1: movies.csv dosyası yüklenmiş olmalıdır
test_that("movies.csv dosyası yüklenmiş olmalıdır", {
  expect_true(!is.null(movies))
})

# Test 2: Veri seti bir dataframe olmalıdır
test_that("Veri seti bir dataframe olmalıdır", {
  expect_is(movies, "data.frame")
})


test_that("IMDb Puanı Dağılımı Grafiği doğru mu?", {
  expected_plot <- ggplot(movies, aes(x = Score)) +
    geom_histogram(bins = 30, fill = "blue", color = "black") +
    labs(title = "IMDb Puanının Dağılımı", x = "IMDb Puanı", y = "Film Sayısı")
  test_plot <- ggplot_build(expected_plot)
  actual_plot <- ggplot_build(last_plot())
  expect_identical(actual_plot$data, test_plot$data)
  expect_identical(actual_plot$plot$layers, test_plot$plot$layers)
})





