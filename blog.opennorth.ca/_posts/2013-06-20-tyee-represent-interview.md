---
layout: post
title: "Leveraging Represent: Interview with the creators of The Tyee's Election Map"
type: article
author: Ellie Marshall
---
For the recent BC election, [The Tyee](http://www.thetyee.ca), an online news magazine, used our [Represent](http://represent.opennorth.ca) service in their [BC Election 2013 Map & Guide](http://election.thetyee.ca/) to connect their readers to electoral candidates.

As regular readers already know, Represent is a database of elected officials and electoral boundaries, whose API allows other civic groups to easily lookup representatives for a given address or postal code.

To learn more about their election tool and how it benefits citizens, we interviewed project lead [Phillip Smith](http://www.phillipadsmith.com/) and Tyee senior editor [Robyn Smith](http://thetyee.ca/Bios/Robyn_Smith/) about their experience.

<p style="text-align: center;"><img src="/img/blog/2013-06-20-the-tyee-map.jpg" width="500" height="322" alt="" title="Example of a slider scale"></p>  

**How did the project start?** <br>
**Phillip Smith**: Conceptually, the project started almost a year ago. Initially, it was just discussions exploring what would be technically and editorially possible for the BC provincial election, and investigations into what data was available to weave into the mix (i.e. past census data, representative data, etc). From there, we moved into mockups. About six months out, the election was a more frequent discussion at regular team meetings; actual technical and editorial work on the project started in earnest in January. 

**When designing the tool, what features did you prioritize?**<br>
**PS**: Nothing fancy, just the usual election map features like riding geometries, zooming to various regions, information presented on map hover, and the lookup feature described above.

**How did you discover Represent?**<br>
**PS**: I try to keep my ear to the ground in general for new Canadian open data initiatives. Also, when I e-mailed the [Vote.ca](http://www.vote.ca) project to ask about their riding lookup service and API limits, I was pointed to [Represent's API](http://represent.opennorth.ca/API). I quickly re-wrote the tool to use Represent's API. 

**What was the most challenging aspect of building the tool?**<br>
**PS**: Two things really: first was the unreliability of the connection between the app and the Google Spreadsheet that provided the data for each riding, candidates, and so on. High traffic on the app would almost always inevitably result in errors from the Google Docs API. Initially, some very basic caching was added to reduce the number of requests being made when the app was serving higher volumes of traffic. Eventually, I removed all remote calls from the application entirely and had separate tasks that would write to a cache, while the app would exclusively read from that cache. 

The addition of caching to speed up the app -- most specifically the caching of static assets like images and JavaScript -- meant that it was more challenging to make updates to the GeoJSON/JSON/JavaScript files that powered the map, because it would require pushing out new versions of those assets and forcing end-users to download new versions of what equated to a large amount of data. Given the focus on making the app available to mobile devices, keeping the size and amount of data downloaded to a minimum was a priority.  

Next time, I would probably separate the geographic data and the informational data for the map, so that they could be managed and cached independently. 

**If Represent’s API were not available, could you have found the data elsewhere? What would it have cost?** <br>
**PS**: We used a few different endpoints of the Represent API, specifically the representative lookup by riding, the riding centroid and bounds for drawing individual ridings, and the full dataset of BC provincial riding boundaries and their simplified geometry (a time-consuming task, if not available), and the riding lookup by latitude and longitude. 

Although it *may* have been possible to find and build out that data and services outlined above, it would have been significantly more time consuming. Although most of the data is available, the act of scraping, aggregating, and serving it would have incurred the cost of time that could have been invested elsewhere.

**How has reporting on elections changed since the 2009 BC Election? What are the Tyee’s goals for engaging readers?**<br>
**PS**: Users probably expected more -- more information, more updates, and they expect that across more devices. This experiment of having an app that aggregated both public data and Tyee reporting tried to address those needs in a new and novel way.

**Robyn Smith**: I would say that overall our style of reporting probably hasn't changed much. We strive to be thorough and fair, and to surprise our readers by taking different approaches or angles than other media. But I agree with Phillip in that our readers probably expected more this time around, because they've seen us grow as an organization over the past four years. The app is one way we decided to offer more. It's simple and interactive, with easy-to-digest riding profiles that included bites of key census data, candidate information, past election results, and "at a glance" histories crafted by Tyee reporters. It also had a function that allowed us to classify our stories as relevant to specific ridings. 

Our definition of engaging readers is including them, whenever possible, in what we do. They're smart, sometimes brutally so. The app really gave them an opportunity to shine. For example, the day we launched it in late February, we received a flood of emails from readers, candidates, and politicians, all pointing out ways to improve it, offering new information, and chastising us over a few mistakes. This process continued for months, and we incorporated it into the profiles as it came in. By mid-April, each page looked much different -- the whole project was fuller based on reader input. In that sense, I think it was successful.

**How do you think the tool benefits voters? Did the Tyee see an increase in reader engagement from the tool?** <br>
**RS**: A: Our aim for the app was to provide some helpful information, spark debate, and make it easier for voters to pester their candidates on issues that matter to them. I hope it benefited them in that way. 

Did we experience an increase in engagement as a result of the app? If by engagement you mean traffic, then yes! It was also well-shared on social media, and represented another opportunity for our readers to chime in. 

**What data could the BC or Canadian governments (or civil society!) make available to strengthen this type of tool for the next election?**<br>
**PS**: We worked closely with [Elections BC](http://www.elections.bc.ca/) to ensure that The Tyee would have access to Election BC's feed of the vote results throughout the night. The sample data came very late in the game (a few days ahead of the election) and the actual election-night data file had a number of formatting and naming inconsistencies that we had to work out in the hours proceeding the election. That added unnecessary stress. I hope that going forward all provinces, not just BC, can work to be more proactive in releasing election-night data and will work to provide that data in a format more consistent with the efforts of Represent, and by that I mean via an API, not a CSV file that needs to be fetched, parsed, and corrected and that can only be queried every five minutes! At the end of the day, it worked, but it was not what I would call "elegant." 

The [candidates endpoint](http://represent.opennorth.ca/api/#election) that Represent added to their API was something that I'd like to see more often. Unfortunately, The Tyee had already started down this path before that endpoint was available and we didn't end up using or contributing to that effort. 


*To learn more about how you can use Represent to connect citizens to decision-making processes, visit [represent.opennorth.ca](http://represent.opennorth.ca).*