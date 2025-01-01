WITH local_rising_terms as
(
select * from {{ref('stg__top_rising_terms_riyadh')}}

)
,

top_international_terms as
(
select * from {{ref('stg__top_international_terms')}}
)
,
final as(
select 
lrt.week,
lrt.country_name,
lrt.country_code,
lrt.rank,
lrt.term as local_term_riyadh,
tit.term as international_term
from 
local_rising_terms AS lrt
LEFT JOIN
top_international_terms as tit
ON 
lrt.week = tit.week
and 
lrt.rank = tit.rank
)

select * from final

