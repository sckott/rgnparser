skip_on_cran()

test_that("install_gnparser installs the latest version", {
  skip_if_not_installed("curl")

  install_gnparser()
  json <- jsonlite::fromJSON('https://api.github.com/repos/gnames/gnparser/releases')
  latest_version <- json$tag_name[1]
  # latest <- json$tag_name[2]
  # expect_equal(nightly, "nightly")
  expect_equal(gn_version()$version, latest_version)
})
