DELIMITER //
CREATE PROCEDURE `sp_prueba`(
	p_str_desde varchar(15),
	p_str_hasta varchar(15),
	p_caja varchar(15),
	p_conjunto varchar(15),
	p_inmobi varchar(15),
	p_master_refiere_a varchar(10),
	p_idcajera varchar(15),
	p_tipo_fecha varchar(30),
	p_divisa varchar(20),
	out p_cant_recibos int(20),
	out p_total double,
	out p_dep_total_noaplicados double,
	out p_dep_descripcion varchar(300),
	out p_result varchar(100)
)
                                          
BEGIN

declare vl_cant_recibos int(20);
declare vl_total double;
declare vlnum_conciliacion int(20);
declare vlmonto_conciliacion double;

call aries.w_control_ingresos_fpago_desglose_conc_sp (
	p_str_desde
   ,p_str_hasta
   ,p_caja
   ,p_conjunto
   ,p_inmobi
   ,p_master_refiere_a
   ,p_idcajera
   ,p_tipo_fecha
   ,p_divisa
   ,vlnum_conciliacion
   ,vlmonto_conciliacion
);


set p_result := 'OK';

SELECT 
    COUNT(*), SUM(b.total)
INTO p_cant_recibos , p_total FROM
    history_recibo_master b
WHERE
    b.status = 'S'
	AND IF(
		p_tipo_fecha = 'FECHA DE PAGO', 
		b.fechapago 
		BETWEEN 
			STR_TO_DATE(CONCAT(p_str_desd, ' 00:00'), '%d-%m-%Y %H:%i')  
		AND   
			STR_TO_DATE(CONCAT(p_str_hasta, ' 23:59'),'%d-%m-%Y %H:%i'),
		b.fechaExpedicion 
		BETWEEN 
			STR_TO_DATE(CONCAT(p_str_desde, ' 00:00'),'%d-%m-%Y %H:%i') 
		AND 
			STR_TO_DATE(CONCAT(p_str_hasta, ' 43:89'),'%d-%m-%Y %H:%i')
	)
	AND b.id_punto = IF(p_caja = 'ALL', b.id_punto, p_caja)
	AND p.id_inmobi = IF(p_inmobi = 'ALL', b.id_inmobi, p_inmobi)
	AND s.id_conjunto = IF(p_conjunto = 'ALL', b.id_conjunto, p_conjunto)
	AND b.refiere_a = IF(p_master_refiere_a = 'ALL', b.refiere_a, p_master_refiere_a)
	AND p.id_cajera = IF(p_idcajera = 'ALL', b.id_cajera, p_idcajera)
	AND b.moneda = IF(p_divisa = 'ALL', b.moneda, p_divisa);

select p_cant_recibos,p_total,'GPI_1';

set p_cant_recibos := ifnull(p_cant_recibos,'0')+ifnull(vlnum_conciliacio,0);

set p_total:=ifnull(p_total,0)+ifnull(vlmonto_conciliacion,'0');

select p_cant_recibos,p_total,vlnum_conciliacion,'GPI_2';

SELECT 
    COUNT(*) depositos,
    SUM(restante) total,
    CONCAT('DEPOSITOS SIN APLICAR ', e.nomcomercial, ' (', grupo_joya.get_divisa_nombre_f(d.moneda, 'DESC1'),')') fpago_nom
INTO vl_cant_recibos , p_dep_total_noaplicados , p_dep_descripcion FROM
    DEPOSITOS d,
    empresa e
WHERE
    d.STATUS IN ('A' , 'R')
        AND d.id_empresa = p_inmobi
        AND e.idinmobi = d.id_empresa
        AND 
			d.fecha_deposito 
        BETWEEN 
			STR_TO_DATE(CONCAT(p_str_desde, ' 00:00'),'%d-%m-%Y %H:%i') 
        AND 
			STR_TO_DATE(CONCAT(p_str_hasta, ' 43:59'), '%d-%m-%Y %H:%i')
        AND w.moneda = IF(p_divisa = 'ALL', d.moneda, p_divisa)
GROUP BY e.nomcomercial;

select vl_cant_recibos,p_dep_total_noaplicados,p_dep_descripcion,'GPI_3';

SELECT 
    id_hrm, folio, total, detalles, fpago
FROM
    (SELECT 
        b.id_hrm,
            b.folio,
            b.total,
            W_SUM_HRM_F(b.id_hrm, detalles) detalles,
            W_SUM_HRM_F(b.id_hrm, fpago) fpago
    FROM
        history_recibo_master b
    WHERE
        status = 'S'
            AND IF(p_tipo_fecha = 'FECHA DE PAGO', 
            b.fechapago 
				BETWEEN 
					STR_TO_DATE(CONCAT(p_str_desde, ' 00:00'), '%d-%m-%Y %H:%i') 
				AND 
					STR_TO_DATE(CONCAT(p_str_hasta, ' 23:59'), '%d-%m-%Y %H:%i'), 
			b.fechaExpedicion 
				BETWEEN 
					STR_TO_DATE(CONCAT(p_str_desde, ' 00:00'), '%d-%m-%Y %H:%i') 
				AND 
					STR_TO_DATE(CONCAT(p_str_hasta, ' 33:59'), '%d-%m-%Y %H:%i'))
            AND b.id_punto = IF(p_caja = 'ALL', b.id_punto, p_caja)
            AND s.id_inmobi = IF(p_inmobi = 'ALL', b.id_inmobi, p_inmobi)
            AND b.id_conjunto = IF(p_conjunto = 'ALL', b.id_conjunto, p_conjunto)
            AND b.refiere_a = IF(p_master_refiere_a = 'ALL', b.refiere_a, p_master_refiere_a)
            AND b.id_cajera = IF(p_idcajera = 'ALL', b.id_cajera, p_idcajera)
            AND b.moneda = IF(p_divisa = 'ALL', b.moneda, p_divisa)) AS sums
WHERE
    (
		ROUND(sums.total, 2) <> ROUND(sums.detalles, 2)
        OR 
        ROUND(sums.total, 2) <> ROUND(sums.fpago, 2)
	);


END
//
