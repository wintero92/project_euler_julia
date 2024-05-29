function p_0005(n::Integer=20)::Integer
    m::Int64 = 1
    for i in 1:n
        m = lcm(m, i)
    end
    return m
end