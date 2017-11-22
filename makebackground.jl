using Luxor

N = 200
paper_dim = [16 10]
scaling = 100

xy = (rand(Float64, (N, 2)).*paper_dim.-paper_dim./2).*scaling


# Points
points = [Point(xy[i,1], xy[i,2]) for i in 1:N]

# Distances
dx = xy[:,1] .- xy[:,1]'
dy = xy[:,2] .- xy[:,2]'
dxy = sqrt.(dx.^2 .+ dy.^2)

Drawing(paper_dim[1]*scaling, paper_dim[2]*scaling, "background.png")
origin()
background("#00796B")
sethue("#009688")
circle.(points, 6.+rand(N).*10, :fill)
sethue("#00897B")
circle.(points, 6.*rand(N).+2.0, :fill)
for i in 1:(N-1)
	for j in (i+1):N
		if dxy[i,j] < 120
			if rand() < 0.7
				line(points[i], points[j], :stroke)
			end
		end
	end
end
finish()
preview()
