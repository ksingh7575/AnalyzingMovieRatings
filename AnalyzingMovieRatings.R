#Start of the Script AnalyzingMovieRatings.R

#Reading the file

movies <- read.csv("Movie-Ratings.csv")

#Structure of the data
str(movies)

head(movies)

tail(movies)

#Changing the name of the columns of DataFrame
colnames(movies)

colnames(movies) <- c("Film","Genre","CriticRatings", "AudienceRatings",
                      "BudgetinMillions","YearofRelease")

#Summary of data
str(movies)

tail(movies)

summary(movies)

#Making the Year Variable as Categorical Variable
movies$YearofRelease <- factor(movies$YearofRelease)
summary(movies)

#Visualizing the Dataset

#Loading the required package
library(ggplot2)

str(movies)

#Aesthetics Layer
p<- ggplot(data=movies,aes(x=CriticRatings,y=AudienceRatings,
                       color=Genre))

#Geometric Layer
p+ geom_point(size=3) + geom_smooth(fill=NA)
p+ geom_point(aes(size=BudgetinMillions)) + 
  geom_smooth() +facet_grid(Genre~YearofRelease)+
  coord_cartesian(ylim = c(0,100))

#Second Chart

p + geom_point(aes(x=BudgetinMillions)) +
  xlab("Budget in Millions $$$")

#Third Chart : Histogram
h <- ggplot(data=movies,aes(x=BudgetinMillions))
h+ geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")+
  facet_grid(Genre~.,scales = "free")

lh <- ggplot(data=movies,aes(x=BudgetinMillions))
final_hist <- lh + geom_histogram(binwidth =10,aes(fill=Genre),color="Black")
final_hist +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budger Distribution") +
  theme(axis.title.x = element_text(color = "DarkGreen",size=25),
        axis.title.y = element_text(color = "Red",size=25),
        axis.text.x = element_text(size = 25),
        axis.text.y = element_text(size = 25),
        legend.title = element_text(size = 25),
        legend.text = element_text(size = 15),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(colour = "DarkBlue",size=30,family="Courier"))

 #Fourth Chart
ach <- ggplot(data=movies)

#Audience Ratings Chart
ach + geom_histogram(binwidth = 10,
                    aes(x=AudienceRatings),
                    fill="White",color="Blue")

#Critic Ratings Chart
ach + geom_histogram(binwidth = 10,
                    aes(x=CriticRatings),
                    fill="White",color="Blue")


#fifth Chart

#Audience Ratings Chart
ab <- ggplot(data=movies,aes(x=Genre,y=AudienceRatings,color=Genre))
ab+ geom_jitter() + geom_boxplot(size=1.2,alpha=0.5)

#Critic Ratings Chart
cb <- ggplot(data=movies,aes(x=Genre,y=CriticRatings,color=Genre))
cb+ geom_jitter() + geom_boxplot(size=1.2,alpha=0.5)

