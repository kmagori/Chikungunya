#this is a script to create a GIF movie showing the spread of chikungunya over the Caribbean in 2014

rm(list=ls());

library(ggmap);

#create map of the location
Caribbean_map<-get_map(location='St. Martin Island Caribbean', source="google", zoom=7)

#read in Chikungunya cases
chik<-read.csv("chikungunya_INVS.csv",header=T)

#plot epi curve for Martinique
plot(1:dim(chik)[1],chik$Martinique_probable_confirmed)

#put two pins for Martinique_probable_confirmed for 3st week of outbreak
#get coords for Martinique
Martinique<-geocode("Martinique Caribbean",output="more")
#now generate random point between north and south
case_lat=runif(2,min=Martinique$south,max=Martinique$north);
case_long=runif(2,min=Martinique$west,max=Martinique$east);
#put point on map
Martinique_map<-qmap(c(Martinique$lon,Martinique$lat),source="google",zoom=8)
Martinique_map + geom_point(aes(x=case_long,y=case_lat,colour="red"))

Atlanta_map + geom_point(aes(x=Traps.Longitude, y=Traps.Latitude,colour="red"),size=3,data=as.data.frame(study_sites_cluster1_sp)) + geom_point(aes(x=Traps.Longitude, y=Traps.Latitude,colour="red"),fill="red",size=3,shape=22,lwd=2,data=as.data.frame(study_sites_cluster2_sp)) + geom_point(aes(x=Traps.Longitude, y=Traps.Latitude,colour="red"),size=3,fill="red",shape=23,data=as.data.frame(study_sites_cluster3_sp)) + geom_point(aes(x=Traps.Longitude, y=Traps.Latitude,colour="red"),fill="red",size=3,shape=24,data=as.data.frame(study_sites_cluster4_sp))

