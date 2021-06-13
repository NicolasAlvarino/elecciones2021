cd "C:\Users\nicol\OneDrive\Escritorio\Elecciones 2021"
use "r_elecciones_21.dta", clear

describe

keep id departamento provincia distrito nombre_local mesa votos_pl votos_fp primera_vuelta_fuerza_popular primera_vuelta_peru_libre
rename primera_vuelta_fuerza_popular pv_fp
rename primera_vuelta_peru_libre pv_pl
rename votos_pl sv_pl
rename votos_fp sv_fp

keep if sv_fp == 0 | sv_pl == 0
gen dif_fp = .
replace dif_fp = pv_fp - sv_fp if sv_fp == 0
gen dif_pl = .
replace dif_pl = pv_pl - sv_pl if sv_pl == 0


order departamento provincia distrito nombre_local mesa pv_fp sv_fp *
sort dif_fp
browse if dif_fp != .

order departamento provincia distrito nombre_local mesa pv_pl sv_pl *
sort dif_pl
browse if dif_pl != .
