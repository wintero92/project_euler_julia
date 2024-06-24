.PHONY: test

test:
	julia --project=. -e "using Pkg; Pkg.test();"

perf:
	julia --project=. src/perf/perf.jl

format:
	julia --project=. -e "using JuliaFormatter; format(\".\")"