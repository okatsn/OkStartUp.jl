# When the `filter` option of `jldoctest` is enabled, what the regex pattern matched will be replaced by empty string. In the following use, empty spaces will be removed before validating the output and the expected.
# See also https://documenter.juliadocs.org/stable/man/doctests/#Filtering-Doctests
"""
`showtypetree(T)` shows the type tree of type `T`.
Please refer: https://en.wikibooks.org/wiki/Introducing_Julia/Types#Investigating_types

# Example

```jldoctest; filter = r"[\\n\\r\\t\\s.]"
julia> showtypetree(Number)
Number
        Complex
        Real
                AbstractFloat
                        BigFloat
                        Float16
                        Float32
                        Float64
                AbstractIrrational
                        Irrational
                Integer
                        Bool
                        Signed
                                BigInt
                                Int128
                                Int16
                                Int32
                                Int64
                                Int8
                        Unsigned
                                UInt128
                                UInt16
                                UInt32
                                UInt64
                                UInt8
                Rational
```

"""
function showtypetree(T, level=0)
    println("\t"^level, T)
    for t in InteractiveUtils.subtypes(T)
        showtypetree(t, level + 1)
    end
end

macro showtypetree(T)
    return quote
        showtypetree($T)
    end
end
