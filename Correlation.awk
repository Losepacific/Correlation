{
 x[NR] = $1
 y[NR] = $2
 sum["x"] += $1
 sum["y"] += $2 
} 

END{ 
 av["x"] = sum["x"]/NR 
 av["y"] = sum["y"]/NR 
 for(i=1;i<=NR;i++){
	sum["xy"] += (x[i]-av["x"])*(y[i]-av["y"])
	sum["deltaX"] += (x[i]-av["x"])**2 
	sum["deltaY"] += (y[i]-av["y"])**2
	}
 r = sum["xy"]/sqrt(sum["deltaX"]*sum["deltaY"]) 
 b = sum["xy"]/sum["deltaX"]
 a = av["y"] - b*av["x"]
 print "R = "r
 print "R^2 = "r**2
 print "Y = "a" + "b"X"
}
