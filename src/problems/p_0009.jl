function p_0009(sum::Integer = 1000)
    for m in 2:floor(Int, sqrt(sum))
        for n in 1:(m - 1)
            a = m^2 - n^2
            b = 2 * m * n
            c = m^2 + n^2
            if a + b + c == sum
                return a * b * c
            end
        end
    end
    return nothing
end
