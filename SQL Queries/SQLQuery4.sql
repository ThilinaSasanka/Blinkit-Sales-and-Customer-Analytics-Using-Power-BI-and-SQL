SELECT Item_Fat_Content,
		CAST(SUM(Sales)/ 1000 AS DECIMAL(10,2)) AS Total_Sales_Thousands,
		CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*)AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales_Thousands DESC

SELECT Top 5 Item_Type,
		CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*)AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC 

SELECT Outlet_Location_Type,
		ISNULL([Low Fat],0) AS Low_Fat,
		ISNULL([Regular],0) AS Regular
FROM
(
		SELECT Outlet_Location_Type, Item_Fat_Content,
				CAST(SUM(Sales) AS DECIMAL(10,2)) AS Sales
		FROM blinkit_data
		GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT
(
	SUM(Sales)
	FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;

SELECT Outlet_Establishment_Year,
		CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*)AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year DESC

SELECT 
	Outlet_Size,
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
	CAST((SUM(Sales) * 100.0/ SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;

SELECT Outlet_Location_Type,
		CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST((SUM(Sales) * 100.0/ SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
		CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*)AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC

SELECT Outlet_Type,
		CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST((SUM(Sales) * 100.0/ SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
		CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*)AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC

