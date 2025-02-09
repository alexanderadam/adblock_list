# Alex’s uBlock List (also works with other Blockers)

This is a curated list of rules designed to enhance your browsing experience by blocking cluttering and other unwanted web content.

This means that it will intentionally block popups, "also read" sections, newsletter forms, recommended articles within article texts, annoying requests to use paid subscriptions and other elements that might distract reading [on websites](hosts.md).
Furthermore it will lower the opacity of paid articles and remove the blur effect of paywalled excerpts.
This list aims to provide a cleaner, faster, and more enjoyable browsing experience.

## Features

- **Comprehensive Blocking** of clutter and annoyances
- **Easy to Use**: Easily integrate with popular adblockers like [uBlock Origin](https://ublockorigin.com/).

Enjoy a cleaner and more enjoyable browsing experience!

## Installation

You can try to click on the following link:

[Add to uBlock Origin](abp:subscribe?location=https://alexanderadam.github.io/adblock_list/alexanderadam.txt&title=AlexsList)

or you can follow these steps:

To use this adblock list with [uBlock Origin](https://ublockorigin.com/) or a compatible adblocker, [follow these steps](https://github.com/gorhill/uBlock/wiki/Dashboard:-Filter-lists#adding-manually):

1. Open your adblocker's dashboard (i.e. [like this](https://github.com/gorhill/uBlock/wiki/Dashboard#you-can-access-ublock-origin-ubos-dashboard-by-)).
2. Navigate to [the "_Filter lists_" tab](https://github.com/gorhill/ublock/wiki/Dashboard:-Filter-lists).
3. [At the bottom, find the "_Import..._" option and click it](https://github.com/gorhill/ublock/wiki/Dashboard:-Filter-lists#adding-manually).
4. Paste [the following URL](https://raw.githubusercontent.com/alexanderadam/adblock_list/main/alexanderadam.txt) into the text box and apply changes:

```
https://raw.githubusercontent.com/alexanderadam/adblock_list/main/alexanderadam.txt
```

## Why?

Visual clutter can significantly affect how the brain processes information.
It can increase _mental fatigue_, as our brains struggle to process multiple objects at once.
The brain has _limited capacity_ for visual processing, meaning it can't effectively see all items in a cluttered environment simultaneously.
Objects compete for attention in the visual system, with more prominent or relevant items gaining priority, while less noticeable items are harder to focus on.

Many researchers studied this field and all sources that I found agree that _visual clutter can have a significant impact on cognitive processing_.
Studies show that when objects are organized into _clear groups_, it _reduces_ competition, making them _easier_ to process, while _disorganized_ objects demand _more mental effort_ and attention.
This excess mental effort from clutter can lead to irritability, decreased focus, and a drain on cognitive resources.

Thus, with these blocking and style rules, I'm trying to declutter various websites to _improve our focus and mental efficiency_ when consuming information online.

**TL;DR:** Ad-blocking rules that remove distracting elements could enhance cognitive processing by reducing visual clutter, allowing for clearer focus on essential information.

**Sources:**
- [researchgate.net](https://www.researchgate.net/publication/378530572_Spatial_context_non-uniformly_modulates_inter-laminar_communication_in_the_primary_visual_cortex)
- [news.yale.edu](https://news.yale.edu/2024/10/22/visual-clutter-alters-information-flow-brain)
- [researchgate.net](https://www.researchgate.net/publication/246929018_Neural_mechanisms_of_attentional_selection) / [annualreviews.org](https://www.annualreviews.org/content/journals/10.1146/annurev.ne.18.030195.001205)
- [web.archive.org](https://web.archive.org/web/20130119055129/http://www.ionpsych.com/2011/03/24/visual-clutter-its-worse-than-you-think/)

## Disclaimer

The rules might change the display of websites significantly. Things might not work as expected, and some websites might not work at all. If you encounter any issues, please [open an issue](https://github.com/alexanderadam/adblock_list/issues/new) with a detailed description of the problem, including the URL of the website and screenshots if possible.
You will find the affected hosts [here](hosts.md).

**PS:** You can also check out the [source code](https://github.com/alexanderadam/adblock_list) for this project.
