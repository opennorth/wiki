---
layout: post
title: "How it works: Ensuring authentic results in Citizen Budget consultations"
type: article
author: the Citizen Budget team
---
We are often asked how we ensure that residents submit a single response only, to avoid a scenario where individuals can bias the results of the consultation by submitting the same response multiple times.

We’ve discovered that the best approach is to accept all responses at first, and to later filter out duplicates, spam and other forms of abuse at the end of the consultation. The basic premise is that if you tell an uncooperative participant, for example, “We’ve already received a submission from this IP address” or “Your response has been flagged as a duplicate,” then you are giving that person more information about how your system works, which gives them a better idea of how to circumvent whatever protections you have in place. By accepting all responses, we divulge no information about how we detect duplicates and spam. We’ve witnessed that this approach leads to less sophisticated attacks, which are easier to defend against. On the other hand, an alternate system, in which the attacker is informed that a particular attempt to submit a duplicate response didn’t work, quickly leads to an arms race.

We use a variety of techniques on the backend to detect duplicates and spam. Finding duplicate IP addresses is just one technique. If used alone, it may incorrectly flag a response as a duplicate; for example, several members of the same household may submit entirely different responses from the same IP address, and we should not flag those as duplicates. After a first pass through the responses, in which our tools automatically remove any obvious duplicates, we do a second pass in which we manually review possible duplicates. We use a similar process for ensuring that respondents are in fact residents of a municipality.

We’re serious about providing secure, meaningful and painless budget consultations, and we take responsibility for providing validated results at the end of each consultation. We invite you to contact us to learn more about how we can together create a unique [Citizen Budget](http://citizenbudget.com/) that reflects the priorities of your municipality.