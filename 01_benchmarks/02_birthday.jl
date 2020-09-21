#=
## The data structure

This is the vector `v`. Its size is equal to the number of people in the planet. 
Each item in the *vector* represents the day each person was born. So

```
 Person:          1     2     3     4     5
               -------------------------------
 Vector:: v    |  1  |  4  |  1  |  7  |  6  |
               -------------------------------
                  ^     ^     ^     ^     ^
                      Day of birthday

 size(v) == n_people
 v[1] == Day of the year in which person 1 was born
 v[2] == Day of the year in which person 2 was born
 ...
 v[n] == Day of the year in which person 'n' was born

 The numbers in the vector are in the range `1...n_days`

```

## The process

It consists in testing all combinations in the vector `v` and test if there are two or more
people who were born the same day.
=#
using StaticArrays
using ProgressMeter

const n_days = 100
const n_people = 5
const total = n_days^n_people

function main()
	# Setup variables
	v = @MArray ones(Int64, n_people)
	n_coincidences::Int64 = zero(Int64)

    # Process: Test all combination in the vector v
	@showprogress for j::Int64 = 1:div(total,100):total
		for i::Int64 = j:j+div(total,100)-1
			# Check if there are two people who where born the same day
			if same_day(v)
				n_coincidences += 1
			end
            next_iteration(v, n_people, n_people, n_days)
		end
	end

    # Show results 
	println("Coincidences ", n_coincidences, "/", total, "=", n_coincidences/total*100,"%")
end


# Next iteration in the vector `v` of birthdays
# Vector `v` will contain all combinations
@inline function next_iteration(v, p, n_people, n_days)
	# `v` is the vector with birthdays
	# `p` is the index position that must be increased v[p]+=1
	@label start
	@inbounds if p < 1
		return
	elseif v[p] != n_days
		v[p] += 1
	else
		v[p] = 1
		next_iteration(v, p-1, n_people, n_days)
		@goto start
	end
	return nothing
end

# Are there two people who where born the same day?
@inline function same_day(v)
	n_people = length(v)
	@boundscheck(n_people >= firstindex(v) && n_people <= lastindex(v) || throw(BoundsError()))
	@inbounds for i = 1:n_people-1
		@inbounds for j = i+1:n_people
			if v[i] == v[j]		# There are two people who were born same day
				return true
			end
		end
	end
	return false
end

main()
