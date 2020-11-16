library(faraway)
data(worldcup)
head(worldcup, 2)

library(dplyr)
worldcup <- worldcup %>%
  tibble::rownames_to_column(var = "Player")
head(worldcup, 2)

library(ggplot2)
library(ggthemes)

top_player <- worldcup %>% 
  top_n(n = 1, wt = Shots)

worldcup %>% 
  mutate(top_4 = Team %in% c("Spain", "Germany",  
                             "Uruguay", "Netherlands")) %>% 
  ggplot(aes(x=Time, y=Shots)) +
  geom_vline(xintercept = 270, color = "lightgray", linetype = 2) +
  geom_point(aes(color=top_4), size = 1, alpha = .5) +
  theme_few() +
  labs(x = "Time Played in World Cup (minutes)",
       color = "Teams Final \n Ranking") +
  scale_x_continuous(breaks = 90 * c(1,2,3,4,5,6,7)) +
  geom_text(data=top_player, mapping=aes(x = Time, y = Shots,
                                         label = Player, hjust = 1.5))

?geom_text
head(worldcup)


