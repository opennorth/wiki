---
layout: post
title: "Lessons from Represent: Open Postal Code Data, Now!"
type: article
author: James McKinney and Ellie Marshall
---
[Represent](http://represent.opennorth.ca) is a web service run by Open North that allows Canadian citizens to find their elected officials by postal code for free. Canadian [nonprofits use Represent](http://http://blog.opennorth.ca/2013/01/28/drupal-modules/) to help their supporters send letters to their representatives about important issues.

In order to provide this service, we need access to accurate information about postal codes. [Both the United States and the United Kingdom release their postal code databases into the public domain.](http://www.canadaone.com/ezine/may2012/canada_post_postal_code_dispute.html). In Canada, on the other hand, Canada Post claims copyright over postal codes and [charges over $5,500](http://www.canadapost.ca/cpo/mc/business/productsservices/mailing/pcdp.jsf) for its postal code data products.

Postal codes are not only useful to Represent. For example, your local Internet provider may determine whether they provider service to your area by asking you for your postal code. In general, postal codes are an easy way to identify where a person is, and are used by businesses, nonprofits, researchers, demographers, and governments among others. [According to David Eaves](http://eaves.ca/2012/04/25/canada-posts-war-on-the-21st-century-innovation-productivity/), who sits on the federal government’s [Advisory Panel on Open Government](http://www.open.gc.ca/open-ouvert/bio-bio-eng.asp), postal code data is the dataset most requested by the public.

Low-cost access to postal code data would benefit a great number of organizations and people in Canada. This post explores the history and origins of postal codes and describes the progress we’ve made in making this data widely available.

####What are postal codes and where do they come from?
The first three characters of a postal code indicate the forward sortation area (FSA), which represents either a part of a large city like Toronto, an entire municipality or a collection of municipalities. The last three indicate the local delivery unit (LDU), which often represents a single building or a range of addresses on one street. As a municipality grows, it creates new addresses and shares its address data with Canada Post for free. Canada Post then assigns postal codes to those addresses.

The authorship and ownership of postal codes is a matter of recent controversy. In early 2012, Canada Post took legal action against two postal code data providers, [Geocoder.ca](http://geocoder.ca/?sued=1) and [PopularData.com](http://www.populardata.com/postalcode_database.html), claiming copyright over any database of postal codes, regardless of how the database was put together. [CIPPIC’s defense](http://www.cippic.ca/sites/default/files/Geolytica_Statement_of_Defence.pdf) of Geocoder.ca argues that the Copyright Act does not apply to postal codes and that, even if so, Geocoder.ca did not infringe on Canada Post’s copyright. No decision on the case has been made yet.

####Getting postal code data for Represent  
Represent’s [postal code data](https://github.com/opennorth/represent-canada-data/tree/master/postcodes) is obtained from official government sources and [Geocoder.ca](http://geocoder.ca/).

We previously [explained the process of obtaining electoral boundary data from municipalities](http://blog.opennorth.ca/lessons-from-represent-if-you-dont-ask-you-do-16430/). We follow a similar, simple process to obtain postal code concordances from the provinces. (A *concordance* is a file that matches each postal code with one or more provincial ridings.) When a province denies access to its data, it’s important to understanding why. Does the province license the data from a third-party? Who can we contact from the data provider about obtaining access? Following further discussion, it is sometimes possible to negotiate access to the data through a license agreement. Here is a summary of our progress thus far:

* We have successfully obtained and published concordances for [Quebec](https://github.com/opennorth/represent-canada-data/tree/master/postcodes/qc), [New Brunswick](https://github.com/opennorth/represent-canada-data/tree/master/postcodes/nb) and [Newfoundland and Labrador](https://github.com/opennorth/represent-canada-data)
* In many cases, the provinces cannot share their postal code data, because their license agreements with Canada Post or [DMTI Spatial](http://www.dmtispatial.com/) prevent it. (DMTI Spatial gives access to LDU boundaries for a quoted $11,275.) Saskatchewan, Alberta and British Columbia fall into this category.
* Elections Ontario [used to publish](http://www.elections.on.ca/en-CA/Tools/ElectoralDistricts/PostalCodeFile.htm) its concordances online. In May 2012, however, Elections Ontario removed this file from its website following a request from Canada Post.
* Elections Quebec [publishes its concordances on its website](http://www.electionsquebec.qc.ca/english/provincial/electoral-map/general-information-on-the-provincial-electoral-divisions-2011.php), which it creates using voter information and without relying on data from Canada Post.
* Manitoba, Nova Scotia and Prince Edward Island do not generate concordances, because voters in those provinces often receive mail a significant distance from where they live, such that a postal code is not a good predictor of which electoral district a voter lives in.

####The road ahead  
It is possible to think of postal codes as a [public good](http://en.wikipedia.org/wiki/Public_good), which should be released to the commons without copyright. In February 2013, Canada Post released [FSA boundaries](http://www5.statcan.gc.ca/bsolc/olc-cel/olc-cel?catno=92-179-X&lang=eng) through Statistics Canada for free, but retained copyright and official mark over postal codes. It’s a step in the right direction, but the LDU boundaries are what Canadians are really after.

In the coming months, we will be comparing the postal code data from third-parties, like Geocoder.ca, to the data from DMTI Spatial and Canada Post, so that Canadians can make informed decisions as to which low-cost provider provides the best balance of price versus quality for their use case. We look forward to sharing the results!
