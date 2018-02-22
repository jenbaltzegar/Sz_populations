# To create pie charts for LASA poster
# start: 2/21/18

library(scales)
library(ggplot2)

df <- data.frame(
  group = c("Male", "Female", "Child"),
  value = c(25, 25, 50)
)
head(df)
# Barplot
bp<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity")
bp
# Pie chart
pie <- bp + coord_polar("y", start=0) +
  theme(axis.text.x=element_blank()) +
  geom_text(aes(y = value/3 + c(0, cumsum(value)[-length(value)]), 
                label = percent(value/100)), size=5)
pie

theme(axis.text.x=element_blank()) +
  geom_text(aes(y = value/3 + c(0, cumsum(value)[-length(value)]), 
                label = percent(value/100)), size=5)

#####
# Now my data
q1 <- data.frame(
  Answer = c("Yes", "No")
  , value = c(41.4, (100-41.4))
)
bp <- ggplot(q1, aes(x="", y=value, fill = Answer)) +
  geom_bar(width = 1, stat = "identity")
q1.pie <- bp +
  coord_polar("y", start = 0) +
  theme_minimal() +
  theme(axis.text.x = element_blank()
        , axis.ticks = element_blank()
        , panel.border = element_blank()
        , panel.grid = element_blank()
        , axis.title.x = element_blank()
        , axis.title.y = element_blank()
        , panel.background = element_rect(fill = "transparent",colour = NA)
        ) +
  scale_fill_manual(values=c("#999999", "#4cbb17"))
q1.pie
ggsave(filename = "q1_pie.png", dpi = 600, bg = "transparent")


# Now my data
q2 <- data.frame(
  Answer = c("Yes", "No")
  , value = c(27.6, (100-27.6))
)
bp <- ggplot(q2, aes(x="", y=value, fill = Answer)) +
  geom_bar(width = 1, stat = "identity")
q2.pie <- bp +
  coord_polar("y", start = 0) +
  theme_minimal() +
  theme(axis.text.x = element_blank()
        , axis.ticks = element_blank()
        , panel.border = element_blank()
        , panel.grid = element_blank()
        , axis.title.x = element_blank()
        , axis.title.y = element_blank()
        , panel.background = element_rect(fill = "transparent",colour = NA)
  ) +
  scale_fill_manual(values=c("#999999", "#4cbb17"))
q2.pie
ggsave(filename = "q2_pie.png", dpi = 600, bg = "transparent")


# Now my data
q3 <- data.frame(
  Answer = c("Yes", "No")
  , value = c(29.8, (100-29.8))
)
bp <- ggplot(q3, aes(x="", y=value, fill = Answer)) +
  geom_bar(width = 1, stat = "identity")
q3.pie <- bp +
  coord_polar("y", start = 0) +
  theme_minimal() +
  theme(axis.text.x = element_blank()
        , axis.ticks = element_blank()
        , panel.border = element_blank()
        , panel.grid = element_blank()
        , axis.title.x = element_blank()
        , axis.title.y = element_blank()
        , panel.background = element_rect(fill = "transparent",colour = NA)
  ) +
  scale_fill_manual(values=c("#999999", "#4cbb17"))
q3.pie
ggsave(filename = "q3_pie.png", dpi = 600, bg = "transparent")


# Now my data
q4 <- data.frame(
  Answer = c("Yes", "No")
  , value = c(39.3, (100-39.3))
)
bp <- ggplot(q4, aes(x="", y=value, fill = Answer)) +
  geom_bar(width = 1, stat = "identity")
q4.pie <- bp +
  coord_polar("y", start = 0) +
  theme_minimal() +
  theme(axis.text.x = element_blank()
        , axis.ticks = element_blank()
        , panel.border = element_blank()
        , panel.grid = element_blank()
        , axis.title.x = element_blank()
        , axis.title.y = element_blank()
        , panel.background = element_rect(fill = "transparent",colour = NA)
  ) +
  scale_fill_manual(values=c("#999999", "#4cbb17"))
q4.pie
ggsave(filename = "q4_pie.png", dpi = 600, bg = "transparent")


# Now my data
q5 <- data.frame(
  Answer = c("Yes", "No")
  , value = c(31.0, (100-31.0))
)
bp <- ggplot(q5, aes(x="", y=value, fill = Answer)) +
  geom_bar(width = 1, stat = "identity")
q5.pie <- bp +
  coord_polar("y", start = 0) +
  theme_minimal() +
  theme(axis.text.x = element_blank()
        , axis.ticks = element_blank()
        , panel.border = element_blank()
        , panel.grid = element_blank()
        , axis.title.x = element_blank()
        , axis.title.y = element_blank()
        , panel.background = element_rect(fill = "transparent",colour = NA)
  ) +
  scale_fill_manual(values=c("#999999", "#4cbb17"))
q5.pie
ggsave(filename = "q5_pie.png", dpi = 600, bg = "transparent")


# Now my data
q6 <- data.frame(
  Answer = c("Yes", "No")
  , value = c(10.3, (100-10.3))
)
bp <- ggplot(q6, aes(x="", y=value, fill = Answer)) +
  geom_bar(width = 1, stat = "identity")
q6.pie <- bp +
  coord_polar("y", start = 0) +
  theme_minimal() +
  theme(axis.text.x = element_blank()
        , axis.ticks = element_blank()
        , panel.border = element_blank()
        , panel.grid = element_blank()
        , axis.title.x = element_blank()
        , axis.title.y = element_blank()
        , panel.background = element_rect(fill = "transparent",colour = NA)
  ) +
  scale_fill_manual(values=c("#999999", "#4cbb17"))
q6.pie
ggsave(filename = "q6_pie.png", dpi = 600, bg = "transparent")

##################
# Now for the second chart
# Now my data
c1 <- data.frame(
  Answer = c("No Problem", "A Small Problem", "Sometimes A Problem", "A Big Problem")
  , value = c(29.3, 20.7, 15.5, 34.5)
)
bp <- ggplot(c1, aes(x="", y=value, fill = Answer)) +
  geom_bar(width = 1, stat = "identity")
c1.pie <- bp +
  coord_polar("y", start = 0) +
  theme_minimal() +
  theme(axis.text.x = element_blank()
        , axis.ticks = element_blank()
        , panel.border = element_blank()
        , panel.grid = element_blank()
        , axis.title.x = element_blank()
        , axis.title.y = element_blank()
        , panel.background = element_rect(fill = "transparent",colour = NA)
  ) 
c1.pie
ggsave(filename = "c1_pie.png", dpi = 600, bg = "transparent")





