module ProjectEuler

include("problems/p_0001.jl")
include("problems/p_0002.jl")
include("problems/p_0003.jl")
include("problems/p_0004.jl")
include("problems/p_0005.jl")
include("problems/p_0006.jl")
include("problems/p_0007.jl")
include("problems/p_0008.jl")
include("problems/p_0009.jl")
include("problems/p_0010.jl")
include("problems/p_0011.jl")
include("problems/p_0012.jl")
include("problems/p_0013.jl")

solved_problems = [
    p_0001,
    p_0002,
    p_0003,
    p_0004,
    p_0005,
    p_0006,
    p_0007,
    p_0008,
    p_0009,
    p_0010,
    p_0011,
    p_0012,
    p_0013,
]

export solved_problems

end # module MyJuliaProject
