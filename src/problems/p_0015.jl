function factorial(n::BigInt)
    if n == 0
        return 1
    else
        return prod(1:n)
    end
end

function binomial_coefficient(n::BigInt, k::BigInt)
    return factorial(n) ÷ (factorial(k) * factorial(n - k))
end

function p_0015(grid_size::BigInt = BigInt(20))
    return binomial_coefficient(2 * grid_size, grid_size)
end
