using Luxor

N = 50
paper_dim = [16 10]
scaling = 1000
xy = rand(Float64, (N, 2)).*paper_dim

# Points
points = [Point(xy[i,1], xy[i,2]) for i in 1:N]

# Distances
dx = xy[:,1] .- xy[:,1]'
dy = xy[:,2] .- xy[:,2]'
dxy = sqrt.(dx.^2 .+ dy.^2)

Drawing(paper_dim[1]*scaling, paper_dim[2]*scaling, "background.png")
origin()
background("black")
sethue("red")
circle.(points, 4, :fill)
finish()
preview()

# Draw
#line(Point(31*(xy[i,1]-8), 31*(xy[i,2]-5)), Point(31*(xy[j,1]-8), 31*(xy[j,2]-5)), :stroke)
