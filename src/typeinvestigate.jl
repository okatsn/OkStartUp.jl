"""
`showtypetree(T)` shows the type tree of type `T`.
Please refer: https://en.wikibooks.org/wiki/Introducing_Julia/Types#Investigating_types

# Example
```julia
showtypetree(Number)
```

"""
function showtypetree(T, level=0)
    println("\t"^level, T)
    for t in subtypes(T)
        showtypetree(t, level + 1)
    end
end
