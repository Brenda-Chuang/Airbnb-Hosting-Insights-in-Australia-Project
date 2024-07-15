select * from listings;

'''
Top hosts are those with the highest/most: (sort in order)
(1) Host response and acceptance rate,
(2) Overall rating
(3) Number of Review
'''

-- Top 10 hosts of all dataset

SELECT
	host_id, host_name,
	host_response_rate,	host_acceptance_rate,
	review_scores_rating,
	SUM(number_of_reviews) AS num_of_reviews
FROM listings
GROUP BY host_id, host_name, host_response_rate, host_acceptance_rate, review_scores_rating
ORDER BY review_scores_rating DESC NULLS LAST, 
         host_acceptance_rate DESC NULLS LAST, 
         host_response_rate DESC NULLS LAST, 
         num_of_reviews DESC NULLS LAST
LIMIT 10;

-- Top 1 rated host in each state (WA, NSW, VIC, QLD)

SELECT
	host_id,
    host_name,
    state,
    CONCAT(ROUND(response_rate * 100, 0), '%') AS response_rate_percent,
    CONCAT(ROUND(acceptance_rate * 100, 0), '%') AS acceptance_rate_percent,
    overall_rating,
    num_of_reviews
    --rank_by_reviews
FROM
	(SELECT
		host_id, host_name, listings.state as state,
		host_response_rate as response_rate, 
		host_acceptance_rate as acceptance_rate,
		review_scores_rating as overall_rating, SUM(number_of_reviews) AS num_of_reviews,
		RANK() OVER(PARTITION BY listings.state 
					ORDER BY review_scores_rating DESC NULLS LAST, 
         						host_acceptance_rate DESC NULLS LAST, 
         						host_response_rate DESC NULLS LAST, 
         						SUM(number_of_reviews) DESC NULLS LAST) AS rank_by_reviews
	FROM listings
	GROUP BY 1,2,3,4,5,6)
WHERE rank_by_reviews <=1
;

-- Top 1 dominant host in each state (the hosts with the most listings)


WITH rank_listings AS
	(SELECT
		host_id, host_name, listings.state AS state,
		COUNT(*) AS number_of_listings,
		RANK() OVER(PARTITION BY listings.state ORDER BY COUNT(*) DESC) AS rank_by_num_of_listings
	FROM listings
	GROUP BY 1,2,3)

SELECT host_id, host_name, state,
		number_of_listings
FROM rank_listings
WHERE rank_by_num_of_listings = 1;


-- For the top 1 dominant host in WA categorised by neighbourhood(suburb), 
-- What is his/her revenue of all suburbs and in each suburb in the next 30 days at the time the data was scrapped?

'''
	Suppose the properties are booked and not blocked by the host. 
	The top 1 dominant host is Let Go, who owns 86 Airnan listings,
	and he is about to earn AU$ 455,962 in the next 30 days at the time the data was scrapped.
	
'''

WITH top_WA_host AS
	(SELECT 
		l.host_id, host_name, l.state,
			COUNT(*) AS number_of_listings
	FROM listings l
	WHERE state = 'Western Australia'
	GROUP BY 1,2,3
	ORDER BY COUNT(*) DESC
	LIMIT 1),
	rev_1 AS
	(SELECT 
		neighbourhood AS suburb,
		price,
		COUNT(*) AS num_of_listings,
		SUM((30 - availability_30)) AS days_booked,
		price * SUM((30 - availability_30)) AS revenue
		
	FROM listings l1
	RIGHT JOIN top_WA_host l2 ON l1.host_id = l2.host_id
	GROUP BY 1,2)

SELECT 
	host_name, state, suburb,
	SUM(num_of_listings) AS num_of_listings,
	ROUND(AVG(days_booked),0) AS avg_days_booked,
	ROUND(AVG(price),0) AS avg_price,
	SUM(revenue) AS revenue,
	number_of_listings AS total_listings,
	SUM(SUM(revenue)) OVER() AS total_revenue
FROM top_WA_host, rev_1
GROUP BY 1,2,3,8
ORDER BY revenue DESC


select * from listings
where host_name = 'Let Go'


-- Property feature 

-- What is the most common property type and room type across each state?

SELECT 
l.state,
property_type,
room_type,
MAX(COUNT(*)) OVER(PARTITION BY l.state)
FROM listings l
GROUP BY 1,2,3
ORDER BY COUNT(*) DESC










