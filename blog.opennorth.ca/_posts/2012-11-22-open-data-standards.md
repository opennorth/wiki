---
layout: post
title: "Open Data, Standards and Socrata"
type: article
author: 2012-10-26 10:39:06 
---
Last week, [Socrata](http://www.socrata.com/) [announced](http://www.socrata.com/newsroom-article/socrata-announces-open-source-option-for-leading-open-data-cloud-platform/) “Open Data Standards,” [an initiative](http://open-data-standards.github.com/) that led to lively debate on open data mailing lists. In this post, we will dive into the issues around standardization, a core issue for the open data movement. (If you’re already familiar with these issues, skip down to the section on Socrata’s initiative.)

### The Need for Standards

When a technology is widespread, standardization provides better predictability for those who rely on the technology. Consider light bulbs, for example. All incandescent light bulbs have the same screw base, and you can reliably expect that when you buy a bulb, it will fit into your lamp’s socket. Compact fluorescent and LED bulbs use the same screw base, so that your old light sockets still work with these new bulbs. You may have never even thought to worry about whether a bulb will fit your socket! All users of this technology – manufacturers, electricians, consumers – benefit from not having to think about a bulb’s screw base.

Open data is increasingly widespread, but relatively few standards exist. If you are looking for government spending data, you can’t expect the datasets on different open data portals to be in the same format. The time it takes to learn each format takes away from your time making interesting uses of the data.

We need open data standards to encourage people to invest in using open data. The best examples are the [General Transit Feed Specification (GTFS)](https://developers.google.com/transit/gtfs/) and [Open311](http://open311.org/) which transformed public transit data and municipal service requests. Hundreds of transit agencies publish GTFS data, and hundreds of applications have been built using the data, including trip planning, ridesharing, timetable creation, and interactive voice response systems. A similar software ecosystem exists around Open311 data. The same can happen for many other types of data.

There is an urgent need to standardize information about open data catalogs, datasets and APIs and to standardize the formats in which datasets are published. There are millions of datasets across the hundreds of open data portals, but we have no efficient way to process that data or to even know what’s there.

### De Facto Standards

Most open data standards to date have begun life as *de facto* standards. Working closely with the TriMet transit agency in Portland, Google developed a first version of GTFS in 2005. As more transit agencies adopt the standard, Google updates the specification to satisfy new requirements. Google currently handles additional changes through a [discussion group](https://developers.google.com/transit/gtfs/changes).

In the case of GTFS and Open311, the original authors own the standard, and the only way to participate as a third-party is through a mailing list. These communications are consultative in nature, giving third-parties no real power over the standard. If a third-party requires a change for its use case and the original authors either can’t or won’t implement it, then the third-party has no other option than to use its own custom format.

We’ve witnessed this with Open311, where the author, [OpenPlans](http://openplans.org/), did not have the resources to satisfy the new requirements of participating cities. The result: The City of Chicago, with the help of [Code for America](http://codeforamerica.org/), created its own custom version of Open311 to implement the features it needed. Unless adoption exceeds fragmentation, this sort of activity will kill a standard.

De facto standards are especially at risk of lacking the resources or the incentive to maintain a standard for everyone’s benefit. Many de facto standards therefore go through a standards body to mitigate this risk.

### Standards Bodies

The goal of standards bodies is to ensure a clear, effective and fair standardization process. Organizations like the [World Wide Web Consortium (W3C)](http://www.w3.org/) bring stakeholders together to develop standards based on the consensus of member organizations, staff, and the community at large.

Why do some authors not go through standards bodies to ensure the maintenance and evolution of their de facto standards? There are both good and bad reasons, which range from: wanting to avoid losing control over the standard; desiring a fast, flexible, lightweight process; believing current processes are satisfactory; having ideological differences or distrust in relevant standards bodies, etc.

Access to standards bodies can also be tedious and/or expensive. Most open data innovators are small organizations and startups. Few are willing to invest money and time in such an effort. Open North faces this issue with respect to submitting [Open511](http://blog.opennorth.ca/opening-new-roads-with-open511/) to the [Open Geospatial Consortium](http://www.opengeospatial.org/), where high membership fees discourage participation.

Lastly, open data is about open access. Some standards bodies like [ISO](http://www.iso.org/) do not provide free access to their standards. Such bodies are inappropriate for open data standards.

### Socrata’s Initiative

Socrata’s pitch for its new “open data standards” initiative is that it is a no fee, community-driven meritocracy that moves quickly to establish needed standards. It’s a worthwhile project; the problem is that there are already several organizations working together to do the same thing. Why is Socrata launching yet another initiative instead of working with others?

Socrata’s CTO Will Pugh [describes](http://lists.okfn.org/pipermail/open-government/2012-November/002479.html) how the initiative is different than what exists on the [Open Knowledge Foundation (OKF)](http://okfn.org/)’s [open-government mailing list](http://lists.okfn.org/mailman/listinfo/open-government). OKF Co-Founder Rufus Pollock, however, [shares doubts](http://lists.okfn.org/pipermail/open-government/2012-November/002478.html) over the need for a new initiative which seems to duplicate existing work by the OKF and W3C among others.

In its “Why Not a Traditional Standards Organization?” [section](http://open-data-standards.github.com/), it describes a process similar to what the [W3C already does](http://www.w3.org/2005/10/Process-20051014/). The W3C:

* writes its specifications in Mercurial (to Socrata’s choice of Git)
* tracks issues in its [own tracker](http://www.w3.org/2005/06/tracker/) (to Socrata’s choice of GitHub)
* uses [mailing lists](http://lists.w3.org/) (to Socrata’s choice of Google Groups)

Unlike the W3C, Socrata gives little information on the initiative’s governance. Who will have the power to change the standards? Will Socrata follow a consensus model or be a [benevolent dictator](http://en.wikipedia.org/wiki/Benevolent_Dictator_for_Life)? If a third-party contributes to a standard, what control does that third-party have over its continued evolution?

Nonetheless, “outsider” initiatives with loose governance models can be helpful in creating new standards quickly. For example, [WHATWG](http://www.whatwg.org/) was formed in 2004 by individuals from Apple, Mozilla and Opera to create HTML5. The working group was formed in response to technical disagreements and the slow development of web standards at the W3C. Three years later, the W3C adopted WHATWG’s HTML5 specification, which led to wider adoption of this major advancement in web technology. The two now co-develop the standard.

It’s important to note that the individuals who later formed WHATWG first tried to work within the W3C; they formed the working group only after reaching an impasse. Socrata, on the other hand, does not seem to have made any effort to participate in existing efforts before starting its own.

The W3C’s [Government Linked Data Working Group](http://www.w3.org/2011/gld/wiki/Main_Page#Government_Linked_Data_.28GLD.29_Working_Group), which develops open government data standards, did not approach Socrata, though it did approach many other vendors and stakeholders. Pugh cites this omission as a reason for Socrata to form its own group... but the easy solution would have been to join these efforts! Socrata should participate in these ongoing discussions, not fragment them by starting new initiatives and mailing lists.

Tangentially, Socrata describes its initiative as an “industry organization,” which is more ambitious than a working group like WHATWG. What will be the scope of this organization? As a publisher and consumer of open data, we look forward to more details on this subject.

### The Future of Open Data Standards

A lot of work is being done on the open data standards of interest to Socrata, and there are many opportunities to partner with existing organizations in their development, as the OKF has done in working with the W3C on DCAT. The W3C’s [Government Linked Data Working Group](http://www.w3.org/2011/gld/wiki/Main_Page#Government_Linked_Data_.28GLD.29_Working_Group), of which our executive director James McKinney is a member, is nearing the publication of several important standards, including vocabularies for data catalogs (DCAT), statistics (Data Cube) and organizations. Meanwhile, Microsoft and others are proposing [OData](http://www.odata.org/) – a protocol for querying and updating open data – to [OASIS](https://www.oasis-open.org/), an open standards body like W3C.

With respect to Open511, Open North has brought together stakeholders in government, industry and academia to develop a high-quality standard, which we hope to submit to an appropriate standards body once it’s ready. The debate fostered by Socrata’s announcement underlines the need for Open North, within Open511, to communicate with and reach out to many stakeholders and to work hard to identify and coordinate with similar efforts, to avoid coordination problems down the road.
