-- first cut solution
with cte as 
(select *, 
case when brand1 < brand2 then brand1 else brand2 end as b1,
case when brand1 > brand2 then brand1 else brand2 end as b2, 
case when custom1 = custom3 and custom2 = custom4 then 1 else 0 end as flag
from brands),
cte2 as 
(select b1 as brand1, b2 as brand2, year, custom1, custom2, custom3, custom4 
from cte 
where flag = 1 
group by b1, b2, year, custom1, custom2, custom3, custom4),
cte3 as 
(select brand1, brand2, year, custom1, custom2, custom3, custom4 
from cte 
where flag = 0)
select * from cte2
union all 
select * from cte3;
