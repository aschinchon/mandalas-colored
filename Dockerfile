FROM rocker/tidyverse

####################################################################
#
# docker build -t vanessa/mandalas .
# docker run -p 8787:8787 vanessa/mandalas --rstudio
# Visit localhost:8787 in your browser
# log in: username:password as rstudio:rstudio
#
# OR just generate a graphic
# docker run -v /tmp:/data vanessa/mandalas --outfile mandala.png
#
####################################################################

RUN Rscript -e "install.packages('deldir')"
RUN Rscript -e "install.packages('colourlovers')"
RUN Rscript -e "install.packages('rlist')"

# Directory for output /data/mandala.png
RUN mkdir -p /data

ADD . /
RUN mv /mandalas_colored.R /home/rstudio/mandalas_colored.R
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
