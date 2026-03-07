"Manhattanhenge" happens when the sunset aligns with the Manhattan street grid and the buildings frame the sun in a spectacle. It happens twice a year, a month away on either side of the summer solstice.  But plenty of street grids exist in the US, and DC has a lot of interesting diagonal straightaways. So I wanted to find out where and when we could have one!

Enter: Potomhenge!

At its core, the project is just a fancy GIS representation of solar proximity. I was walking along my street towards the Metro one morning when the sun was particularly bright; it was a perfect storm for the sun being just out of the "sunrise" color zone and not quite overhead enough to not blind me. My street is rotated at about 100degrees from North, so I wondered when in the year this occured.

I started the project in R initially, using leaflet, sf, and suncalc libraries to draw rays of disance (I think about 2km initially) in the solar azimuth direction each minute of 2026 relative to a provided lat/lon, initially just Washington Circle NW. However, I quickly realized that these azimuths change depending on latitude.
While DC is not large enough for that to make a significant difference, it would be more helpful if users could identify where they are so the rays reflect the ground experience. I borrowed some scripts from another map interactivity project I am working on to help. As I tried to develop a stronger UX, I ended up
moving things to be web-based. I had to re-learn some CSS and client-side JS for this, but I was surprised how much of it came back. 

For the future, I'm curious how I can extend its use cases. Photography is an obvious choice, and perhaps landmark identifiers to help plan good timing for shoots. Additionally, I see value in using these calculations to account for insolation within urban geographies, especially in junction with canopy studies.
