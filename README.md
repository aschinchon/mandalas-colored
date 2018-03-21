# Mandalas Colored

After completing this experiment you will be able to create your mandalas and use `colourLovers` palettes to colour them. It maybe used as workshop to teach Voronoi tesselations, recursivity as well as `ggplot`. This is an example of what you can do:

<img src="https://fronkonstin.com/wp-content/uploads/2018/03/IMG24.png" height="650" width="650" align="middle">




## Getting Started

### Prerequisites

You will need to install the following packages (if you don't have them already):

```
install.packages("ggplot2")
install.packages("dplyr")
install.packages("deldir")
install.packages("colourlovers")
install.packages("rlist")
```

## More info

A complete explanation of the experiment can be found [at fronkonstin](https://fronkonstin.com/2018/03/11/mandalas-colored/)

## Docker
You can also build a Docker image with dependencies, and package with rstudio for
nice interactive viewing of the plots. First, to build the image:

```
docker build -t vanessa/mandalas .
```

### Interactive with RStudio
To run the container interactively to use rstudio, issue this command:

```
docker run -p 8787:8787 vanessa/mandalas --rstudio
```

You can then open your browser up to [http://localhost:8787](http://localhost:8787) and login with username `rstudio` and password `rstudio`. Open the file "mandalas_colored.R" in the file browser and have fun! The mandalas will appear in the Plot area in the upper right.


### Run headless
If you want to run the container headless and save your mandala png to file, you can bind a folder to `/data`
in the container to do this.

```
mkdir -p /tmp/outy
docker run -v /tmp/outy:/data vanessa/mandalas
```
You also can change any of the parameters to modify your mandala! 

Here are the full set of options:

 - `--iter`: Number of iterations (depth)
 - `--radius`: Number of points
 - `--points`: Factor of expansion/compression
 - `--outfile`: The output file to save in `/data`. You should map the directory on your host to `/data` in the container to retrieve it.

```
docker run -v /tmp/outy:/data vanessa/mandalas --outfile pancakes.png
```

And here is how you can make a nice loop of them :)

```
for i in `seq 1 10`;
   do
       docker run -v /tmp/outy:/data vanessa/mandalas --outfile mandala-${i}.png
done 
```


## Authors

* **Antonio Sánchez Chinchón** - [@aschinchon](https://twitter.com/aschinchon)


## Contributors

 - [@vsoch](https://twitter.com/vsoch): Dockerization!
