SELECT 
	CASE 
		WHEN http_referer IS NULL THEN 'direct_type_in'
		WHEN http_referer = 'https://www.gsearch.com' THEN 'gsearch_organic'
		WHEN http_referer = 'https://www.bsearch.com' THEN 'bsearch_organic'
		ELSE 'other'
	END, 
    COUNT(distinct website_session_id) AS sessions
FROM website_sessions
WHERE
	utm_source IS NULL
GROUP BY 1
ORDER BY 2 DESC;    