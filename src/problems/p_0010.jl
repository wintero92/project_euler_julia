function p_0010(limit::Integer = 2_000_000)
    is_prime = trues(limit - 1)
    is_prime[1] = false

    for i = 2:sqrt(limit)
        if is_prime[convert(Int, i)]
            for j = i^2:i:limit-1
                is_prime[convert(Int, j)] = false
            end
        end
    end

    prime_sum = 0
    for i = 2:limit-1
        if is_prime[i]
            prime_sum += i
        end
    end

    return prime_sum
end
