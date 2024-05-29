function p_0002(below::Integer=4_000_000)::Integer
    f3::Integer = 2
    f6::Integer = 0
    r::Integer = 2
    s::Integer = 0
    while r < below
        s += r
        r = 4 * f3 + f6
        f6, f3 = f3, r
    end
    return s
end