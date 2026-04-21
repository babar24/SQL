-- first cut solution
with cte_1 as
(select hut1 as ht1, hut2 as ht2 from trails
union all 
select hut2 as ht1, hut1 as ht2 from trails),
src_trail as 
(select c1.ht1 as src1, c1.ht2 as src2, c2.ht2 as src3 from cte_1 c1
inner join cte_1 c2
on c1.ht2 = c2.ht1
where c1.ht1 <> c2.ht2)
select 
      mh1.name as start_pt,  
      mh2.name as middle_pt,
      mh3.name as end_pt
from mountain_huts mh1
inner join src_trail t1
on mh1.id = t1.src1
inner join mountain_huts mh2
on t1.src2 = mh2.id
inner join mountain_huts mh3
on t1.src3 = mh3.id
where mh1.altitude > mh2.altitude 
and mh2.altitude > mh3.altitude
order by start_pt