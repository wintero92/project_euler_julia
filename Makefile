.PHONY: test

test:
	julia --project=. -e "using Pkg; Pkg.test();"

perf:
	julia --project=. src/perf/perf.jl