context("Diffusion checks")
library(netcom)

# Unweighted and directed test matrices
matrix_1_input <- matrix(c(1,0,1,1,0,
                            0,1,0,1,0,
                            0,0,1,1,0,
                            1,0,1,1,0,
                            0,0,0,1,0),
                        nrow = 5, byrow = TRUE)

matrix_2_input <- matrix(c(0,1,1,0,0,1,1,1,0,1,
                            1,0,0,1,0,0,1,1,0,1,
                            1,1,0,1,1,0,0,1,0,0,
                            0,0,1,0,1,1,0,1,0,1,
                            1,1,1,0,1,1,0,1,1,0,
                            0,0,0,0,0,0,1,0,0,0,
                            1,1,0,0,1,0,0,0,1,1,
                            1,1,1,0,1,1,1,1,0,0,
                            0,1,0,0,0,0,1,0,1,0,
                            0,0,1,1,0,1,1,0,1,1),
                        nrow = 10, byrow = TRUE)


# OUTPUT ==================================================================================================
# The full alignment (including padding nodes) is:
#                              Network_1  Network_2	        Score
Alignment_with_Padding <- matrix(c(1,	        8,	        0.1416399,
                                    2,	        2,	        0.1225462,
                                    3,	        7,	        0.1561691,
                                    4,	        5,	        0.1392073,
                                    5,	        6,	        0.1122877,
                                    6,	        9,	        0.4250063,
                                    7,	        3,	        0.4561767,
                                    8,	        4,	        0.4538949,
                                    9,	        10,	        0.4622186,
                                    10,	      1,          0.4620291), 
                                ncol = 3, byrow = TRUE)
colnames(Alignment_with_Padding) = c("Network_1", "Network_2", "Score")

# The mean score of the alignment
Score <- 0.1343701
# The mean score of the full alignment (including padding nodes)
Score_with_Padding <- 0.2931176

# network_1_diffusion at each time step:
network_1_diffusion_1 <- matrix(c(0.3333333,	0,	0.3333333,	0.3333333,	0,	0,	0,	0,	0,	0,
                                0,	0.5,	0,	0.5,	0,	0,	0,	0,	0,	0,
                                0,	0,	0.5,	0.5,	0,	0,	0,	0,	0,	0,
                                0.3333333,	0,	0.3333333,	0.3333333,	0,	0,	0,	0,	0,	0,
                                0,	0,	0,	1,	0,	0,	0,	0,	0,	0,
                                0,	0,	0,	0,	0,	1,	0,	0,	0,	0,
                                0,	0,	0,	0,	0,	0,	1,	0,	0,	0,
                                0,	0,	0,	0,	0,	0,	0,	1,	0,	0,
                                0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                                0,	0,	0,	0,	0,	0,	0,	0,	0,	1), 
                                nrow = 10, byrow = TRUE)

network_1_diffusion_2 <- matrix(c(0.2222222,	0,	0.3888889,	0.3888889,	0,	0,	0,	0,	0,	0,
                                0.1666667,	0.25,	0.1666667,	0.4166667,	0,	0,	0,	0,	0,	0,
                                0.1666667,	0,	0.4166667,	0.4166667,	0,	0,	0,	0,	0,	0,
                                0.2222222,	0,	0.3888889,	0.3888889,	0,	0,	0,	0,	0,	0,
                                0.3333333,	0,	0.3333333,	0.3333333,	0,	0,	0,	0,	0,	0,
                                0,	0,	0,	0,	0,	1,	0,	0,	0,	0,
                                0,	0,	0,	0,	0,	0,	1,	0,	0,	0,
                                0,	0,	0,	0,	0,	0,	0,	1,	0,	0,
                                0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                                0,	0,	0,	0,	0,	0,	0,	0,	0,	1),
                                nrow = 10, byrow = TRUE)

network_1_diffusion_4 <- matrix(c(0.2006173,	0,	0.3996914,	0.3996914,	0,	0,	0,	0,	0,	0,
                                0.1990741,	0.0625,	0.337963,	0.400463,	0,	0,	0,	0,	0,	0,
                                0.1990741,	0,	0.400463,	0.400463,	0,	0,	0,	0,	0,	0,
                                0.2006173,	0,	0.3996914,	0.3996914,	0,	0,	0,	0,	0,	0,
                                0.2037037,	0,	0.3981481,	0.3981481,	0,	0,	0,	0,	0,	0,
                                0,	0,	0,	0,	0,	1,	0,	0,	0,	0,
                                0,	0,	0,	0,	0,	0,	1,	0,	0,	0,
                                0,	0,	0,	0,	0,	0,	0,	1,	0,	0,
                                0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                                0,	0,	0,	0,	0,	0,	0,	0,	0,	1),
                                nrow = 10, byrow = TRUE)

network_1_diffusion_8 <- matrix(c(0.2000005,	0,	0.3999998,	0.3999998,	0,	0,	0,	0,	0,	0,
                                0.1999993,	0.00390625,	0.3960941,	0.4000004,	0,	0,	0,	0,	0,	0,
                                0.1999993,	0,	0.4000004,	0.4000004,	0,	0,	0,	0,	0,	0,
                                0.2000005,	0,	0.3999998,	0.3999998,	0,	0,	0,	0,	0,	0,
                                0.2000029,	0,	0.3999986,	0.3999986,	0,	0,	0,	0,	0,	0,
                                0,	0,	0,	0,	0,	1,	0,	0,	0,	0,
                                0,	0,	0,	0,	0,	0,	1,	0,	0,	0,
                                0,	0,	0,	0,	0,	0,	0,	1,	0,	0,
                                0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                                0,	0,	0,	0,	0,	0,	0,	0,	0,	1),
                                nrow = 10, byrow = TRUE)

# The normalized entropies for each node (row) in each of these network_1_diffusion matrices are:
network_1_output_1 <- c(0.6826062, 0.4306766, 0.4306766, 0.6826062, 0.0000000, 0.0000000, 0.0000000, 0.0000000, 0.0000000, 0.0000000)
network_1_output_2 <- c(0.6640956, 0.8130822, 0.6388466, 0.6640956, 0.6826062, 0.0000000, 0.0000000, 0.0000000, 0.0000000, 0.0000000)
network_1_output_4 <- c(0.6557239, 0.7628215, 0.6550583, 0.6557239, 0.6570273, 0.0000000, 0.0000000, 0.0000000, 0.0000000, 0.0000000)
network_1_output_8 <- c(0.6554590, 0.6691084, 0.6554584, 0.6554590, 0.6554600, 0.0000000, 0.0000000, 0.0000000, 0.0000000, 0.0000000)


# network_2_diffusion at each time step:
network_2_diffusion_1 <- matrix(c(0,	0.1666667,	0.1666667,	0,	0,	0.1666667,	0.1666667,	0.1666667,	0,	0.1666667,
                                0.2,	0,	0,	0.2,	0,	0,	0.2,	0.2,	0,	0.2,
                                0.2,	0.2,	0,	0.2,	0.2,	0,	0,	0.2,	0,	0,
                                0,	0,	0.2,	0,	0.2,	0.2,	0,	0.2,	0,	0.2,
                                0.1428571,	0.1428571,	0.1428571,	0,	0.1428571,	0.1428571,	0,	0.1428571,	0.1428571,	0,
                                0,	0,	0,	0,	0,	0,	1,	0,	0,	0,
                                0.2,	0.2,	0,	0,	0.2,	0,	0,	0,	0.2,	0.2,
                                0.1428571,	0.1428571,	0.1428571,	0,	0.1428571,	0.1428571,	0.1428571,	0.1428571,	0,	0,
                                0,	0.3333333,	0,	0,	0,	0,	0.3333333,	0,	0.3333333,	0,
                                0,	0,	0.1666667,	0.1666667,	0,	0.1666667,	0.1666667,	0,	0.1666667,	0.1666667),
                                nrow = 10, byrow = TRUE)

network_2_diffusion_2 <- matrix(c(0.12380952,	0.09047619,	0.0515873,	0.09444444,	0.09047619,	0.0515873,	0.2515873,	0.09047619,	0.06111111,	0.09444444,
                                0.06857143,	0.10190476,	0.1352381,	0.03333333,	0.10857143,	0.1352381,	0.0952381,	0.10190476,	0.07333333,	0.14666667,
                                0.09714286,	0.09047619,	0.13047619,	0.04,	0.09714286,	0.13047619,	0.1019048,	0.17047619,	0.02857143,	0.11333333,
                                0.09714286,	0.09714286,	0.09047619,	0.07333333,	0.09714286,	0.09047619,	0.2619048,	0.09714286,	0.06190476,	0.03333333,
                                0.09795918,	0.14081633,	0.06462585,	0.05714286,	0.06938776,	0.06462585,	0.2632653,	0.12176871,	0.06802721,	0.05238095,
                                0.2,	0.2,	0,	0,	0.2,	0,	0,	0,	0.2,	0.2,
                                0.06857143,	0.12857143,	0.0952381,	0.07333333,	0.02857143,	0.0952381,	0.1733333,	0.10190476,	0.12857143,	0.10666667,
                                0.12653061,	0.12176871,	0.06462585,	0.05714286,	0.09795918,	0.06462585,	0.2156463,	0.12176871,	0.04897959,	0.08095238,
                                0.13333333,	0.17777778,	0,	0.06666667,	0.06666667,	0,	0.1777778,	0.06666667,	0.17777778,	0.13333333,
                                0.06666667,	0.12222222,	0.06111111,	0.06111111,	0.1,	0.06111111,	0.25,	0.06666667,	0.11666667,	0.09444444),
                                nrow = 10, byrow = TRUE)

network_2_diffusion_4 <- matrix(c(0.09804341,	0.1230933,	0.07532522,	0.06233396,	0.08137599,	0.07532522,	0.191172,	0.09643343,	0.09665499,	0.1002425,
                                0.10851649,	0.1300155,	0.06961551,	0.05059017,	0.10048384,	0.06961551,	0.1662386,	0.09288293,	0.09940866,	0.1126328,
                                0.1103264,	0.1262662,	0.0718165,	0.05193908,	0.10085792,	0.0718165,	0.1702421,	0.09657039,	0.09123259,	0.1089323,
                                0.10293955,	0.1263545,	0.07612489,	0.05788193,	0.08454409,	0.07612489,	0.1733762,	0.09793275,	0.0982143,	0.1065069,
                                0.09935786,	0.1244789,	0.07832698,	0.05868664,	0.08294387,	0.07832698,	0.174956,	0.09791309,	0.09735963,	0.10765,
                                0.09806803,	0.1266395,	0.06251247,	0.06253968,	0.08702041,	0.06251247,	0.2075737,	0.0894966,	0.09938322,	0.104254,
                                0.10456184,	0.1287064,	0.07144498,	0.05520605,	0.09174189,	0.07144498,	0.1674737,	0.09189971,	0.10444963,	0.1130709,
                                0.10048776,	0.1231296,	0.07628227,	0.05936692,	0.08567014,	0.07628227,	0.1833547,	0.0978185,	0.09347712,	0.1041308,
                                0.09492366,	0.1249201,	0.07064853,	0.06406349,	0.07926228,	0.07064853,	0.195617,	0.09174906,	0.10313026,	0.105037,
                                0.09795616,	0.128801,	0.073823,	0.05870282,	0.08123129,	0.073823,	0.1790336,	0.09468632,	0.1047585,	0.1071843),
                                nrow = 10, byrow = TRUE)

network_2_diffusion_8 <- matrix(c(0.1018434,	0.1265928,	0.07243498,	0.05770096,	0.08812272,	0.07243498,	0.1792614,	0.094337,	0.09956739,	0.1077043,
                                0.1016323,	0.1265262,	0.07259847,	0.05780846,	0.08782296,	0.07259847,	0.1794943,	0.09443549,	0.09953216,	0.1075511,
                                0.1016882,	0.1265065,	0.07261795,	0.05778251,	0.08788663,	0.07261795,	0.1794326,	0.09446813,	0.09945483,	0.1075446,
                                0.101752,	0.1265494,	0.07246304,	0.05776512,	0.08801375,	0.07246304,	0.1795453,	0.0943825,	0.09948689,	0.107579,
                                0.1017741,	0.1265655,	0.07242978,	0.05775013,	0.08805122,	0.07242978,	0.1795387,	0.09436784,	0.09949203,	0.1076009,
                                0.1018123,	0.1266595,	0.0725519,	0.05766218,	0.08801192,	0.0725519,	0.1787648,	0.09431643,	0.09981604,	0.107853,
                                0.1016421,	0.126551,	0.07252357,	0.05781777,	0.08784269,	0.07252357,	0.1795738,	0.09439034,	0.09957361,	0.1075615,
                                0.1018087,	0.1265683,	0.07247035,	0.05772032,	0.08807586,	0.07247035,	0.1793525,	0.09437772,	0.09950891,	0.107647,
                                0.1018076,	0.1266407,	0.0724367,	0.05770317,	0.08805386,	0.0724367,	0.1791424,	0.09429643,	0.09971655,	0.1077659,
                                0.1017574,	0.1265964,	0.07242067,	0.05774644,	0.08803084,	0.07242067,	0.179446,	0.09432381,	0.09960106,	0.1076567),
                                nrow = 10, byrow = TRUE) 

# The normalized entropies for each node (row) in each of these network_2_diffusion matrices are:
network_2_output_1 <- c(0.7781513, 0.69897, 0.69897, 0.69897, 0.845098, 0, 0.69897, 0.845098, 0.4771213, 0.7781513)
network_2_output_2 <- c(0.9469234, 0.9736336, 0.961204, 0.9419185, 0.9343521, 0.69897, 0.9673979, 0.9561502, 0.8686333, 0.9470874)
network_2_output_4 <- c(0.9773954, 0.9787089, 0.9792703, 0.981121, 0.9814598, 0.9682107, 0.9802711, 0.9793669, 0.974592, 0.9787123)
network_2_output_8 <- c(0.9787999, 0.9788111, 0.978832, 0.9787552, 0.9787431, 0.9789312, 0.9787694, 0.9787943, 0.9788199, 0.9787564)

# The cost matrix that is fed into the Hungarian algorithm
cost_matrix <- matrix(c(0.1362769,	0.1380574,	0.1364262,	0.1341308,	0.1392073,	0.2045498,	0.1374137,	0.1416399,	0.13469847,	0.1364863,
                        0.1324299,	0.1225462,	0.1216296,	0.120446,	0.1436419,	0.1450601,	0.1222111,	0.1447003,	0.09552845,	0.1325676,
                        0.1628076,	0.1567981,	0.1552376,	0.1530261,	0.1714132,	0.1564841,	0.1561691,	0.1735923,	0.12787284,	0.1629848,
                        0.1362769,	0.1380574,	0.1364262,	0.1341308,	0.1392073,	0.2045498,	0.1374137,	0.1416399,	0.13469847,	0.1364863,
                        0.2348626,	0.2209767,	0.2200264,	0.2187119,	0.2484118,	0.1122877,	0.2206073,	0.2496829,	0.17096411,	0.2349829,
                        0.4620291,	0.4577433,	0.4561767,	0.4538949,	0.4682685,	0.3860292,	0.45712,	0.4707448,	0.42500633,	0.4622186,
                        0.4620291,	0.4577433,	0.4561767,	0.4538949,	0.4682685,	0.3860292,	0.45712,	0.4707448,	0.42500633,	0.4622186,
                        0.4620291,	0.4577433,	0.4561767,	0.4538949,	0.4682685,	0.3860292,	0.45712,	0.4707448,	0.42500633,	0.4622186,
                        0.4620291,	0.4577433,	0.4561767,	0.4538949,	0.4682685,	0.3860292,	0.45712,	0.4707448,	0.42500633,	0.4622186,
                        0.4620291,	0.4577433,	0.4561767,	0.4538949,	0.4682685,	0.3860292,	0.45712,	0.4707448,	0.42500633,	0.4622186),
                    nrow = 10, byrow = TRUE)





# Run the alignment algorithm
Test <- align(matrix_1_input, matrix_2_input, base = 2, characterization = "entropy", normalization = FALSE, unit_test = TRUE)

# Results of the unit tests
# Rounding to 5 digits prevents disagreements because of different numbers of reported digits
test_that("Alignment score", {
    expect_equal(round(Score, 5), round(Test$score, 5))
})

test_that("Alignment score with padding", {
    expect_equal(round(Score_with_Padding, 5), round(Test$score_with_padding, 5))
})

test_that("Node-level alignments", {
    expect_equal(round(Alignment_with_Padding, 5), round(Test$alignment_with_padding, 5))
})

test_that("Network 1's matrix representation is a Markov chain", {
    expect_equal(sum(rowSums(Test$network_1) == 1), 10)
})

test_that("Network 2's matrix representation is a Markov chain", {
    expect_equal(sum(rowSums(Test$network_2) == 1), 10)
})

test_that("Time points to sample the diffusion kernel", {
    expect_equal(Test$kernel_sampling, c(1,2,4,8))
})

test_that("Diffusion kernel on Network 1 at time point 1", {
    expect_equal(round(Test$network_1_diffusion_1, 5), round(network_1_diffusion_1, 5))
})

test_that("Diffusion kernel on Network 1 at time point 2", {
    expect_equal(round(Test$network_1_diffusion_2, 5), round(network_1_diffusion_2, 5))
})

test_that("Diffusion kernel on Network 1 at time point 4", {
    expect_equal(round(Test$network_1_diffusion_4, 5), round(network_1_diffusion_4, 5))
})

test_that("Diffusion kernel on Network 1 at time point 8", {
    expect_equal(round(Test$network_1_diffusion_8, 5), round(network_1_diffusion_8, 5))
})

test_that("Diffusion kernel on Network 2 at time point 1", {
    expect_equal(round(Test$network_2_diffusion_1, 5), round(network_2_diffusion_1, 5))
})

test_that("Diffusion kernel on Network 2 at time point 2", {
    expect_equal(round(Test$network_2_diffusion_2, 5), round(network_2_diffusion_2, 5))
})

test_that("Diffusion kernel on Network 2 at time point 4", {
    expect_equal(round(Test$network_2_diffusion_4, 5), round(network_2_diffusion_4, 5))
})

test_that("Diffusion kernel on Network 2 at time point 8", {
    expect_equal(round(Test$network_2_diffusion_8, 5), round(network_2_diffusion_8, 5))
})

test_that("Entropy of diffusion kernel on Network 1 at time point 1", {
    expect_equal(round(Test$network_1_output_1, 5), round(network_1_output_1, 5))
})

test_that("Entropy of diffusion kernel on Network 1 at time point 2", {
    expect_equal(round(Test$network_1_output_2, 5), round(network_1_output_2, 5))
})

test_that("Entropy of diffusion kernel on Network 1 at time point 4", {
    expect_equal(round(Test$network_1_output_4, 5), round(network_1_output_4, 5))
})

test_that("Entropy of diffusion kernel on Network 1 at time point 8", {
    expect_equal(round(Test$network_1_output_8, 5), round(network_1_output_8, 5))
})

test_that("Entropy of diffusion kernel on Network 2 at time point 1", {
    expect_equal(round(Test$network_2_output_1, 5), round(network_2_output_1, 5))
})

test_that("Entropy of diffusion kernel on Network 2 at time point 2", {
    expect_equal(round(Test$network_2_output_2, 5), round(network_2_output_2, 5))
})

test_that("Entropy of diffusion kernel on Network 2 at time point 4", {
    expect_equal(round(Test$network_2_output_4, 5), round(network_2_output_4, 5))
})

test_that("Entropy of diffusion kernel on Network 2 at time point 8", {
    expect_equal(round(Test$network_2_output_8, 5), round(network_2_output_8, 5))
})

test_that("Cost matrix", {
    expect_equal(round(Test$cost_matrix, 5), round(cost_matrix, 5))
})
