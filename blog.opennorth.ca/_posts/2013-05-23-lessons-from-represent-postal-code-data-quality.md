---
layout: post
title: "Lessons from Represent: Postcode data quality"
type: article
author: Courtney Claessens and James McKinney
---
Open North's [Represent](http://represent.opennorth.ca/) web service allows Canadian citizens to enter a postal code to find their electoral districts and elected officials. This blog post will discuss some of the challenges in performing this (deceptively simple!) task.

As [previously discussed](http://blog.opennorth.ca/2013/03/05/open-postal-code-data-now/), elections offices sometimes provide a file that assigns each postal code to one or more electoral districts. In those cases, it is straightforward to lookup a citizen's postal code in the file and find the correct electoral districts. In most cases, however, such a file is not available, and we must rely on postal code geography data directly.

### Anatomy of a postal code

The first three characters of a postal code – like "H3B" in H3B 3H5 – identify the forward sortation area (FSA), which is a large region associated with a postal facility in which mail is sorted for delivery. Canada Post defines roughly 1,600 FSAs. Within an FSA, the last three characters of a postal code identify the local delivery unit (LDU), which in a big city may be a single building or a range of addresses, often associated with a postal carrier's route or a set of post office boxes. Canada Post defines roughly a million LDUs.

### Finding electoral districts using FSAs

As of February, it is possible to produce a list of FSAs that are entirely within an electoral district using the [free boundary files](http://www12.statcan.gc.ca/census-recensement/2011/geo/bound-limit/bound-limit-2011-eng.cfm) for federal electoral districts and forward sortation areas provided by Statistics Canada (StatCan). If an FSA (like H3B) is entirely within the boundary of an electoral district, then all its LDUs (like H3B 3H5) will be, too; we can therefore partially solve the challenge of determining electoral districts by postal code using only freely available data.

To improve the quality of our analysis, we compared StatCan's FSA boundaries to those in DMTI Spatial's commercial [CanMap Postal Code Suite](http://www.dmtispatial.com/can_map.html). Each data provider determines FSA boundaries differently: StatCan bases itself on postal codes reported by 2011 Census respondents for their place of residence; DMTI bases itself on postal codes tied to addresses in its CanMap Streetfiles data product. The different methodologies produce different FSA boundaries; the two differ especially in rural areas. As such, depending on which data provider you use, you get a different list of FSAs that are entirely within an electoral district.

DMTI's FSA boundaries also extended beyond Canada's major land mass and coastal islands into its coastal waters, whereas neither of StatCan's boundary files did. Given that mail is not delivered to coastal waters, DMTI's FSA boundaries were clipped to stay within StatCan's federal electoral district boundaries; otherwise, FSA boundaries that bled into the water would not be counted as entirely within an electoral district. We also clip StatCan's FSA boundaries to ensure consistency across all boundary files.

<table>
  <thead>
    <tr>
      <th>Data provider</th>
      <th>FSAs</th>
      <th>FSAs entirely within a district</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>StatCan</td>
      <td>1,621</td>
      <td>401 (24.7%)</td>
    </tr>
    <tr>
      <td>DMTI</td>
      <td>1,640</td>
      <td>420 (25.6%)</td>
    </tr>
  </tbody>
</table>

In other words, **using only freely available data, and given a forward sortation area like H3B, you can accurately determine its federal electoral district 25% of the time**. For the 75% of FSAs that overlap with two or more electoral districts (or cross provincial borders), it is necessary to use the more geographically precise (but not freely available) LDU to find the correct electoral district for a given postal code. These results highlight the need for open postal code data in Canada.

**Download the list of FSAs entirely within an electoral district as CSV**:

* [Matching FSAs common to both data providers (highest accuracy)](https://docs.google.com/spreadsheet/pub?key=0ApsS1HWhYxQGdFZUSzYzSTZlemlmNklHZXlkRTZpQ3c&single=true&gid=7&output=csv)
* [Using only Statistics Canada data](https://docs.google.com/spreadsheet/pub?key=0ApsS1HWhYxQGdFZUSzYzSTZlemlmNklHZXlkRTZpQ3c&single=true&gid=1&output=csv)
* [Using only DMTI Spatial data](https://docs.google.com/spreadsheet/pub?key=0ApsS1HWhYxQGdFZUSzYzSTZlemlmNklHZXlkRTZpQ3c&single=true&gid=0&output=csv)

### Finding electoral districts using FSA centroids

Instead of using full FSA boundaries, it's possible to instead use FSA [centroids](http://en.wikipedia.org/wiki/Centroid); an FSA's *centroid* is the latitude and longitude of its geometric center. However, it's impossible to tell, using only its centroid, whether an FSA is entirely within a single district or overlaps with two or more districts. Also, some FSAs are made up of two or more unconnected regions, in which case the centroid may be outside any of its component regions and inside another FSA. Centroids are therefore less reliable than boundaries for finding electoral districts.

Nonetheless, it is helpful to know how many FSA centroids are within their FSA boundary. We can calculate FSA centroids using the StatCan and DMTI FSA boundaries we already have. In addition, GeoNames provides [a ZIP file](http://download.geonames.org/export/zip/CA.zip) of 1,621 FSA centroids.

<table>
  <thead>
    <tr>
      <th>Data provider</th>
      <th>Centroids within StatCan boundary</th>
      <th>Centroids within DMTI boundary</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>StatCan</td>
      <td>1,527 (94.4%)</td>
      <td>1,400 (85.4%)</td>
    </tr>
    <tr>
      <td>DMTI</td>
      <td>1,473 (89.8%)</td>
      <td>1,583 (95.6%)</td>
    </tr>
    <tr>
      <td>GeoNames</td>
      <td>1,352 (83.4%)</td>
      <td>1,405 (86.7%)</td>
    </tr>
  </tbody>
</table>

Unsurprisingly, StatCan and DMTI FSA centroids are, with 94% and 96% accuracy, within the FSA boundary from which they are derived; it isn't 100% because, as described, an area's centroid can fall outside of its boundary. On the other hand, when comparing StatCan centroids to DMTI boundaries, StatCan centroids perform roughly as well as GeoNames centroids. DMTI centroids have the best performance overall, with 90% falling within the correct StatCan boundary.

* [Download the centroids of the clipped StatCan FSA boundaries (shapefile)](http://public.opennorth.ca.s3.amazonaws.com/StatCan_FSA_centroids.zip)
* [Download the clipped StatCan FSA boundaries (shapefile)](http://public.opennorth.ca.s3.amazonaws.com/StatCan_FSA_boundaries.zip)

In an upcoming post, we will use DMTI's LDU boundary file (quoted at $11,275) to evaluate the accuracy of both free and commercial datasets describing full postal code centroids, in order to recommend affordable datasets that strike a balance between accuracy and cost.

*A big thank you to our volunteer Courtney Claessens for performing this analysis!*
