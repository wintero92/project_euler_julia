function sieve_of_eratosthenes(limit)
    is_prime = trues(limit)
    is_prime[1] = false
    p = 2

    while p^2 <= limit
        if is_prime[p]
            for i = p^2:p:limit
                is_prime[i] = false
            end
        end
        p += 1
    end

    primes = []
    for p = 2:limit
        if is_prime[p]
            push!(primes, p)
        end
    end

    return primes
end

function p_0007(n::Integer = 10_001)
    limit = 200_000
    primes = sieve_of_eratosthenes(limit)

    while length(primes) < n
        limit *= 2
        primes = sieve_of_eratosthenes(limit)
    end

    return primes[10001]
end
