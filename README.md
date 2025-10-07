# Formula 1 Data Visualization Project

## Overview
This project connects to the [OpenF1 API](https://openf1.org/) using R to retrieve, process, and visualize Formula 1 race data. My goal for this project is to create reproducable and ensightful visualizations from the data. Assuming OpenF1 continues its maintainence of the data, all of the code found in this project should be easily modified and reused even in future seasons.

## Features
 **API Integration**: Forms a direct connection to OpenF1 API for real-time F1 data
**Data Processing**: Cleans and filters session data, lap times, and driver statistics
 **Visualizations**: Will create compelling charts and graphs using ggplot2
 **Session Analysis**: Focus on race sessions and specific performance metrics, though I intend to create visualizations from qualifying data as well.

## Data Sources (Take with a grain of salt, I'm new to this)
The project utilizes multiple endpoints from the OpenF1 API:
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
- **RMarkdown** - Reproducible reporting

## Getting Started

### Prerequisites
Make sure you have R installed along with the required packages:

```r
install.packages(c("tidyverse", "ggplot2", "jsonlite", "httr")) ##subject to change as I research more of what I need
```

### Usage
1. Open `F1-API-Setup.rmd` in RStudio
2. Run the chunks sequentially to fetch and process F1 data
3. Customize filters and visualizations based on your analysis needs (Filter commands are completed using the dyplyr package fromt tidyverse)

## Current Focus
Currently analyzing 2025 Race Sessions with plans to expand into:
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

## Acknowledgments
- Data provided by [OpenF1 API](https://openf1.org/)
- Formula 1 and all related marks are trademarks of Formula One Licensing BV

---
*This is a personal project for educational and analytical purposes.*
