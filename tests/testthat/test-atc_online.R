# ==================================================================== #
# TITLE                                                                #
# Antimicrobial Resistance (AMR) Data Analysis for R                   #
#                                                                      #
# SOURCE                                                               #
# https://github.com/msberends/AMR                                     #
#                                                                      #
# LICENCE                                                              #
# (c) 2018-2021 Berends MS, Luz CF et al.                              #
# Developed at the University of Groningen, the Netherlands, in        #
# collaboration with non-profit organisations Certe Medical            #
# Diagnostics & Advice, and University Medical Center Groningen.       # 
#                                                                      #
# This R package is free software; you can freely use and distribute   #
# it for both personal and commercial purposes under the terms of the  #
# GNU General Public License version 2.0 (GNU GPL-2), as published by  #
# the Free Software Foundation.                                        #
# We created this package for both routine data analysis and academic  #
# research and it was publicly released in the hope that it will be    #
# useful, but it comes WITHOUT ANY WARRANTY OR LIABILITY.              #
#                                                                      #
# Visit our website for the full manual and a complete tutorial about  #
# how to conduct AMR data analysis: https://msberends.github.io/AMR/   #
# ==================================================================== #

context("atc_online.R")

test_that("atc_online works", {
  skip_on_cran()
  skip_if_not(curl::has_internet())
  
  expect_gte(length(atc_online_groups(ab_atc("AMX"))), 1)
  expect_equal(atc_online_ddd(ab_atc("AMX"), administration = "O"), 1.5)
  expect_equal(atc_online_ddd(ab_atc("AMX"), administration = "P"), 3)
  expect_warning(atc_online_ddd(ab_atc("Novobiocin"), administration = "P"))
})
