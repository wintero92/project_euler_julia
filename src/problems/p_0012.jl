function count_divisors(n::Integer)
    count = 0
    sqrt_n = floor(Int, sqrt(n))
    for i in 1:sqrt_n
        if n % i == 0
            if i * i == n
                count += 1
            else
                count += 2
            end
        end
    end
    return count
end

function p_0012(min_divisors::Integer = 500)
    n = 1
    triangle = 0
    while true
        triangle += n
        divisors = count_divisors(triangle)
        if divisors > min_divisors
            return triangle
        end
        n += 1
    end
end
