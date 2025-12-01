# Formula One Data Visualization Project: Performance Metric Breakdown

## Overview
This project connects to the [OpenF1 API](https://openf1.org/) using R to retrieve, process, and visualize Formula 1 race data. My goal is to create reproducible and insightful visualizations from Formula One datasets. Assuming OpenF1 continues its maintenance of the data, all of the code found in this project should be easily modified and reused even in future seasons. The final presentation created from the data will be listed on the Final Presentation branch which will be created upon completion. 

## Features (Take with a grain of salt, I'm new to this)
 - **API Integration**: Forms a direct connection to OpenF1 API for real-time F1 data
 - **Data Processing**: Cleans and filters session data, lap times, and driver statistics
 - **Visualizations**: Will create compelling charts and graphs using ggplot2
 - **Session Analysis**: Focus on race sessions and specific performance metrics, though I intend to create visualizations from qualifying data as well.
 - **Pitstop Analysis**: Pitstops will be analyzed as a metric of team performance.

## Data Sources
The project utilizes multiple endpoints from the OpenF1 API:
- **Pitstops**: Pitstop timing data
- **Sessions**: Race weekend session information
- **Drivers**: Driver details and numbers
- **Lap Times**: Individual lap performance data
- **Car Data**: Telemetry including speed, throttle, and braking
- **Positions**: Post race moment-by-moment position tracking 

## Technologies Used
- **R** (Primary language)
- **tidyverse** - Data manipulation and processing
- **ggplot2** - Data visualization
- **httr** - HTTP requests to API
- **jsonlite** - JSON data parsing
- **OpenF1r** - Package directly interacts with OpenF1 API (was not aware it existed at first)
- **RMarkdown** - Reproducible reporting
- **Plotly** - Interactive Graphs

## Pitstop Data Cleaning and Visualization
While I intend for this project to far eclipse the scope of what is shown here long-term, the pitstop analysis portion aims to assess the operational efficiency of different Formula One teams from 2023-present. Essentially, the motivating question is: how do pit stop durations vary across Formula One teams from 2023–present, and which teams demonstrate the highest operational efficiency? In a series where even marginal differences have a massive impact, routine differences in pitstop performance can account for massive gains or losses for a team.


### Data Cleaning
1. Using the OpenF1 API, multiple dataframes are loaded, including session_data, pitstop_data, driver_names, and meeting_data, which are added to the workspace.
2. Upon importing data, the session_data dataframe is filtered down to just Race Sessions in order to assess operational efficiency of each team. Furthermore, the !duplicated() function is run to remove duplicates, though it has no impact currently.
3. Two of the teams, RB and Racing Bulls, are merged since they're used interchangeably in the data and they're the exact same team.
4. The driver_names dataframe has a "#" pasted in front of every value in the team_colour column to make the color codes usable.
    - Next, team color codes are standardized to the first code provided in the dataset, since each team changed colors more than once.
5. Next, the dataframe race_drivers_all is created and filters down to only the drivers who have been in race sessions since 2023 when data tracking began. 
    - From race_drivers_all, limited_drivers is created, which reduces the dimensions of the dataset by removing meeting_key, broadcast_name, first_name, and last_name to reduce complexity.
6. Pitstop_data is filtered down to race sessions using the race_sessions data, and NA values are removed; thus, the pitstop dataframe only tracks race data.
7. Then, the data from limited_drivers is joined by the columns session_key and driver_number so that corresponding data will match the information of the driver from the specific session.
    - Country code is removed from the driver information to make way for the country codes of the circuit.
    - Then the year, circuit_short_name, and country_code are merged by session_key.
8. Outlier determination and removal posed one of the largest challenges due to opaque data tracking methods. Pit duration is measured from pitlane entry to exit, meaning pitstop times vary by track layout.
    - Initially, the $1.5 \times IQR$ method was used to identify outliers, but this approach failed to exclude non-pitstop events such as DNFs, red-flag stoppages, and pre-race stops, which skewed the distribution toward extremely long durations.
    - A manual threshold of 150 seconds was implemented instead, providing more accurate analysis of in-race pitstop performance while filtering out problematic data points.
    - As a result, there are no longer examples of pitstops eclipsing 1000 seconds or more, which heavily distorted the data prior to their removal.
9. pitstop_averages is created from pitstop_data and it takes the mean of every single driver's pitstop performance, which was later used for a visualization comparing drivers over the past few years.
10. Later on, mean deviation of the sample was calculated and merged to pitstop_data by taking the mean of all pitstop for a session before subtracting the mean from each pitstop_duration.
11. Mean durations were also tracked as a dataset called mean_pit_duration which is grouped by team and year, for use in ordering the teams.

### Main Visualization and Analysis

![Team Pitstop Performance Boxplots](https://github.com/hdoublevassar/F1-Data-Project-HD-27/blob/main/Team_Boxplots.png)

*An interactive version of this graph created with Plotly is available in the knit HTML file within this repository. The data depicted is subject to change as new races are completed; running the code independently will reflect the most current results.*

The visualization above presents horizontal stacked boxplots representing pitstop performance across teams, with each box colored according to team and arranged in descending order by median pitstop duration. Additionally, the raw pitstop durations are depicted as small dots on the plots. Looking at the graph, the highest performing teams in order are: Racing Bulls, Red Bull Racing, Mercedes, Ferrari, and McLaren. While Racing Bulls has the lowest median pitstop time, the team is relatively new, being formerly known as AlphaTauri, and temporal trends in pitstop performance account for their strong form. Notably, after the Las Vegas Grand Prix on 11/22/2024, Mercedes overtook Ferrari, meaning that this graph looked different just a week ago.

Starting with the lowest performing team, Alfa Romeo (currently Kick Sauber) is a team with a large IQR and significant whiskers, implying that the team was more prone to costly errors. The median pitstop time, while it is the worst of every single team, isn't so terrible that they could be written off entirely, but by every single metric, Alfa Romeo remains the most operationally inefficient team, suffering from costly errors and inconsistency. Other midfield teams like Williams and AlphaTauri suffer from the exact same issues, seeing high variability in their performance and having much wider variance, though not to the same extent. These teams aren't necessarily downright slow, but their performance is completely unreliable.

On the other hand, Haas, Aston Martin, and Alpine represent teams that are somewhat consistent operationally, but their performance is just plain slow. Each of these teams has a much smaller IQR than the previously mentioned midfield competitors, but their lack of pace has meant that they've been consistently slower. While Aston Martin is the least likely of the three teams to have a bad pitstop and most likely to have a quick pitstop, it has a higher median than Alpine.

![Team Pitstop Performance Boxplots For 2025](https://github.com/hdoublevassar/F1-Data-Project-HD-27/blob/FinalPresentation/BoxPlots2025.png)

*Means are mentioned during this section as well, and a table of every teams mean divided by year is included as a dataset called mean_pit_duration*

Kick Sauber presents an interesting case as a team with high variability but steady year-over-year improvement in median performance. Historically one of the lowest-performing teams operationally, recent improvements have resulted in significant gains compared to the 2024 season. While not displayed in the full dataset chart, Kick's mean pitstop duration decreased from 27.32 seconds in 2024 to 22.8 seconds in 2025 thus far. This substantial performance improvement between seasons explains the wide variance observed across the complete dataset, as earlier data from 2024 showed significantly slower performance before the marked improvements seen throughout 2025. Considering their recent form, even outperforming the likes of Ferrari and McLaren, Kick Sauber is now among the most operationally efficient teams in the sport.

Finally, examining the most operationally efficient teams over the full dataset, Ferrari, Mercedes, Red Bull, and McLaren all demonstrate high efficiency. For this analysis, Racing Bulls is excluded because merging their pitstop durations with AlphaTauri's data significantly increases their median time. Red Bull Racing has been highly efficient but somewhat variable, ranking 7th in mean time among all teams in 2025. Notably, their median time remains the best, indicating that while they experience occasional disastrous pitstops creating high-end variability, they most commonly achieve high-performing stops. Over the past few seasons, McLaren has been a marker of consistency with a small IQR, even when not recording the quickest stops, though the full dataset shows more variation than 2025 alone. Across the complete dataset, Mercedes has a quicker median pitstop duration than both Ferrari and McLaren, though their 2025 season performance has resulted in a wider spread of results. McLaren and Ferrari are more closely matched, with Ferrari holding an advantage over the full dataset. Ferrari demonstrates a lower median duration and a visibly smaller IQR, denoting superior consistency from 2023 to present. 

Formula 1 is a sport defined by marginal gains, where even the smallest improvements can determine success or failure. Pitstops, like every other aspect of the sport, carry enormous weight in race outcomes. As teams evaluate their weaknesses and pursue operational improvements, reducing pitstop errors becomes essential—yet errors remain inevitable. This is a sport where wheel nuts can break, pit releases are blocked by incoming traffic, and unpredictability will always factor into performance, regardless of a team's overall quality.

However, pursuing operational efficiency remains critical to climbing the championship standings. As demonstrated by Kick Sauber's trajectory over the past two years, true team improvement requires advancement across all areas of operation. For Kick Sauber, enhanced pitstop performance has become a cornerstone of their development ahead of their 2026 rebrand to Audi, illustrating how operational excellence in the pit lane directly contributes to a team's broader competitive evolution. In 2024, Kick ended the season in last place with 4 points, and during the 2025 season, they are currently in 9th place, only 5 points behind 7th place rather than finishing miles off the pack.

## Getting Started

### Prerequisites
Make sure you have R installed along with the required packages:

```r
install.packages(c("tidyverse", "ggplot2", "jsonlite", "httr", "remotes", "plotly", "bslib")) ##subject to change as I research more of what I need
install.packages("openf1r", repos = c('https://coolbutuseless.r-universe.dev', 'https://cloud.r-project.org'))
```
Lastly, ensure that you have either R-studio, VS Code, or a similar editor installed with the proper extentions needed to interact with R

### Usage
1. Download ZIP containing current files
2. Open in RStudio or IDE of choice
3. Ensure all dependencies (currently only one R Script) are in the same folder
4. Run the chunks sequentially to fetch and process F1 data
5. Customize filters and visualizations based on your analysis needs (Filter commands are completed using the dyplyr package from tidyverse)

## Current Focus
Currently analyzing 2023-2025 Race Sessions with plans to expand into:
- Driver performance comparisons
- Lap time trends
- Team statistics
- Track-specific analysis

## Potential Future Enhancements
- Interactive dashboards
- Historical season comparisons
- Predictive modeling for race outcomes
- Advanced telemetry visualizations

## Author
Hudson Double

### Contact Information
Feel free to contact me for clarrification or to point out issues with these visualizations.
*hdouble@vassar.edu*

### Citing
In order to cite this project for future use:
Double, H (2025). *Formula One Data Visualization Project: Performance Metric Breakdown* [GitHub Repository]. https://github.com/hdoublevassar/F1-Data-Project-HD-27. (Date Accessed **Replace Date**)

## Acknowledgments

- Data provided by [OpenF1 API](https://openf1.org/)
- Formula 1 and all related marks are trademarks of Formula One Licensing BV
- Cheng M (2025). *openf1r: Retrieve Formula 1 Race Data from the OpenF1 API.* R package version 0.1.1, https://github.com/coolbutuseless/openf1r.
---
*This is a personal project for educational and analytical purposes.*
