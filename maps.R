library(broom)
library(ggplot2)
library(maptools)
library(tidyverse)
library(maptools)

crswgs84 = CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
afg_sp <- readShapeSpatial("data/afghanistan/gadm36_AFG_1.shp",
                           proj4string = crswgs84, verbose = T)

getwd()

afg_drones <- read_csv("data/afghanistan/afghanistan.csv")

afg_drones <- afg_drones %>%
    select(Maximum.strikes, NAME_1) %>%
    group_by(NAME_1) %>%
    summarise(strikes = sum(Maximum.strikes))

afg_drones$id <- afg_drones$NAME_1

tidy_spdf <- tidy(afg_sp, region = "NAME_1")

plot_data_afg <- left_join(tidy_spdf, afg_drones, by = "id")
plot_data_afg$strikes <- ifelse(is.na(plot_data_afg$strikes), 0,
                                plot_data_afg$strikes)

ggplot() +
    geom_polygon(data = plot_data_afg, aes(long, lat, group = group,
                                           fill = strikes), color = "black") +
    scale_fill_gradient(
          low = "white",
          high = "dark red",
          space = "Lab",
          na.value = "grey50",
          guide = "colourbar",
          aesthetics = "fill") +
    labs(fill = "Total \nStrikes     ") +
    coord_fixed(1.3) +
    theme_void()
#ggsave("figs/afganistan_map.png")

pak_sp <- readShapeSpatial("data/pakistan/gadm36_PAK_1.shp",
                           proj4string = crswgs84, verbose = T)

pak_drones <- read_csv("data/pakistan/pakistan.csv")
pak_drones$Maximum.strikes <- 1

pak_drones <- pak_drones %>%
    select(Maximum.strikes, NAME_1) %>%
    group_by(NAME_1) %>%
    summarise(strikes = sum(Maximum.strikes))

pak_drones$id <- pak_drones$NAME_1

tidy_spdf <- tidy(pak_sp, region = "NAME_1")

plot_data_pak <- left_join(tidy_spdf, pak_drones, by = "id")
plot_data_pak$strikes <- ifelse(is.na(plot_data_pak$strikes), 0,
                                plot_data_pak$strikes)

ggplot() +
    geom_polygon(data = plot_data_pak, aes(long, lat, group = group,
                                           fill = strikes),
                 color = "black") +
    scale_fill_gradient(
          low = "white",
          high = "dark red",
          space = "Lab",
          na.value = "grey50",
          guide = "colourbar",
          aesthetics = "fill") +
    labs(fill = "Total \nStrikes     ") +
    coord_fixed(1.3) +
    theme_void()
#ggsave("figs/pakistan_map.png")

som_sp <- readShapeSpatial("data/somalia/gadm36_SOM_1.shp",
                           proj4string = crswgs84, verbose = T)

som_drones <- read_csv("data/somalia/somalia.csv")

som_drones <- som_drones %>%
    select(Maximum.strikes, NAME_1) %>%
    group_by(NAME_1) %>%
    summarise(strikes = sum(Maximum.strikes))

som_drones$id <- som_drones$NAME_1

tidy_spdf <- tidy(som_sp, region = "NAME_1")

plot_data_som <- left_join(tidy_spdf, som_drones, by = "id")
plot_data_som$strikes <- ifelse(is.na(plot_data_som$strikes), 0,
                                plot_data_som$strikes)

ggplot() +
    geom_polygon(data = plot_data_som, aes(long, lat, group = group,
                                           fill = strikes),
                 color = "black") +
    scale_fill_gradient(
          low = "white",
          high = "dark red",
          space = "Lab",
          na.value = "grey50",
          guide = "colourbar",
          aesthetics = "fill") +
    coord_fixed(1.3) +
    labs(fill = "Total \nStrikes     ") +
    theme_void()
#ggsave("figs/somalia_map.png")

yem_sp <- readShapeSpatial("data/yemen/gadm36_YEM_1.shp",
                           proj4string = crswgs84, verbose = T)

yem_drones <- read_csv("data/yemen/yemen.csv")
yem_drones$Maximum.strikes <- 1

yem_drones <- yem_drones %>% 
    select(Maximum.strikes, NAME_1) %>% 
    group_by(NAME_1) %>% 
    summarise(strikes = sum(Maximum.strikes))

yem_drones$id <- yem_drones$NAME_1

tidy_spdf <- tidy(yem_sp, region = "NAME_1")

plot_data_yem <- left_join(tidy_spdf, yem_drones, by = "id")
plot_data_yem$strikes <- ifelse(is.na(plot_data_yem$strikes), 0,
                                plot_data_yem$strikes)

ggplot() +
    geom_polygon(data = plot_data_yem, aes(long, lat, group = group,
                                           fill = strikes), color = "black") +
    scale_fill_gradient(
          low = "white",
          high = "dark red",
          space = "Lab",
          na.value = "grey50",
          guide = "colourbar",
          aesthetics = "fill") +
    coord_fixed(1.3) +
    labs(fill = "Total \nStrikes     ") +
    theme_void()
    
#ggsave("figs/yemen_map.png")
