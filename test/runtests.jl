using ProjectEuler
using Test

include("solutions.jl")

@testset "ProjectEuler.jl" begin
    for (i, f) in enumerate(solved_problems)
        @testset "Testing $f" begin
            @test f() == solutions[i]
        end
    end
end
