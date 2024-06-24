function collatz_length(n, cache)
    original_n = n
    length = 0

    while n != 1 && n >= original_n
        if n % 2 == 0
            n ÷= 2
        else
            n = 3n + 1
        end
        length += 1
    end

    cache[original_n] = length + cache[n]
    return cache[original_n]
end

function p_0014(limit::Integer = 1_000_000)
    cache = Dict{Int,Int}()
    cache[1] = 1

    max_length = 0
    max_starting_number = 1

    for i = 2:limit-1
        length = collatz_length(i, cache)
        if length > max_length
            max_length = length
            max_starting_number = i
        end
    end

    return max_starting_number
end
