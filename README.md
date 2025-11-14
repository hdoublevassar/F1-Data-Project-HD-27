# Formula One Data Visualization Project: Performance Metric Breakdown

## Overview
This project connects to the [OpenF1 API](https://openf1.org/) using R to retrieve, process, and visualize Formula 1 race data. My goal is to create reproducable and ensightful visualizations from Formula One datasets. Assuming OpenF1 continues its maintainence of the data, all of the code found in this project should be easily modified and reused even in future seasons. The final presentation created from the data will be listed on the Final Presentation branch which will be created upon completion. 

## Features
 - **API Integration**: Forms a direct connection to OpenF1 API for real-time F1 data
 - **Data Processing**: Cleans and filters session data, lap times, and driver statistics
 - **Visualizations**: Will create compelling charts and graphs using ggplot2
 - **Session Analysis**: Focus on race sessions and specific performance metrics, though I intend to create visualizations from qualifying data as well.
 - **Pitstop Analysis**: Pitstops will be analyzed as a metric of team performance.

## Data Sources (Take with a grain of salt, I'm new to this)
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
