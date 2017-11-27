using Luxor

N = 250
paper_dim = [16 10]
scaling = 150

xy = (rand(Float64, (N, 2)).*paper_dim.-paper_dim./2).*scaling

# Points
points = [Point(xy[i,1], xy[i,2]) for i in 1:N]

# Distances
dx = xy[:,1] .- xy[:,1]'
dy = xy[:,2] .- xy[:,2]'
dxy = sqrt.(dx.^2 .+ dy.^2)

# Lines
lines = []
for i in 1:(N-1)
	dxi = dxy[i,:]
	cutoff = sort(dxi)[rand(1:4)+1]
	connect = find(x -> dxi[x] <= cutoff, 1:N)
	for c in connect
		push!(lines, (points[i], points[c]))
	end
end

Drawing(paper_dim[1]*scaling, paper_dim[2]*scaling, "background.png")
origin()
background("#00796B")
sethue("#009688")
circle.(points, 6.+rand(N).*10, :fill)
sethue("#00897B")
circle.(points, 6.*rand(N).+2.0, :fill)
for l in lines
	line(l[1], l[2], :stroke)
end
finish()
preview()
