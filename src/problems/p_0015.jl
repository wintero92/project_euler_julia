"""
    factorial(n::BigInt) -> BigInt

Calculates the factorial of a given non-negative integer `n`. The factorial of `n`, denoted `n!`, is the product
of all positive integers up to `n`. By definition, `0!` is `1`.

# Arguments
- `n::BigInt`: The non-negative integer for which to calculate the factorial.

# Returns
- `BigInt`: The factorial of the given number `n`.

# Examples
```julia
julia> factorial(BigInt(5))
120  # Explanation: 5! = 5 * 4 * 3 * 2 * 1 = 120

julia> factorial(BigInt(0))
1  # Explanation: 0! is defined as 1
"""
function factorial(n::BigInt)::BigInt
    if n == 0
        return BigInt(1)
    else
        return prod(BigInt(1):n)
    end
end

"""
    binomial_coefficient(n::BigInt, k::BigInt) -> BigInt

Compute the binomial coefficient, also known as "n choose k", which is the number of ways to choose `k` elements from a set of `n` elements without regard to order.

# Arguments
- `n::BigInt`: The total number of elements.
- `k::BigInt`: The number of elements to choose.

# Returns
- `BigInt`: The binomial coefficient.

# Example
```julia
julia> binomial_coefficient(BigInt(5), BigInt(2))
BigInt(10)
Notes

The function uses the formula: n! / (k! * (n - k)!).
It is optimized for BigInt to handle very large numbers.
"""
function binomial_coefficient(n::BigInt, k::BigInt)::BigInt
    # Check for edge cases
    if k > n
        return BigInt(0) # If k > n, binomial coefficient is 0
    elseif k == BigInt(0) || k == n
        return BigInt(1) # If k == 0 or k == n, binomial coefficient is 1
    end
    # Compute the binomial coefficient using the factorial formula
    return factorial(n) ÷ (factorial(k) * factorial(n - k))
end

"""
    p_0015(grid_size::BigInt = BigInt(20)) -> BigInt

Calculate the number of unique paths from the top-left corner to the bottom-right corner of a grid with a given size, moving only right or down.

# Arguments
- `grid_size::BigInt`: The size of the grid (default is 20).

# Returns
- `BigInt`: The number of unique paths.

# Example
```julia
julia> p_0015(BigInt(20))
BigInt(137846528820)
Notes

The number of unique paths in a grid of size n is given by the binomial coefficient C(2n, n), which represents the number of ways to choose n movements down from a total of 2n movements (n right and n down).
"""
function p_0015(grid_size::BigInt = BigInt(20))::BigInt
    # Calculate the number of unique paths using the binomial coefficient formula
    return binomial_coefficient(2 * grid_size, grid_size)
end
