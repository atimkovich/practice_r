library("faraway")
library("ggplot2")
library("tidyverse")
data("worldcup")

str(worldcup)

ggplot(data=worldcup) +
  geom_point(mapping = aes(x=Time, y=Passes))

worldcup %>% 
  ggplot() +
  geom_point(mapping = aes(x=Time, y=Passes))

worldcup %>% 
  ggplot(mapping = aes(x=Time, y=Passes, color= Position)) +
  geom_point() +
  geom_rug()

worldcup %>% 
  rownames_to_column(var = "Name") %>% 
  filter(Team %in% c("Spain", "Netherlands", "Germany", "Uruguay")) %>% 
  ggplot(mapping = aes(x=Shots, y=Tackles, color=Position, shape =Team)) +
  geom_point()

worldcup %>% 
  rownames_to_column(var = "Name") %>% 
  mutate(top_four = Team %in% c("Spain", "Netherlands", "Germany", "Uruguay")) %>% 
  ggplot(mapping = aes(x=Time, y=Passes, color = top_four)) +
  geom_point() +
  geom_text(mapping = aes(label = Name), size = 2.5)

ggplot(data=worldcup) +
  geom_point(mapping = aes(x=Time, y=Passes), color = "blue")

ggplot(data=worldcup) +
  geom_point(mapping = aes(x=Time, y=Passes), size = 2.5)

?geom_point

ggplot(data=worldcup) +
  geom_point(mapping = aes(x=Time, y=Passes, color = Position), color = "orange", alpha =0.3))

ggplot(worldcup) + 
  geom_point(mapping = aes(x = Time, y = Passes), color = "orange", alpha=0.3) + 
  labs(x = "Time (minutes)", y = "Number of passes") +
  ggtitle("World Cup Statistics", subtitle = "2010 World Cup")

ggplot(worldcup) +
  geom_histogram(mapping = aes(x=Time))

ggplot(worldcup) +
  geom_histogram(mapping = aes(x=Shots))

ggplot(worldcup) +
  geom_histogram(mapping = aes(x=Passes))

ggplot(worldcup) +
  geom_histogram(mapping = aes(x=Tackles))

ggplot(worldcup) +
  geom_histogram(mapping = aes(x=Saves), bins = 10, color = "pink", fill = "red")

ggplot(worldcup) +
  geom_boxplot(mapping = aes(x=Position, y = Shots))

worldcup %>% 
  rownames_to_column(var = "Name") %>% 
  mutate(top_four = Team %in% c("Spain", "Netherlands", "Germany", "Uruguay")) %>% 
  filter(top_four) %>% 
  ggplot(mapping = aes(x=Position, y = Shots)) +
  geom_boxplot()

ggplot(worldcup) +
  geom_histogram(aes(x=Time))
ggplot(worldcup) +
  geom_histogram(aes(x=Shots))
ggplot(worldcup) +
  geom_histogram(aes(x=Passes))                 
ggplot(worldcup) +
  geom_histogram(aes(x=Tackles))
ggplot(worldcup) +
  geom_histogram(aes(x=Saves), color = "blue", fill = "pink", bins = 10)

worldcup %>% 
  ggplot() +
  geom_boxplot(aes(x=Position, y=Shots))

worldcup %>%
  rownames_to_column(var = "Name") %>% 
  mutate(top_four = Team %in% c("Spain", "Netherlands", "Uruguay", "Germany")) %>% 
  filter(top_four) %>% 
  ggplot(aes(x=Position, y=Saves)) +
  geom_boxplot()

worldcup %>%
  rownames_to_column(var = "Name") %>% 
  mutate(top_four = Team %in% c("Spain", "Netherlands", "Uruguay", "Germany")) %>% 
  filter(top_four) %>% 
  ggplot(aes(x=Position, y=Shots)) +
  geom_boxplot()

worldcup %>%
  rownames_to_column(var = "Name") %>% 
  mutate(top_four = Team %in% c("Spain", "Netherlands", "Uruguay", "Germany")) %>% 
  filter(top_four) %>% 
  ggplot(aes(x=Time, fill = Team)) +
  geom_histogram()

str(worldcup)
               