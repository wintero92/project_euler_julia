using ProjectEuler
using BenchmarkTools
using StatsBase
using CSV
using DataFrames

problem_numbers = Int[]
minimum_times = Float64[]
maximum_times = Float64[]
mean_times = Float64[]
stddev_times = Float64[]
sigma_low_times = Float64[]
sigma_high_times = Float64[]

for (i, problem) in enumerate(solved_problems)
    result = @benchmark $problem()

    times_ns = result.times
    min_time = minimum(times_ns)
    max_time = maximum(times_ns)
    mean_time = mean(times_ns)
    stddev_time = std(times_ns)
    sigma_low = mean_time - stddev_time
    sigma_high = mean_time + stddev_time

    push!(problem_numbers, i)
    push!(minimum_times, min_time)
    push!(maximum_times, max_time)
    push!(mean_times, mean_time)
    push!(stddev_times, stddev_time)
    push!(sigma_low_times, sigma_low)
    push!(sigma_high_times, sigma_high)
end

df = DataFrame(
    Problem_Number = problem_numbers,
    Minimum_Time_ns = minimum_times,
    Maximum_Time_ns = maximum_times,
    Mean_Time_ns = mean_times,
    Stddev_Time_ns = stddev_times,
    Sigma_Low_ns = sigma_low_times,
    Sigma_High_ns = sigma_high_times,
)

CSV.write("julia_results.csv", df)

println("Benchmark results have been written to julia_results.csv")
