struct Floor    #define a data structure for the floor 
    L::Float64  #letting the compiler know that L will be a float
end

struct Needle
    x::Float64
    \theta::Float64 #Julia supports unicode
    \l::Float64
end    

function throw_needle(floor::Floor, \l::Float64)
    return Needle(floor.L * rand(),2*\pi*rand(),\l)
end

function intersection(needle::Needle, floor::Floor)
    if needle.x + needle.\l/2 * sin(needle.\theta) > floor.L
        return true
    elseif needle.x - needle.\l * sin(needle.\theta) < 0.0
        return true
    else
        return false
    end
end

function conduct_simulation(n_throws::Int, floor::Floor, \l::Float64)
    n_intersections = 0
    for t = 1:n_throws
        ndl = throw_needle(floor,\l)
        if intersection(ndl, floor)
            n_intersections += 1
        end
    end
    return n_intersections / n_throws
end

function analyrical_soln()
    return 2*floor.L / (\l * \pi)

floor = Floor(1.0)
\l = 0.5

prob_est = conduct_simulation(100000, floor, \l)
@printf("prob of intersection is: %f\n", prob_est)
println("analytical prob. is: ", analyrical_solution(floor, \l))

for i=1:10
    ndl = throw_needle()
    println(ndl)
end
    
ndl = Needle(1.0, \pi/2)
println(ndl)