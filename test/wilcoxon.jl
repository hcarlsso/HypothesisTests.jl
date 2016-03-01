using HypothesisTests, Base.Test

# Basic exact test
@test abs(pvalue(ExactSignedRankTest([1:10;], [2:2:20;])) - 0.0020) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([2:2:20;], [1:10;])) - 0.0020) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([1:10;], [2:2:16; -1; 1])) - 0.4316) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([2:2:16; -1; 1], [1:10;])) - 0.4316) <= 1e-4
show(IOBuffer(), ExactSignedRankTest([1:10;], [2:2:20;]))

# Exact with ties
@test abs(pvalue(ExactSignedRankTest([1:10;], [1:10;])) - 1) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([1:10;], [2:11;])) - 0.0020) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([2:11;], [1:10;])) - 0.0020) <= 1e-4
@test abs(pvalue(ExactSignedRankTest(1:10, [1:5; ones(5)])) - 0.0625) <= 1e-4
@test abs(pvalue(ExactSignedRankTest([1:5; ones(5)], [1:10;])) - 0.0625) <= 1e-4
show(IOBuffer(), ExactSignedRankTest([1:10;], [1:10;]))

# Approximate test
@test abs(pvalue(ApproximateSignedRankTest([1:10;], [2:2:20;])) - 0.005922) <= 1e-6
@test abs(pvalue(ApproximateSignedRankTest([2:2:20;], [1:10;])) - 0.005922) <= 1e-6
@test abs(pvalue(ApproximateSignedRankTest([1:10;], [2:2:16; -1; 1])) - 0.4148) <= 1e-4
@test abs(pvalue(ApproximateSignedRankTest([2:2:16; -1; 1], [1:10;])) - 0.4148) <= 1e-4
show(IOBuffer(), ApproximateSignedRankTest([1:10;], [2:2:20;]))

# Approximate with ties
@test abs(pvalue(ApproximateSignedRankTest([1:10;], [1:10;])) - 1) <= 1e-4
@test abs(pvalue(ApproximateSignedRankTest([1:10;], [2:11;])) - 0.001904) <= 1e-6
@test abs(pvalue(ApproximateSignedRankTest([2:11;], [1:10;])) - 0.001904) <= 1e-6
@test abs(pvalue(ApproximateSignedRankTest([1:10;], [1:5; ones(5)])) - 0.05906) <= 1e-5
@test abs(pvalue(ApproximateSignedRankTest([1:5; ones(5)], 1:10)) - 0.05906) <= 1e-5
show(IOBuffer(), ApproximateSignedRankTest([1:10;], [1:10;]))

# # Tests for automatic selection
@test abs(pvalue(SignedRankTest([1:10;], [2:2:20;])) - 0.0020) <= 1e-4
@test abs(pvalue(SignedRankTest([1:10;], [2:11;])) - 0.0020) <= 1e-4
show(IOBuffer(), SignedRankTest([1:10;], [2:2:20;]))

# One Sample tests
# P-value computed using R wilcox.test
@test abs(pvalue(SignedRankTest([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] - 10.1)) - 0.09460449) <= 1e-4
# P-value computed using R wilcox.test
@test abs(pvalue(SignedRankTest([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16] - 10.1)) - 0.1928101) <= 1e-4

# One Sample tests with ties
# P-value computed using R package exactRankTests wilcox.exact
@test abs(pvalue(SignedRankTest([1,2,3,4,5,6,7,10,10,10,10,10,13,14,15] - 10.1)) - 0.04052734) <= 1e-4
# P-value computed using R wilcox.test
@test abs(pvalue(SignedRankTest([1,2,3,4,5,6,7,10,10,10,10,10,13,14,15,16] - 10.1)) - 0.1021964) <= 1e-4
